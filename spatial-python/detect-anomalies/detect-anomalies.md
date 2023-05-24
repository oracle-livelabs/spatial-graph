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

1. ...

      ```
      <copy>
      cursor.execute("""
       SELECT cust_id, trans_id, trans_epoch_date, (proj_geom).get_wkt() 
       FROM v_transactions 
       where cust_id=:cust""",cust=cust)
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
     #cursor.execute("create table transaction_labels (trans_id integer, label integer)")
     cursor.execute("delete from transaction_labels")
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
       SELECT a.cust_id, a.location_id, a.trans_id, a.trans_epoch_date, (proj_geom).get_wkt(), b.label
       from v_transactions a, transaction_labels b
       where a.trans_id=b.trans_id
       """, cust=cust)
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

      ```
      <copy>
      # create view of Labelled transactions for customer
      cursor.execute("""
       create or replace view v_transactions_labelled as
       SELECT a.cust_id, a.location_id, a.trans_id, a.trans_epoch_date, proj_geom , b.label
       from v_transactions a, transaction_labels b
       where a.trans_id=b.trans_id
       """)
      </copy>
      ```

      ```
      <copy>
      cursor.execute("select cust_id, location_id, trans_id, trans_epoch_date, (proj_geom).get_wkt(),label from v_transactions_labelled")
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
      cursor = connection.cursor()
      cursor.execute("""
             SELECT b.label, min(trans_epoch_date) as min_time, max(trans_epoch_date) as max_time,
             (SDO_AGGR_CENTROID(SDOAGGRTYPE(proj_geom, 0.005))).get_wkt() as geometry, count(*) as trans_count
             FROM v_transactions a, transaction_labels b
             where a.trans_id=b.trans_id
             and b.label != -1
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
    select a.trans_epoch_date, (a.proj_geom).get_wkt(), a.trans_id, a.label, b.label,
    sdo_geom.sdo_distance(a.proj_geom,b.proj_geom,0.05)
    from v_transactions_labelled a, v_st_cluster_centroids b
    where a.trans_epoch_date between b.min_time and b.max_time
    and a.label!=b.label
   and a.label=-1
    and sdo_within_distance(a.proj_geom, b.proj_geom, 'distance=1000 unit=KM') = 'FALSE'
    """)
   for row in cursor.fetchmany(size=10):
   print(row)
   </copy>
   ```




You may now proceed to the next lab.

## Learn More
* 

## Acknowledgements
* **Author** - 
