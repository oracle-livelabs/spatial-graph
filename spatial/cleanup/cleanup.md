# Reset ADB to pre-workshop state


## Introduction

This lab is to remove everything created in the previous labs so that you can start over if needed.

Estimated Lab Time: 2 minutes


### About 

In this lab, all previously created artifacts are dropped.

### Objectives

* Reset ADB to pre-workshop state.

### Prerequisites

* Completion of Lab 3; Prepare Spatial Data

<!--  *This is the "fold" - below items are collapsed by default*  -->



## Task 1: Remove everything created in this workshop


1. To remove tables and indexes created in this workshop, run the following using the run script button in SQL Worksheet.

     ![Image alt text](images/run-script.png)

      ```
      <copy> 
      DROP TABLE WAREHOUSES;
      DROP TABLE STORES;
      DROP TABLE REGIONS;
      DROP TABLE TORNADO_PATHS;
      </copy>
      ```


2. To drop spatial metadata inserted in this workshop, run the following using the run script button in SQL Worksheet.

      ```
      <copy> 
      DELETE FROM USER_SDO_GEOM_METADATA
      WHERE TABLE_NAME IN (
          'WAREHOUSES', 
          'STORES', 
          'REGIONS', 
          'TORNADO_PATHS');
      COMMIT;
      </copy>
      ```

3. To drop the function created in this workshop, run the following.

      ```
      <copy> 
      DROP FUNCTION GET_GEOMETRY;
      </copy>
      ```


## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - David Lapp, September 2022
