# Cleanup


## Introduction

...

Estimated Lab Time: xx minutes


### About ...


### Objectives

In this lab, you will....


### Prerequisites

* ....

<!--  *This is the "fold" - below items are collapsed by default*  -->



## Remove Everything Created in this Workshop


...

```
<copy> 
DROP TABLE WAREHOUSES;
DROP TABLE STORES;
DROP TABLE REGIONS;
DROP TABLE TORNADO_PATHS;
</copy>
```


...

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

![Image alt text](images/cleanup-xx.png)


## Learn More

* [Spatial product portal](https://oracle.com/goto/spatial)
* [Spatial documentation](https://docs.oracle.com/en/database/oracle/oracle-database/19/spatl)
* [Spatial blog posts on Oracle Database Insider](https://blogs.oracle.com/database/category/db-spatial)
* [Spatial blog posts on Medium.com](https://medium.com/oracledevs/tagged/spatial)


## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** -
