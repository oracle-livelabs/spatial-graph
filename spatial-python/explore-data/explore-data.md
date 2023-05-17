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
     import geopandas
     import shapely
     import folium
     </copy>
     ```

     ![Navigate to Oracle Database]()

1.  Create GeoDataFrame ...

    ```
    <copy>
    cursor.execute("SELECT location_id, (lonlat_to_proj_geom(lon,lat)).get_wkt() FROM locations")
    gdf = gpd.GeoDataFrame(cursor.fetchall(), columns = ['location_id', 'geometry'])
    gdf['geometry'] = shapely.from_wkt(gdf['geometry'])
    gdf = gdf.set_crs(3857)
    gdf.head()
    </copy>
    ```

     ![Navigate to Oracle Database]()

1.  Map viz ...

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
