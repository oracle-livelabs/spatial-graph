# Prepare Data

## Introduction

In this lab, fictitious financial transactions data are loaded to your Autonomous AI Database and configured for spatial and temporal ("spatiotemporal") analysis.

Estimated Lab Time: 10 minutes

### Objectives

* Load financial transactions data to Autonomous AI Database
* Configure data for spatiotemporal analysis

### Prerequisites

* Completion of Lab 3: Connect to Autonomous AI Database from Python

## Task 1: Upload data files

1. Use the following links to download the data files:

* [locations.csv](./data/locations.csv)
* [transactions.csv](./data/transactions.csv)

2. Click the **Upload** icon to load the data files.
   ![Upload data](images/prepare-data-01.png)

3. In the left panel, double-click on locations.csv and transactions.csv to preview the data files in new tabs.

   ![Preview files](images/prepare-data-02.png)

  Observe that locations.csv has one row per ATM location, and transactions has one row per financial transaction. Then close the tabs with the data preview and return to your notebook.

## Task 2: Create and load tables

1. In the next cell of your notebook, paste the following statement and then click the **run** button. This creates the table for the locations data.

     ```
     <copy>
     # Create table for locations data
     cursor.execute("""
      CREATE TABLE locations (
                location_id INTEGER,
                owner VARCHAR2(100),  
                lon NUMBER,
                lat NUMBER)""")
     </copy>
     ```
     ![Load data](images/prepare-data-04.png)

2. Run the following to load the locations data.

     ```
     <copy>
     # Load the locations data
     import csv
     BATCH_SIZE = 1000
     with connection.cursor() as cursor:
         with open('locations.csv', 'r') as csv_file:
             csv_reader = csv.reader(csv_file, delimiter=',')
             #skip header
             next(csv_reader)
             #load data
             sql = "INSERT INTO locations VALUES (:1, :2, :3, :4)"
             data = []
             for line in csv_reader:
                 data.append((line[0], line[1], line[2], line[3]))
                 if len(data) % BATCH_SIZE == 0:
                     cursor.executemany(sql, data)
                     data = []
             if data:
                 cursor.executemany(sql, data)
             connection.commit()
     </copy>
     ```
     ![Load data](images/prepare-data-05.png)

3. Run the following to preview the locations data, which contains one row for each for each ATM location including coordinates and a unique location ID.

     ```
     <copy>
     # Preview locations data
     cursor = connection.cursor()
     cursor.execute("SELECT * FROM locations")
     for row in cursor.fetchmany(size=10):
         print(row)
     </copy>
     ```
     ![Preview data](images/prepare-data-06.png)

4. In the next cell, paste the following statement and then click the **run** button. This creates the table for the transaction data.

     ```
     <copy>
     # Create table for transactions data
     cursor.execute("""
        CREATE TABLE transactions (
                       trans_id INTEGER,
                       location_id INTEGER,
                       trans_date DATE,
                       cust_id INTEGER)""")
     </copy>
     ```
     ![Create table](images/prepare-data-07.png)

5. Run the following to load the transactions data.

     ```
     <copy>
     # Load the transactions data
     BATCH_SIZE = 1000
     with connection.cursor() as cursor:
         with open('transactions.csv', 'r') as csv_file:
             csv_reader = csv.reader(csv_file, delimiter=',')
             #skip header
             next(csv_reader)
             #load data
             sql = "INSERT INTO transactions VALUES (:1, :2, TO_DATE(:3,'YYYY-MM-DD:HH24:MI:SS'), :4)"
             data = []
             for line in csv_reader:
                 data.append((line[0], line[1], line[2], line[3]))
                 if len(data) % BATCH_SIZE == 0:
                     cursor.executemany(sql, data)
                     data = []
             if data:
                 cursor.executemany(sql, data)
             connection.commit()
     </copy>
     ```
     ![Load data](images/prepare-data-08.png)

6. Run the following to preview the transactions data, which contains one row for each transaction including data and location ID.

     ```
     <copy>
     # Preview transactions data
     cursor = connection.cursor()
     cursor.execute("SELECT * FROM transactions")
     for row in cursor.fetchmany(size=10):
         print(row)
     </copy>
     ```
     ![Preview data](images/prepare-data-09.png)

7. Run the following to list the distinct customer ID's.

     ```
     <copy>
     # Customer ID's
     cursor = connection.cursor()
     cursor.execute("SELECT DISTINCT cust_id FROM transactions ORDER BY cust_id")
     for row in cursor.fetchall():
         print(row[0])
     </copy>
     ```
     ![List IDs](images/prepare-data-09a.png)

## Task 3: Add epoch date

Temporal calculations are a key component of this workshop, and are best performed on an integer representation of date and time. This integer representation is generally referred to as epoch time or more specifically UNIX time. In this task you add epoch time for all transactions.

1.  Run the following to add and populate a column for epoch date.

     ```
     <copy>
     # add column for epoch date
     cursor.execute("ALTER TABLE transactions ADD (trans_epoch_date integer)")
     </copy>
     ```

     ```
     <copy>
     # add column for epoch date
     cursor.execute("""UPDATE transactions
                       SET trans_epoch_date = (trans_date - date'1970-01-01') * 86400""")
     connection.commit()
     </copy>
     ```

     ![Add epoch date](images/prepare-data-10.png)

2. Run the following to again preview the transactions data. Observe the epoch date column is added.

     ```
     <copy>
     # Preview transactions data
     cursor.execute("SELECT * FROM transactions")
     for row in cursor.fetchmany(size=10):
         print(row)
     </copy>
     ```

     ![Preview epoch date](images/prepare-data-11.png)

## Task 4: Configure data for spatial operations

Spatial calculations are an additional key component of this workshop. In this task you configure your locations data to utilize the spatial features of Autonomous AI Database. The locations table includes longitude/latitude coordinates. One option is to create and populate a new column using the native spatial data type. While that would work perfectly fine, there is another option that takes advantage of a mainstream Oracle AI Database feature called "function based indexing". This approach allows for all of the capability associated with creating a new spatial column, but without having to create the column. Instead, you create a database function that converts coordinates to a spatial data element, and then create an index on that function. Once the function and index are created, all spatial operations behave as if a new spatial column had been created. While this is not essential for the small data volume in this workshop, the approach is of great benefit for large scale systems where the overhead of adding a column is significant.

1. Run the following to create a function that converts longitude/latitude coordinates to Oracle's native spatial data type (i.e. SDO_GEOMETRY, referred to as a "geometry"). Not only does the function convert coordinates to the native spatial type, but it also converts the coordinates from longitude/latitude to a coordinate system called "world mercator". This is the coordinate system expected by Python libraries used in subsequent labs, hence it is convenient to perform this conversion in this function.

     ```
     <copy>
     # Create function to return lon/lat coordinates as a geometry.
     cursor.execute("""
      CREATE OR REPLACE FUNCTION lonlat_to_proj_geom (longitude IN NUMBER, latitude IN NUMBER)
      RETURN SDO_GEOMETRY DETERMINISTIC IS
      BEGIN
        IF latitude IS NULL OR longitude IS NULL
        OR latitude NOT BETWEEN -90 AND 90
        OR longitude NOT BETWEEN -180 AND 180
        THEN
          RETURN NULL;
        ELSE
           RETURN sdo_cs.transform(
             SDO_GEOMETRY(2001, 4326,
                          sdo_point_type(longitude, latitude, NULL),NULL, NULL),
             3857);
        END IF;
     END;""")
     </copy>
     ```

     ![Create function](images/prepare-data-13.png)

2. Querying for geometries and geometries converted to string representations involve "Large Objects", or "LOBs". Apply the following setting to python-oracledb so that LOBs are fetched directly instead of fetching a LOB locator and then fetching the LOB content in a second round trip.

     ```
     <copy>
     # return LOBs directly as strings or bytes
     oracledb.defaults.fetch_lobs = False  
     </copy>
     ```

     ![Set LOB option](images/fetch-lobs.png)

3. Run the following to test the function.

     ```
     <copy>
     # test the function
     cursor.execute("""
      with x as (
         SELECT location_id, lonlat_to_proj_geom(lon,lat) as geom FROM locations)
      SELECT location_id, geom, (geom).get_wkt()
      FROM x
      """)
     for row in cursor.fetchone():
         print(row)
     </copy>
     ```

     ![Test the function](images/prepare-data-14.png)

4. Spatial queries rely on a spatial index for optimal performance. A spatial index can only be created on data having uniform dimensionality (i.e., 2D or 3D) and coordinate system. Before creating a spatial index, it is necessary to insert a row of metadata describing these properties for the geometry to be indexed. This includes the table name, geometry column name (or in this case a function returning geometry), dimensionality, and a coordinate system code. When creating a spatial index, the data are first verified to conform to the metadata. Spatial indexing completes successfully only if the data conform to the metadata. Run the following to create spatial metadata for the location geometry.

     ```
     <copy>
     cursor.execute("""
      INSERT INTO user_sdo_geom_metadata VALUES (
         'LOCATIONS', 'ADMIN.LONLAT_TO_PROJ_GEOM(LON,LAT)',
          SDO_DIM_ARRAY(SDO_DIM_ELEMENT('LON', 0, 0, 0.05),
                        SDO_DIM_ELEMENT('LAT', 0, 0, 0.05)),
          3857)
                 """)
     </copy>
     ```

     ![Insert metadata](images/prepare-data-15.png)

5. Run the following to create a spatial index for the location geometry.

     ```
     <copy>
     cursor.execute("""
      CREATE INDEX locations_sidx
      ON locations(LONLAT_TO_PROJ_GEOM(LON,LAT))
      INDEXTYPE IS mdsys.spatial_index_v2
                 """)
     </copy>
     ```

     ![Create index](images/prepare-data-16.png)

6. To verify the spatial index, run the following example spatial query. This query returns the 5 nearest items from the **locations** table to a longitude, latitude coordinate, along with the distances.  This is referred to as a "nearest neighbor" query and uses the **sdo\_nn( )** operator which uses the spatial index. For more info on nearest neighbor queries, please see the [documentation](https://docs.oracle.com/en/database/oracle/oracle-database/23/spatl/sdo_nn.html).

    ```
    <copy>
    cursor.execute("""
     SELECT location_id, round(sdo_nn_distance(1), 2) FROM locations
     WHERE sdo_nn(
       LONLAT_TO_PROJ_GEOM(LON,LAT),
       LONLAT_TO_PROJ_GEOM( -97.6, 30.3),
       'sdo_num_res=5 unit=mile', 1) = 'TRUE' """)
    for row in cursor.fetchmany():
        print(row)  
    </copy>
    ```

     ![Run spatial query](images/prepare-data-18.png)

You may now **proceed to the next lab**.

## Learn More

* For details on UNIX time please see [https://en.wikipedia.org/wiki/Unix_time](https://en.wikipedia.org/wiki/Unix_time)
* For details on function-based spatial indexing, please see the [documentation](https://docs.oracle.com/en/database/oracle/oracle-database/23/spatl/sdo_geometry-objects-function-based-indexes.html#GUID-CFB6B6DB-4B97-43D1-86A1-21C1BA853089)

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Contributors** - Rahul Tasker, Denise Myrick, Ramu Gutierrez
* **Last Updated By/Date** - Denise Myrick, December 2025
