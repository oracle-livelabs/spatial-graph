# Load Spatial Data


## Introduction

Spatial Studio operates on data stored in Oracle Databases. In Spatial Studio you work with "Datasets", which are database tables and views accessed through database connections. Datasets are pointers to database tables and views, and may be given friendly names to be more self-describing than the underlying database table or view name.  

Users often need to incorporate data acquired from various sources. To support this, Spatial Studio provides features for loading data from standard formats to Oracle Database.  This includes loading the 2 most common formats for exchange of spatial data: Shapefiles and GeoJSON files. In addition to loading spatial formats, Spatial Studio supports loading spreadsheets and csv files. In that case, additional preparation is needed to derive geometries from spatial attributes such as addresses ("address geocoding") and latitude/longitude coordinates ("coordinate indexing"). This lab walks you through the steps to load and prepare data in these formats using Spatial Studio. 


Estimated Lab Time: xx minutes


### Objectives

* Learn how to load and prepare spatial data

### Prerequisites

* This lab requires access to Spatial Studio and Oracle Database. 
* Before you get started ...
* No previous experience with Oracle Spatial is required.


## Task 1: Load Sea Level Rise data

You begin by loading a set of sea level rise data ..... zip contains 6 shapefiles...

1. Download GeoJSON file to a convenient location: <a href="xxx">  slr.zip  </a>

2. In Spatial Studio, from the left panel menu navigate to the Datasets page, click **Create Dataset**, and drag-and-drop slr.zip. You can also click on the upload region and navigate to select the file.
![Image alt text](images/load-data-1.png)

3. A preview of the  data will be displayed. Select the destination Connection for this upload. In this workshop we are using the SPATIAL_STUDIO connection (the Spatial Studio metadata repository), but in a production scenario you would have other connection(s) for such business data, separate from the metadata repository. Click **Submit** to initiate the 1st upload.
   
4. ... repeat for rest of slr shapefiles...
![Image alt text](images/load-data-2.png)

4. The uploaded slr datasets will be listed with a small warning icon to indicate that a preparation step is needed. In this case we need to add a Dataset key. Although this is not needed for basic mapping, we will add the key now since we'll need it for analyses in later workshop sections. Click on the warning icon and then click the link **Go to Dataset Columns**
![Image alt text](images/load-data-3.png)

5. Select ... verify... apply
![Image alt text](images/load-data-4.png)


## Task 2: Load points of interest (POI) data
Next you load ... schools and EPA TRI facilities in a zip file. 

1. Download zip file containing ... to a convenient location: <a href= xxx "> poi.zip </a>  

2. Navigate to the Datasets page, click **Create Dataset**, and drag-and-drop poi.zip  Spatial Studio will extract the spreadsheets from the zip file and process them individually. 
![Image alt text](images/load-data-6.png)

1. The first file extracted will be ... Select the destination Connection, and set the table and Dataset names to ...
![Image alt text](images/load-data-7.png)

1. The second file extracted will be ... Select the destination Connection, and set the table and Dataset names to ...
![Image alt text](images/load-data-8.png)

1. The xxx and xxx Datasets are now listed with warnings since keys needs to be defined. Click on the warning icon for xxx and then click the link **Go to Dataset Columns**.
![Image alt text](images/load-data-9.png) 
   
6. . Select **Use as Key** for column xxx,  click **Validate key**, and the then click **Apply**. 
![Image alt text](images/load-data-10.png)

   Repeat steps 5 and 6 to set the key for Dataset ...

## Task 3: Load parcel data
Next you load ... from a GeoJSON file. 

1. Download zip file containing ... to a convenient location: <a href= xxx "> poi.zip </a>  

2. Navigate to the Datasets page, click **Create Dataset**, and drag-and-drop parcels.zip  Spatial Studio will extract the geojson file from the zip file and process it. 
![Image alt text](images/load-data-6.png)

1. Select the destination Connection, and set the table and Dataset names to ...
![Image alt text](images/load-data-7.png)

1. The xxx Dataset is now listed with a warning since key needs to be defined. Click on the warning icon for xxx and then click the link **Go to Dataset Columns**.
![Image alt text](images/load-data-9.png) 
   
6. . Select **Use as Key** for column xxx,  click **Validate key**, and the then click **Apply**. 
![Image alt text](images/load-data-10.png)


7. All Datasets are now ready for mapping and spatial analysis 
![Image alt text](images/load-data-11.png)

You may now [proceed to the next lab](#next).

## Learn More
* [Spatial Studio product portal] (https://oracle.com/goto/spatialstudio)

## Acknowledgements
* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - David Lapp, Database Product Management, April 2021
* **Lab Expiry** - March 31, 2022
