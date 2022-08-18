# Spatial Queries


## Introduction

This lab walks you through basic spatial queries in Oracle Database. You will use the sample data created in the previous lab to identify items based on proximity and containment.

Estimated Lab Time: 30 minutes


### About Spatial Queries

Oracle Database includes a robust library of functions and operators for spatial analysis. This includes spatial relationships, measurements, aggregations, transformations, and much more. These operations are accessible through native SQL, PL/SQL, Java APIs, and any other lan


### Objectives

In this lab, you will....


### Prerequisites

* ....

<!--  *This is the "fold" - below items are collapsed by default*  -->



## Proximity Queries 

Stores within x mi of xx warehouse

   ```
   <copy> 
    SELECT
        STORE_NAME,
        STORE_TYPE
    FROM
        STORES     A,
        WAREHOUSES B
    WHERE
         B.WAREHOUSE_NAME = 'Dallas Warehouse'
    AND SDO_WITHIN_DISTANCE(
          GET_GEOMETRY(A.LONGITUDE, A.LATITUDE),
          B.GEOMETRY,
          'distance=20 unit=mile') = 'TRUE'
  </copy>
  ```

   ![Image alt text](images/run-queries-01.png)

n closest stores to xx warehouse

   ```
   <copy> 
    SELECT
         STORE_NAME,
         STORE_TYPE
     FROM
         STORES     A,
         WAREHOUSES B
     WHERE B.WAREHOUSE_NAME = 'Dallas Warehouse'
      AND SDO_NN(
           GET_GEOMETRY(A.LONGITUDE, A.LATITUDE),
           B.GEOMETRY,
           'sdo_batch_size=10') = 'TRUE'
    AND ROWNUM <= 5;
  </copy>
  ```

   ![Image alt text](images/run-queries-02.png)

n closest stores to xx warehouse with dist

   ```
   <copy> 
    SELECT
         STORE_NAME,
         STORE_TYPE,
         ROUND( SDO_NN_DISTANCE(1) , 2) DISTANCE_MI
     FROM
         STORES     A,
         WAREHOUSES B
     WHERE B.WAREHOUSE_NAME = 'Dallas Warehouse'
      AND SDO_NN(
           GET_GEOMETRY(A.LONGITUDE, A.LATITUDE),
           B.GEOMETRY,
           'sdo_batch_size=10 unit=MILE', 1) = 'TRUE'
    AND ROWNUM <= 5;
  </copy>
  ```

   ![Image alt text](images/run-queries-03.png)


n closest retail stores to xx warehouse with dist

   ```
   <copy> 
    SELECT
         STORE_NAME,
         STORE_TYPE,
         ROUND( SDO_NN_DISTANCE(1) , 2) DISTANCE_MI
     FROM
         STORES     A,
         WAREHOUSES B
     WHERE B.WAREHOUSE_NAME = 'Dallas Warehouse'
     AND A.STORE_TYPE='RETAIL'
      AND SDO_NN(
           GET_GEOMETRY(A.LONGITUDE, A.LATITUDE),
           B.GEOMETRY,
           'sdo_batch_size=10 unit=MILE', 1) = 'TRUE'
    AND ROWNUM <= 5;
  </copy>
  ```
   ![Image alt text](images/run-queries-04.png)

  stores with closest warehouse

  ```
  <copy> 
    SELECT a.store_name, b.warehouse_name
    FROM stores a,warehouses b
    WHERE SDO_NN(b.geometry,
            get_geometry(a.longitude,a.latitude), 
            'sdo_num_res=1') = 'TRUE';
  </copy>
  ```

  ![Image alt text](images/run-queries-05.png)

  stores with closest warehouse with distance

  ```
  <copy> 
    SELECT
        A.STORE_NAME,
        B.WAREHOUSE_NAME,
        ROUND( SDO_NN_DISTANCE(1) , 2) DISTANCE_MI
    FROM
        STORES     A,
        WAREHOUSES B
    WHERE
        SDO_NN(B.GEOMETRY,
               GET_GEOMETRY(A.LONGITUDE, A.LATITUDE),
               'sdo_num_res=1 unit=MILE', 1) = 'TRUE';
  </copy>
  ```

 ![Image alt text](images/run-queries-06.png)


store and max loss within dist x

 ```
 <copy> 
    SELECT
        COUNT(A.KEY),
        MAX(A.LOSS)
    FROM
        TORNADO_PATHS A,
        WAREHOUSES B
    WHERE
        B.WAREHOUSE_NAME = 'Dallas Warehouse'
     AND SDO_WITHIN_DISTANCE( A.GEOMETRY,
                              B.GEOMETRY,
           'distance=20 unit=mile') = 'TRUE'
 </copy>
   ```

   ![Image alt text](images/run-queries-07.png)




stores with max loss within with dist


 ```
 <copy> 
    SELECT
        B.WAREHOUSE_NAME,
        COUNT(A.KEY),
        MAX(A.LOSS)
    FROM
        TORNADO_PATHS A,
        WAREHOUSES B
    WHERE SDO_WITHIN_DISTANCE( A.GEOMETRY,
                              B.GEOMETRY,
           'distance=20 unit=mile') = 'TRUE'
    GROUP BY B.WAREHOUSE_NAME;  
 </copy>
   ```

   ![Image alt text](images/run-queries-08.png)

  increase to 50 mi


## Containment Queries 

Stores in region xx

Stores with region

Number of tornados and avg mag in region x

Regions with number and avg mag of tornados






## Learn More

* [Spatial product portal](https://oracle.com/goto/spatial)
* [Spatial documentation](https://docs.oracle.com/en/database/oracle/oracle-database/19/spatl)
* [Spatial blog posts on Oracle Database Insider](https://blogs.oracle.com/database/category/db-spatial)
* [Spatial blog posts on Medium.com](https://medium.com/oracledevs/tagged/spatial)


## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** -
