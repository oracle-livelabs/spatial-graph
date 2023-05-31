# Explore Data
 ... explain why all this spatial stuff in py... use spatial back end...

## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Task 1: Spatial data handling in Python

... insert a locations hello world example here...


1.  Import libraries for ...

     ```
     <copy>
     import geopandas as gpd
     import shapely
     import folium
     </copy>
     ```

     ![Desc here...]()


## Task 2: Explore transactions data


1.  Create GeoDataFrame ...

    ```
    <copy>
    cursor = connection.cursor()
    cursor.execute("""
     SELECT a.cust_id, a.trans_id, a.trans_epoch_date, 
      (lonlat_to_proj_geom(b.lon,b.lat)).get_wkt() 
     from transactions a, locations b
     where a.location_id=b.location_id
     """)
    gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['cust_id', 'trans_id', 'trans_epoch_date', 'geometry'])
    gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
    gdf = gdf.set_crs(3857)
    gdf.head()
    </copy>
    ```

     ![Desc here...]()

2.  Map viz ...  

    ```
    <copy>
    gdf.explore(tiles="CartoDB positron") 
    </copy>
    ```

     ![Desc here...]()




... add exploration ...


You may now proceed to the next lab.

## Learn More
* 

## Acknowledgements
* **Author** - 
