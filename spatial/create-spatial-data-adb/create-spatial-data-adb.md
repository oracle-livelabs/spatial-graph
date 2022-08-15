# Create Sample Data


## Introduction

......

Estimated Lab Time: 20 minutes

 
### About Spatial Data

Oracle Database stores spatial data (points, lines, polygons) in a native data type called SDO_GEOMETRY. Oracle Database also provides a native spatial index for high performance spatial operations. This spatial index relies on spatial metadata that is entered for each table and geometry column storing spatial data. Once spatial data is populated and indexed, robust APIs are available to perform spatial analysis, calculations, and processing.

The SDO_GEOMETRY type has the following general format:

```
SDO_GEOMETRY( 
    [geometry type]              -- ID for points/lines/polygons
    , [coordinate system]        -- ID of coordinate system
    , [point coordinate]         -- used for points only
    , [line/polygon info]        -- used for lines/polygons only
    , [line/polygon coordinates] -- used for lines/polygons only
)
 ```

The most common geometry types are 2-dimensional:

  | ID |Type |
  | --- | --- | 
  | 2001 |Point |
  | 2002 |Line |
  | 2003 |Polygon |

The most common coordinate systems are:

  | ID |Coordinate System |
  | --- | --- | 
  | 4326 |Latitude/Longitude|
  | 3857 |World Mercator|

When using latitude and longitude, note that latitude is the Y coordinate and longitude is the X coordinate. Since coordinates are listed as X,Y pair, the values within SDO_GEOMETRY need to be in the order: longitude, latitude.

The following example is a point geometry with longitude,latitude coordinates:

```
SDO_GEOMETRY( 
    2001                                      -- 2D point
    , 4326                                    -- Coordinate system
    , SDO_POINT_TYPE(-100.123, 20.456, NULL)  -- lon/lat values
    , NULL                                    -- Default NULL if not not needed
    , NULL                                    -- Default NULL if not not needed
)
```

The following example is a polygon geometry with longitude,latitude coordinates:

```
SDO_GEOMETRY( 
    2003                                      -- 2D polygon
    , 4326                                    -- Coordinate system
    , NULL                                    -- Default NULL if not not needed 
    , SDO_ELEM_INFO_ARRAY(1, 1003, 1)         -- Identifies a simple exterior polygon
    , SDO_ORDINATE_ARRAY(                     -- list of lon/lat values
        -98.789065,39.90973
        , -101.2522,39.639537
        , -99.84374,37.160316
        , -96.67987,35.460699
        , -94.21875,39.639537
        , -98.789025,39.90973
    )
)
```


**... Add section here on built-in conversion fns ...**


### Objectives

In this lab, you will:
* ....


### Prerequisites

Oracle Autonomous Database and Database Actions 


## Task 1: Load Data from Files

You begin by loading data for warehouses and stores from CSV files. These files include coordinates which will later be used to create geometries. You then load data for regions from a GeoJSON document. GeoJSON is ......


## Task 2: Configure Warehouses Table using Geometry Column

Next ......


## Task 3: Configure Stores Table using Function-based Spatial Index

Next ......

## Task 4: Create Regions Table from GeoJSON Document

Next ......











## Learn More

* [Spatial product portal](https://oracle.com/goto/spatial)
* [Spatial documentation](https://docs.oracle.com/en/database/oracle/oracle-database/19/spatl)
* [Spatial blog posts on Oracle Database Insider](https://blogs.oracle.com/database/category/db-spatial)
* [Spatial blog posts on Medium.com](https://medium.com/oracledevs/tagged/spatial)


## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - Karin Patenge, June 2022