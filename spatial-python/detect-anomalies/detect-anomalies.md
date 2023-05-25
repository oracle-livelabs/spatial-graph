# Detect Anomalies


## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Task 1: ... 



1.  Import libraries for ...

     ```
     <copy>
     import pandas as pd
     import numpy as np
     from st_dbscan import ST_DBSCAN
     </copy>
     ```

     ![Navigate to Oracle Database]()

1.  ...

     ```
     <copy>
     cust=1
     </copy>
     ```

1. ...

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



1. ...

     ```
     <copy>
     st_cluster = ST_DBSCAN(eps1 = 5000, eps2 = 3000000, min_samples = 5)
     st_cluster.fit(data)
     </copy>
     ```

1. ...

     ```
     <copy>
     np.unique(st_cluster.labels)
     </copy>
     ```

1. ...

     ```
     <copy>
     df = pd.DataFrame(data={'trans_id': df.trans_id, 'label': st_cluster.labels})
     df.head()
     </copy>
     ```

1. ...

     ```
     <copy>
      df.query("trans_id == 819")
     </copy>
     ```

1. ...

     ```
     <copy>
     cursor.execute("create table transaction_labels (trans_id integer, label integer)")
     </copy>
     ```

1. ...

     ```
     <copy>
     cursor.executemany("insert into transaction_labels values (:1, :2)", list(df[['trans_id','label']].itertuples(index=False, name=None)))
     connection.commit()
     </copy>
     ```


1. ...

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


2. ...

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
      # Create view
      cursor.execute("""create or replace view v_st_cluster_centroids as
             SELECT b.label, min(trans_epoch_date) as min_time, max(trans_epoch_date) as max_time,
             (SDO_AGGR_CENTROID(SDOAGGRTYPE(proj_geom, 0.005))) as proj_geom, count(*) as trans_count
             FROM v_transactions a, transaction_labels b
             where a.trans_id=b.trans_id
             and b.label != -1
             group by label""")
      </copy>
      ```


3. ...

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
    and sdo_within_distance(x.proj_geom, y.proj_geom, 'distance=1000 unit=KM') = 'FALSE'
          """)
   gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id','trans_epoch_date','geometry', 'trans_id','label','outlier_to_label','distance'])
   gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
   gdf = gdf.set_crs(3857)
   gdf.head()
   </copy>
   ```

... repeat for other cust_id...


You may now proceed to the next lab.

## Learn More
* 

## Acknowledgements
* **Author** - 
