# Detect suspicious transactions


## Introduction

The spatial features of Oracle Database provide scalable and secure spatial data management, processing, and analysis. A major benefit of working in Python is the availability of open source libraries to augment the native analysis capabilities of the Oracle Database. In this lab you leverage a library that clusters data based on both space and time, or in other words spatiotemporal clusters. This is useful for the purpose of detecting suspicious financial transactions.


Estimated Lab Time: xx minutes

### Objectives

* Load transactions data from Oracle Spatial to Python
* Detect spatiotemporal clusters representing expected behavior
* Identify spatiotemporal outliers that represent suspicious behavior

### Prerequisites

* Completion of previous lab

## Task 1: Prep for cluster detection


1.  Begin by importing libraries needed for detecting spatiotemporal clusters. The main library is st\_dbscan. Also, the pandas and numpy libraries are required for configuration of the input to st\_dbscan. 

     ```
     <copy>
     import pandas as pd
     import numpy as np
     from st_dbscan import ST_DBSCAN
     </copy>
     ```

     ![desc here](images/detect-anomalies-01.png)


5. The result of cluster detection is a "label" for every data item indicating if the item is part of a cluster, and if so which cluster. You will perform cluster analysis and save the results to the database for further analysis. Run the following to create a database table that will store cluster labels.

     ```
     <copy>
     cursor.execute("create table transaction_labels (trans_id integer, label integer)")
     </copy>
     ```

    ![desc here](images/detect-anomalies-02.png)

## Task 2: Detect spatiotemporal clusters 

1.  In this workshop you will analyze transactions for one customer at a time. Run the following to set a variable for the customer id for analysis. You will return to this cell to switch to a different customer for analysis.

     ```
     <copy>
     cust=1
     </copy>
     ```
     ![desc here](images/detect-anomalies-03.png)

2. Create a GeoDataframe of customer's transactions. Notice the binding syntax in the WHERE clause (cust\_id=:cust) supported by the python-oracledb driver.

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

     ![desc here](images/detect-anomalies-04.png)

2.   The st\_dbscan library requires input in numpy format, where numpy is a library for handling arrays.  Run the following two steps to convert your GeoDataFrame to a numpy array.
    
     ```
     <copy>
     # first convert to pandas dataframe
     df = pd.DataFrame(data={'time': gdf.epoch_date, 'x': gdf.geometry.x, 'y': gdf.geometry.y, 'trans_id':  gdf.trans_id, 'cust_id':gdf.cust_id})
     df.head()
     </copy>
     ```

     ```
     <copy>
     # then convert to numpy array
     data = df.values
     data = np.int_(data)
     data[1:10]
     </copy>
     ```

     ![desc here](images/detect-anomalies-05.png)

3. You are now ready to detect spatiotemporal clusters for the current customer's transactions. The operation accepts three threshold parameters: distance, time, and minimum number of items. Items with neighbors within the distance and time thresholds are considered part of a cluster, and there most be at least the minimum number of items to qualify as a cluster. Distance is in the units of the coordinate system, which in this case is meters. Time is in seconds. Run the following to detect clusters where the thresholds are 5 or more items within 5KM and roughly 1 month.

     ```
     <copy>
     st_cluster = ST_DBSCAN(eps1 = 5000, eps2 = 3000000, min_samples = 5)
     st_cluster.fit(data)
     </copy>
     ```

    ![desc here](images/detect-anomalies-06.png)

4. The result is an integer label for each input item. Each label >=0 represents a cluster. The label -1 indicates the item is not part of a cluster. Review the distinct set of resulting labels. Observe that there was one cluster detected. 

     ```
     <copy>
     np.unique(st_cluster.labels)
     </copy>
     ```

    ![desc here](images/detect-anomalies-07.png)

5. Run the following to add the cluster labels to transactions and print the first several rows. Each transaction is labelled with either -1 (meaning not part of a cluster) or an integer >=0 (meaning the cluster the item belongs to).

     ```
     <copy>
     df = pd.DataFrame(data={'trans_id': df.trans_id, 'label': st_cluster.labels})
     df.head()
     </copy>
     ```

    ![desc here](images/detect-anomalies-08.png)

6. Detecting anomalies will require database queries involving the cluster labels. So run the following to insert the the current customer's labelled transactions to the TRANSACTION\_LABELS table created in the previous task.

     ```
     <copy>
     cursor.executemany("insert into transaction_labels values (:1, :2)", list(df[['trans_id','label']].itertuples(index=False, name=None)))
     connection.commit()
     </copy>
     ```

    ![desc here](images/detect-anomalies-09.png)

1. Run the following to retrieve current customer's transactions with their cluster labels.

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
    ![desc here](images/detect-anomalies-10.png)

1. Run the following to visualize the current customer's labelled transactions. In this case you include the parameter for color coding the items based on cluster label. You may also mouse over an item to see its attributes including the cluster label.

      ```
      <copy>
      gdf.explore("label", categorical="True", tiles="CartoDB positron", marker_kwds={"radius":4}) 
      </copy>
      ```
    ![desc here](images/detect-anomalies-11.png)


1. Zooming into the area of Austin, TX where the current customer's transaction locations are concentrated, observe the color coding indicating which are part of the spatiotemporal cluster.

      ```
      <copy>
      gdf.explore("label", categorical="True", tiles="CartoDB positron", marker_kwds={"radius":4}) 
      </copy>
      ```
    ![desc here](images/detect-anomalies-12.png)


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

* For details on st\_dbscan see [ST-DBSCAN: An algorithm for clustering spatial–temporal data](https://www.sciencedirect.com/science/article/pii/S0169023X06000218) and [https://github.com/eren-ck/st_dbscan](https://github.com/eren-ck/st_dbscan)

## Acknowledgements

- **Author** - David Lapp, Database Product Management, Oracle
- **Last Updated By/Date** - David Lapp, Database Product Management, June, 2023
