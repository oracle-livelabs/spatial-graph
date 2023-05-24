# Explore Data


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
     import geopandas as gpd
     import shapely
     import folium
     </copy>
     ```

     ![Navigate to Oracle Database]()

1.  Import libraries for ...

     ```
     <copy>
     cust = 3
     </copy>
     ```


1.  Create GeoDataFrame ...

    ```
    <copy>
    cursor.execute("""
     SELECT cust_id, location_id, trans_id, trans_epoch_date, (proj_geom).get_wkt() 
     from v_transactions
     where cust_id=:cust
     """, cust=cust)
    gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id', 'location_id', 'trans_id', 'trans_epoch_date', 'geometry'])
    gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
    gdf = gdf.set_crs(3857)
    gdf.head()
    </copy>
    ```

     ![Navigate to Oracle Database]()

2.  Map viz ...  

    ```
    <copy>
    gdf.explore(tiles="CartoDB positron") 
    </copy>
    ```

     ![Navigate to Oracle Database]()




... add exploration ...


You may now proceed to the next lab.

## Learn More
* 

## Acknowledgements
* **Author** - 
