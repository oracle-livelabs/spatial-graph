# Detect Anomalies


## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Task 1: Prep for cluster detection


1.  Import additional libraries needed for detecting spatiotemporal clusters.

     ```
     <copy>
     import pandas as pd
     import numpy as np
     from st_dbscan import ST_DBSCAN
     </copy>
     ```

     ![Navigate to Oracle Database]()


5. Create table that will store cluster labels.

     ```
     <copy>
     cursor.execute("create table transaction_labels (trans_id integer, label integer)")
     </copy>
     ```

## Task 2: Detect spatiotemporal clusters 

2.  Set the customer id for analysis.

     ```
     <copy>
     cust=1
     </copy>
     ```

3. Create GeoDataframe of customer's transactions.

      ```
      <copy>
      cursor.execute("""
       SELECT a.cust_id,  a.trans_id, a.trans_epoch_date, 
        (lonlat_to_proj_geom(b.lon,b.lat)).get_wkt() 
       from transactions a, locations b
       where a.location_id=b.location_id
       and cust_id=:cust""", cust=cust)
      gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id', 'trans_id', 'epoch_date', 'geometry'])
      gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
      gdf.head()
      </copy>
      ```


2.   Convert to np array for st_dbscan
    
     ```
     <copy>
     # first convert to pd dataframe
     df = pd.DataFrame(data={'time': gdf.epoch_date, 'x': gdf.geometry.x, 'y': gdf.geometry.y, 'trans_id':  gdf.trans_id, 'cust_id':gdf.cust_id})
     df.head()
     </copy>
     ```

     ```
     <copy>
     #then convert to np array
     data = df.values
     data = np.int_(data)
     data[1:10]
     </copy>
     ```


1. Run spatiotemporal cluster model, where parameters are distance threshold (m), time threshold (sec), and number of items threshold.

     ```
     <copy>
     st_cluster = ST_DBSCAN(eps1 = 5000, eps2 = 3000000, min_samples = 5)
     st_cluster.fit(data)
     </copy>
     ```

2. Review the resulting labels, where -1 is assigned to items not in a cluster.

     ```
     <copy>
     np.unique(st_cluster.labels)
     </copy>
     ```

3. Add cluster labels to transactions.

     ```
     <copy>
     df = pd.DataFrame(data={'trans_id': df.trans_id, 'label': st_cluster.labels})
     df.head()
     </copy>
     ```


6. Insert labelled transactions to table.

     ```
     <copy>
     cursor.executemany("insert into transaction_labels values (:1, :2)", list(df[['trans_id','label']].itertuples(index=False, name=None)))
     connection.commit()
     </copy>
     ```


1. Explore labelled transactions.

      ```
      <copy>
      # labelled transactions for customer
      cursor.execute("""
       SELECT a.cust_id, a.location_id, a.trans_id, a.trans_epoch_date, 
       (lonlat_to_proj_geom(b.lon,b.lat)).get_wkt(), c.label
       from transactions a, locations b, transaction_labels c
       where a.location_id=b.location_id
       and a.trans_id=c.trans_id
       """)
      gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id', 'location_id', 'trans_id', 'trans_epoch_date', 'geometry','label'])
      gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
      gdf = gdf.set_crs(3857)
      gdf.head()
      </copy>
      ```


      ```
      <copy>
      gdf.explore("label", categorical="True", tiles="CartoDB positron", marker_kwds={"radius":4}) 
      </copy>
      ```

## Task 3: Detect anomalies

2. Create centroids for clusters with attributes for label and time range.

      ```
      <copy>
      # st cluster centroids for customer
      cursor = connection.cursor()
      cursor.execute("""
             SELECT label, min(trans_epoch_date) as min_time, max(trans_epoch_date) as max_time,
             SDO_AGGR_CENTROID(SDOAGGRTYPE(lonlat_to_proj_geom(b.lon,b.lat), 0.005)).get_wkt() as geometry, 
             count(*) as trans_count
             FROM transactions a, locations b, transaction_labels c
             where a.location_id=b.location_id
             and a.trans_id=c.trans_id
             and c.label != -1
             group by label
             """)
      gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['label','min_time','max_time','geometry','trans_count'])
      gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
      gdf = gdf.set_crs(3857)
      gdf.head()
      </copy>
      ```

      ```
      <copy>
      gdf.explore(tiles="CartoDB positron", marker_kwds={"radius":4})
      </copy>
      ```


3. Detect transactions within time range of cluster and located at a distance greater than a threshold.

      ```
      <copy>
      cursor = connection.cursor()
      cursor.execute("""
      with 
         x as (
             SELECT a.cust_id, a.location_id, a.trans_id, a.trans_epoch_date, 
              lonlat_to_proj_geom(b.lon,b.lat) as proj_geom, c.label
             from transactions a, locations b, transaction_labels c
             where a.location_id=b.location_id
             and a.trans_id=c.trans_id ),
         y as (
             SELECT label, min(trans_epoch_date) as min_time, max(trans_epoch_date) as max_time,
              SDO_AGGR_CENTROID(SDOAGGRTYPE(lonlat_to_proj_geom(b.lon,b.lat), 0.005)) as proj_geom, 
              count(*) as trans_count
             FROM transactions a, locations b, transaction_labels c
             where a.location_id=b.location_id
             and a.trans_id=c.trans_id
             and c.label != -1
             group by label)
       select x.cust_id, x.trans_epoch_date, (x.proj_geom).get_wkt(), x.trans_id, x.label, y.label,
            sdo_geom.sdo_distance(x.proj_geom, y.proj_geom, 0.05)
       from x, y
       where x.trans_epoch_date between y.min_time and y.max_time
       and x.label!=y.label
       and x.label=-1
       and sdo_within_distance(x.proj_geom, y.proj_geom, 'distance=500 unit=KM') = 'FALSE'
             """)
      gdfAnomaly = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id','trans_epoch_date','geometry', 'trans_id','label','outlier_to_label','distance'])
      gdfAnomaly['geometry'] = shapely.from_wkt(gdfAnomaly['geometry'])
      gdfAnomaly = gdfAnomaly.set_crs(3857)
      gdfAnomaly.head()
      </copy>
      ```


      ```
      <copy>
      m = gdf.explore(tiles="CartoDB positron", marker_type='circle_marker', marker_kwds={"radius":"5"}, style_kwds={"color":"blue","fillColor":"blue", "fillOpacity":"1"})
      m = gdfAnomaly.explore(m=m, marker_type='circle_marker', marker_kwds={"radius":"5"}, style_kwds={"color":"red","fillColor":"red", "fillOpacity":"1"} )
      m
      </copy>
      ```


1. Scroll up in notebook and repeat for other customers.


You may now proceed to the next lab.

## Learn More
* 

## Acknowledgements
* **Author** - 
