# Detect suspicious transactions

## Introduction

The spatial features of Oracle AI Database provide scalable and secure spatial data management, processing, and analysis. A major benefit of working in Python is the availability of open source libraries to augment the native analysis capabilities of the Oracle AI Database. In this lab you leverage a library that identifies clusters based on both space and time, or in other words spatiotemporal clusters. A set of transactions that occurred within a concentrated area and time window belong to a spatiotemporal cluster. A transaction that occurred within the time window of a spatiotemporal cluster but far from the area of concentration is considered suspicious. For example, if during a given week a customer's transactions were concentrated in the New York City area, then a transaction in the middle of that week in California would be suspicious. You will identify such occurrences in this lab.

Estimated Lab Time: 15 minutes

### Objectives

* Load transactions data from Oracle Spatial to Python
* Detect spatiotemporal clusters representing expected behavior
* Identify outliers that represent suspicious behavior

### Prerequisites

* Completion of Lab 5: Explore data

## Task 1: Experiment with spatial aggregation

To calculate the distance of transactions from a spatiotemporal cluster, it is convenient to represent the cluster as a single geometry. This is a use case for spatial aggregation, where a set of geometries is represented by a single aggregate. Oracle Spatial provides a package of spatial aggregate functions for just this purpose. This task is meant to familiarize you with spatial aggregation.

1. Begin by creating a GeoDataFrame of items from the **LOCATIONS** table locations within 10 miles of a longitude/latitude coordinate in Austin, TX (-97.7431,30.2672).

      ```
      <copy>
      cursor = connection.cursor()
      cursor.execute("""
       SELECT (lonlat_to_proj_geom(lon,lat)).get_wkt() as geometry
       FROM locations
       WHERE sdo_within_distance(
                 lonlat_to_proj_geom(lon,lat),
                 lonlat_to_proj_geom(-97.7431,30.2672),
                 'distance=10 unit=MILE') = 'TRUE'
             """)
      gdfPoints = gpd.GeoDataFrame(cursor.fetchall(), columns = ['geometry'])
      gdfPoints['geometry'] = shapely.from_wkt(gdfPoints['geometry'])
      gdfPoints.crs = "EPSG:3857"
      gdfPoints.head()
      </copy>
      ```

    ![detect anomalies](images/spatial-agg-00.png)

2. Next create a GeoDataFrame containing the location in the center of the previously selected locations. This location is referred to as an "aggregate centroid", hence the GeoDataFrame is named gdfAggCent.

      ```
      <copy>
      cursor.execute("""
       SELECT SDO_AGGR_CENTROID(
                SDOAGGRTYPE(lonlat_to_proj_geom(lon,lat), 0.005)).get_wkt() as geometry
       FROM locations
       WHERE sdo_within_distance(
                 lonlat_to_proj_geom(lon,lat),
                 lonlat_to_proj_geom(-97.7431,30.2672),
                 'distance=10 unit=MILE') = 'TRUE'
             """)
      gdfAggCent = gpd.GeoDataFrame(cursor.fetchall(), columns = ['geometry'])
      gdfAggCent['geometry'] = shapely.from_wkt(gdfAggCent['geometry'])
      gdfAggCent.crs = "EPSG:3857"
      gdfAggCent
      </copy>
      ```

    ![detect anomalies](images/spatial-agg-01.png)

3. Next create a GeoDataFrame containing the shape that bounds the locations near the coordinate in Austin, TX. This is referred to as a "aggregate convex hull", hence the GeoDataFrame is named gdfAggHull.

      ```
      <copy>
      cursor.execute("""
       SELECT SDO_AGGR_CONVEXHULL(
                SDOAGGRTYPE(lonlat_to_proj_geom(lon,lat), 0.005)).get_wkt() as geometry
       FROM locations
       WHERE sdo_within_distance(
                 lonlat_to_proj_geom(lon,lat),
                 lonlat_to_proj_geom(-97.7431,30.2672),
                 'distance=10 unit=MILE') = 'TRUE'
             """)
      gdfAggHull = gpd.GeoDataFrame(cursor.fetchall(), columns = ['geometry'])
      gdfAggHull['geometry'] = shapely.from_wkt(gdfAggHull['geometry'])
      gdfAggHull.crs = "EPSG:3857"
      gdfAggHull
      </copy>
      ```

    ![detect anomalies](images/spatial-agg-02.png)

    There are several other spatial aggregate functions that follow the same pattern.

4. Now you may visualize the points and the two spatial aggregates you've created. The original locations are shown in blue, and the aggregate centroid and aggregate convex hull are shown in red.

      ```
      <copy>
      m = gdfPoints.explore(tiles="CartoDB positron",
                             style_kwds={"color":"blue","fillColor":"blue"})
      m = gdfAggHull.explore(m=m,
                             style_kwds={"color":"red","fillOpacity":"0"} )
      m = gdfAggCent.explore(m=m,
                             marker_kwds={"radius":"8"},
                            style_kwds={"color":"red","fillColor":"red","fillOpacity":".7"} )
      m
      </copy>
      ```

    ![detect anomalies](images/spatial-agg-03.png)

 You will next identify suspicious transactions that occur during the time range of a spatiotemporal cluster but at a distance greater than a threshold. Since the area covered by a spatiotemporal cluster is insignificant compared to the distance threshold for a suspicious transaction, you will use the aggregate centroid to represent the location of a spatiotemporal cluster.

## Task 2: Prep for cluster detection

1. Begin by importing libraries needed for detecting spatiotemporal clusters. The main library is st\_dbscan. Also, the pandas and numpy libraries are required for configuration of the input to st\_dbscan.

     ```
     <copy>
     import pandas as pd
     import numpy as np
     from st_dbscan import ST_DBSCAN
     </copy>
     ```

     ![detect anomalies](images/detect-anomalies-01.png)

2. Now let's run through an example of detecting spatiotemporal clusters. Run the following to create a GeoDataFrame with some locations each having epoch time and an ID.
      ```
      <copy>
      gdf = gpd.GeoDataFrame({
          "id": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
          "epoch_date": [1704096000, 1687881600, 1687968000, 1688054400, 1688140800, \
                         1688227200, 1672656000, 1672742400, 1672828800,  1016730016, \
                         1673001600, 1673001600, 1672915200, 673001600, 1688054400],
          "geometry": ["POINT(-115.2368 36.2650)",
                      "POINT(-115.1356 36.1823)",
                      "POINT(-115.1492 36.1779)",
                      "POINT(-115.1385 36.1910)",
                      "POINT(-115.1256 36.1804)",
                      "POINT(-115.1329 36.1735)",
                      "POINT(-115.1711 36.1212)",
                      "POINT(-115.1656 36.1228)",
                      "POINT(-115.1782 36.1221)",
                      "POINT(-115.1695 36.1253)",
                      "POINT(-115.1790 36.1254)",
                      "POINT(-115.1388 36.1858)",
                      "POINT(-115.1669 36.1176)",
                      "POINT(-115.1755 36.1199)",
                      "POINT(-115.1297 36.1900)",
          ],})
      # convert to Shapely geometries
      gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
      # assign longitude/latitude coordinate system
      gdf = gdf.set_crs(4326)
      gdf
      </copy>
      ```

    ![detect anomalies](images/detect-simple-01.png)

​
3. The ST\_DBSCAN library requires that coordinates be in the same unit as distance measurement. Therefore, run the following to convert the coordinate system from longitude/latitude to projected x/y coordinates based on meters.
    ```
    <copy>
    # convert to projected x/y coordinates as required for st_dbscan
    gdf = gdf.to_crs(3857)
    gdf
    </copy>
    ```
    ![detect anomalies](images/detect-simple-02.png)

​4. Input to ST\_DBSCAN is a Numpy array. Therefore run the following to convert the GeoDataFrame to a Numpy array.
     ```
     <copy>
     # Convert to pandas dataframe
     df = pd.DataFrame(data={'time': gdf.epoch_date, 'x': gdf.geometry.x, 'y': gdf.geometry.y, 'id':  gdf.id})
     data = df.values
     # Convert to numpy array
     data = np.int_(data)
     data
     </copy>
     ```
     ![detect anomalies](images/detect-simple-03.png)

5. From here, we can run ST\_DBSCAN on our sample data. ST\_DBSCAN is a variation of the Density-Based Spatial Clustering of Applications with Noise (DBSCAN) algorithm that is extended to work with spatial data. The parameters are the thresholds for clusters; eps1 is the distance threshold in the units of the coordinate system (meters), eps2 is the time threshold in seconds, and min-samples is the threshold for minimum of items. Run the following to detect clusters where the thresholds are 5 or more items within 5KM and roughly 1 month.
    ```
    <copy>
    st_cluster = ST_DBSCAN(eps1 = 5000, eps2 = 3000000, min_samples = 5)
    st_cluster.fit(data)
    </copy>
    ```

    ![detect anomalies](images/detect-simple-04.png)

​
6. The result is an integer label for each input item. Each label >=0 represents a cluster. The label -1 indicates the item is not part of a cluster. Review the distinct set of resulting labels. Observe that two clusters were detected.
​
    ```
    <copy>
    np.unique(st_cluster.labels)
    </copy>
    ```

    ![detect anomalies](images/detect-simple-05.png)

​
7. Add the integer label to the GeoDataFrame.
​
    ```
    <copy>
    df = pd.DataFrame(data={'id': df.id, 'label': st_cluster.labels})
    label_mapping_dict = dict(zip(df["id"], df["label"]))
    gdf["label"] = gdf["id"].map(label_mapping_dict)
    gdf
    </copy>
    ```

    ![detect anomalies](images/detect-simple-06.png)

8. Run the following to visualize the clusters. Notice that some items are within the distance threshold but not the temporal threshold.  
​
     ```
     <copy>
     gdf.explore(column="label", categorical="True", tiles="CartoDB positron", \
                 cmap=['sienna','blue','limegreen'], marker_kwds={"radius":4}, \
                 style_kwds={"fillOpacity":1})
     </copy>
     ```

    ![detect anomalies](images/detect-simple-07.png)

  In the next steps, you use this approach to detect suspicious financial transactions.

9. The result of cluster detection is a "label" for every data item indicating if the item is part of a cluster, and if so which cluster. You will perform cluster analysis and save the results to the database for further analysis. Run the following to create a database table that will store cluster labels.

     ```
     <copy>
     cursor.execute("CREATE TABLE transaction_labels (trans_id integer, label integer)")
     </copy>
     ```

    ![detect anomalies](images/detect-simple-08.png)

## Task 3: Detect spatiotemporal clusters

1.  In this workshop you will analyze transactions for one customer at a time. Run the following to set a variable for the customer id for analysis. You can return to this cell to switch to a different customer for analysis.

     ```
     <copy>
     cust=1
     </copy>
     ```
     ![detect anomalies](images/detect-anomalies-03.png)

2. Create a GeoDataframe of customer's transactions. Notice the binding syntax in the WHERE clause (cust\_id=:cust) supported by the python-oracledb driver.

      ```
      <copy>
      cursor.execute("""
       SELECT a.cust_id,  a.trans_id, a.trans_epoch_date,
             (lonlat_to_proj_geom(b.lon,b.lat)).get_wkt()
       FROM transactions a, locations b
       WHERE a.location_id=b.location_id
       AND cust_id=:cust""", cust=cust)
      gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id', 'trans_id', 'epoch_date', 'geometry'])
      gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
      gdf.head()
      </copy>
      ```

     ![detect anomalies](images/detect-anomalies-04.png)

3.   The st\_dbscan library requires input in numpy format, where numpy is a library for handling arrays.  Run the following two steps to convert your GeoDataFrame to a numpy array.

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

     ![detect anomalies](images/detect-anomalies-05.png)

4. You are now ready to detect spatiotemporal clusters for the current customer's transactions. The operation accepts three threshold parameters: distance, time, and minimum number of items. Items with neighbors within the distance and time thresholds are considered part of a cluster, and there most be at least the minimum number of items to qualify as a cluster. Distance is in the units of the coordinate system, which in this case is meters. Time is in seconds. Run the following to detect clusters where the thresholds are 5 or more items within 5KM and roughly 1 month.

     ```
     <copy>
     st_cluster = ST_DBSCAN(eps1 = 5000, eps2 = 3000000, min_samples = 5)
     st_cluster.fit(data)
     </copy>
     ```

    ![detect anomalies](images/detect-anomalies-06.png)

4. The result is an integer label for each input item. Each label >=0 represents a cluster. The label -1 indicates the item is not part of a cluster. Review the distinct set of resulting labels. Observe that there was one cluster detected.

     ```
     <copy>
     np.unique(st_cluster.labels)
     </copy>
     ```

    ![detect anomalies](images/detect-anomalies-07.png)

5. Run the following to add the cluster labels to transactions and print the first several rows. Each transaction is labelled with either -1 (meaning not part of a cluster) or an integer >=0 (meaning the cluster the item belongs to).

     ```
     <copy>
     df = pd.DataFrame(data={'trans_id': df.trans_id, 'label': st_cluster.labels})
     df.head()
     </copy>
     ```

    ![detect anomalies](images/detect-anomalies-08.png)

6. Detecting anomalies will require database queries involving the cluster labels. So run the following to insert the the current customer's labelled transactions to the TRANSACTION\_LABELS table created in the previous task.

     ```
     <copy>
     cursor.executemany("""
      INSERT INTO transaction_labels
      VALUES (:1, :2)""",
      list(df[['trans_id','label']].itertuples(index=False, name=None)))
     connection.commit()
     </copy>
     ```

    ![detect anomalies](images/detect-anomalies-09.png)

7. Run the following to retrieve the current customer's transactions with their cluster labels.

      ```
      <copy>
      # labelled transactions for customer
      cursor.execute("""
       SELECT a.cust_id, a.location_id, a.trans_id, a.trans_epoch_date,
              (lonlat_to_proj_geom(b.lon,b.lat)).get_wkt(), c.label
       FROM transactions a, locations b, transaction_labels c
       WHERE a.location_id=b.location_id
       AND a.trans_id=c.trans_id
       """)
      gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id', 'location_id', 'trans_id', 'trans_epoch_date', 'geometry','label'])
      gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
      gdf = gdf.set_crs(3857)
      gdf.head()
      </copy>
      ```
    ![detect anomalies](images/detect-anomalies-10.png)

8. Run the following to visualize the current customer's labelled transactions. In this case you include the parameter for color coding the items based on cluster label. You may also mouse over an item to see its attributes including the cluster label.

      ```
      <copy>
      gdf.explore(column="label", categorical="True", tiles="CartoDB positron", \
                  marker_kwds={"radius":4}, style_kwds={"fillOpacity":1})
      </copy>
      ```
    ![detect anomalies](images/detect-anomalies-11.png)

9. Zooming into the area of Austin, TX where the current customer's transaction locations are concentrated, observe the color coding indicating which are part of the spatiotemporal cluster.

    ![detect anomalies](images/detect-anomalies-12.png)

## Task 4: Detect anomalies

1. Run the following to create aggregate centroids for the current customer's spatiotemporal clusters with attributes for cluster label, time range, and number of transactions in the cluster. Observe the first customer has only 1 cluster (label = 0).

      ```
      <copy>
      # st cluster centroids for customer
      cursor = connection.cursor()
      cursor.execute("""
       SELECT label, min(trans_epoch_date) as min_time, max(trans_epoch_date) as max_time,
               SDO_AGGR_CENTROID(
                SDOAGGRTYPE(lonlat_to_proj_geom(b.lon,b.lat), 0.005)).get_wkt() as geometry,
               count(*) as trans_count
       FROM transactions a, locations b, transaction_labels c
       WHERE a.location_id=b.location_id
       AND a.trans_id=c.trans_id
       AND c.label != -1
       GROUP BY label
             """)
      gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['label','min_time','max_time','geometry','trans_count'])
      gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
      gdf = gdf.set_crs(3857)
      gdf.head()
      </copy>
      ```

    ![detect anomalies](images/detect-anomalies-13.png)

2. Run the following to visualize the spatiotemporal cluster centroid.

      ```
      <copy>
      gdf.explore(tiles="CartoDB positron", marker_kwds={"radius":4})
      </copy>
      ```

    ![detect anomalies](images/detect-anomalies-14.png)

3. To identify current customer transactions within the time range of cluster(s) and located at a distance greater than a threshold, you will run a query using the WITH ... AS ... SELECT .. WHERE... syntax as follows.

    ```
    WITH
        x as ( [transactions] ),
        y as ( [spatiotemporal cluster aggregate centroids] )
    SELECT [transaction, cluster label, distance from cluster aggregate centroid, ...]
    FROM x, y
    WHERE [transaction time within cluster time frame]
    AND [distance from cluster > threshold]
    ```

   Run the following query to return suspicious transactions along with the associated cluster label and distance from the cluster.

      ```
      <copy>
      cursor = connection.cursor()
      cursor.execute("""
      WITH
         x as (
             SELECT a.cust_id, a.location_id, a.trans_id, a.trans_epoch_date,
                    lonlat_to_proj_geom(b.lon,b.lat) as proj_geom, c.label
             FROM transactions a, locations b, transaction_labels c
             WHERE a.location_id=b.location_id
             AND a.trans_id=c.trans_id ),
         y as (
             SELECT label, min(trans_epoch_date) as min_time, max(trans_epoch_date) as max_time,
                    SDO_AGGR_CENTROID(
                        SDOAGGRTYPE(lonlat_to_proj_geom(b.lon,b.lat), 0.005)) as proj_geom,
                    count(*) as trans_count
             FROM transactions a, locations b, transaction_labels c
             WHERE a.location_id=b.location_id
             AND a.trans_id=c.trans_id
             AND c.label != -1
             GROUP BY label)
       SELECT x.cust_id, x.trans_epoch_date, (x.proj_geom).get_wkt(), x.trans_id, x.label, y.label,
              round(sdo_geom.sdo_distance(x.proj_geom, y.proj_geom, 0.05, 'unit=KM'))
       FROM x, y
       WHERE x.trans_epoch_date between y.min_time and y.max_time
       AND x.label!=y.label
       AND x.label=-1
       AND sdo_within_distance(x.proj_geom, y.proj_geom, 'distance=500 unit=KM') = 'FALSE'
             """)
      gdfAnomaly = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id','trans_epoch_date','geometry', 'trans_id','label','outlier_to_label','distance'])
      gdfAnomaly['geometry'] = shapely.from_wkt(gdfAnomaly['geometry'])
      gdfAnomaly = gdfAnomaly.set_crs(3857)
      gdfAnomaly.head()
      </copy>
      ```

    ![detect anomalies](images/detect-anomalies-15.png)

4. Run the following to visualize the spatiotemporal cluster(s) as blue markers and associated suspicious outlier(s) as red markers. Then hover over the suspicious transaction(s) to see their attributes.

      ```
      <copy>
      m = gdf.explore(tiles="CartoDB positron", marker_type='circle_marker',marker_kwds={"radius":"5"},
                      style_kwds={"color":"blue","fillColor":"blue", "fillOpacity":"1"})
      m = gdfAnomaly.explore(m=m, marker_type='circle_marker', marker_kwds={"radius":"5"},
                             style_kwds={"color":"red","fillColor":"red", "fillOpacity":"1"} )
      m.fit_bounds(m.get_bounds())
      m
      </copy>
      ```

    ![detect anomalies](images/detect-anomalies-16.png)

      To repeat the process for the other customers' transactions you could scroll up to the cell where customer ID is set, update to a different customer ID, and rerun the subsequent cells. However, it is more convenient to use a script that runs all of the steps.

5. Use the following link to download a script that includes all the steps for anomaly detection:
[anomaly_detection.py](./files/anomaly_detection.py)

    ![detect anomalies](images/detect-anomalies-17.png)

6. Click the upload button, navigate to the script you downloaded, and upload the script file.

     ![detect anomalies](images/detect-anomalies-18.png)

7. Run the following to import the script.

     ```
     <copy>
     from anomaly_detection import *
     </copy>
     ```

    ![detect anomalies](images/detect-anomalies-19.png)

    You can now analyze other customer's transactions using functions in the script. These will reproduce the previous steps starting from Task 3 after emptying the TRANSACTION\_LABELS table as a new set of labels.

     * create\_connection() establishes a database connection
     * get\_cluster\_centroids( )  detects spatiotemporal transaction clusters for a customer
     * get\_anomalies( ) identifies suspicious transactions based on overlapping time and distance beyond threshold from clusters  
     * get\_map( ) returns a map of clusters and associated suspicious transactions

8. Run the following to detect suspicious transactions for customer id = 2.

     ```
     <copy>
     cust = 2
     </copy>
     ```

     ```
     <copy>
     create_connection()
     gdf = get_cluster_centroids(cust)
     gdfAnomaly = get_anomalies(cust)
     m = get_map()
     </copy>
     ```

     ![detect anomalies](images/detect-anomalies-20.png)

9.  Run the following to list the spatiotemporal clusters.

     ```
     <copy>
     gdf
     </copy>
     ```

    ![detect anomalies](images/detect-anomalies-21.png)

 10. Run the following to list the associated anomalies..

     ```
     <copy>
     gdfAnomaly
     </copy>
     ```

     ![detect anomalies](images/detect-anomalies-22.png)  

 11. Run the following to visualize the clusters and and associated anomalies.

     ```
     <copy>
     m.fit_bounds(m.get_bounds())
     m
     </copy>
     ```

    ![detect anomalies](images/detect-anomalies-23.png)  

    To detect suspicious for other customers, scroll up to step 8, set a different customer id, and re-run the the subsequent cells to call the functions in the script.

We hope this workshop has been informative and that you further explore the spatial features of Oracle Database and their use in machine learning and AI workflows.

## Learn More

* For details on Spatial aggregate functions see [https://docs.oracle.com/en/database/oracle/oracle-database/26/spatl/spatial-aggregate-functions1.html](the Spatial Developer's Guide)
* For details on st\_dbscan see [ST-DBSCAN: An algorithm for clustering spatial–temporal data](https://www.sciencedirect.com/science/article/pii/S0169023X06000218) and [https://github.com/eren-ck/st_dbscan](st_dbscan on GitHub)

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Contributors** - Rahul Tasker, Denise Myrick, Ramu Gutierrez
* **Last Updated By/Date** - Denise Myrick, December 2025
