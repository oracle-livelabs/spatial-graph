# Load and Prepare Data


## Introduction

Spatial Studio operates on data stored in Oracle Databases. In Spatial Studio you work with "Datasets", which are database tables and views accessed through database connections. Datasets are pointers to database tables and views, and may be given friendly names to be more self-describing than the underlying database table or view name.  

Users often need to incorporate data acquired from various sources. To support this, Spatial Studio provides features for loading data from standard formats to Oracle Database.  This includes loading the 2 most common formats for exchange of spatial data: Shapefiles and GeoJSON files. In addition to loading spatial formats, Spatial Studio supports loading spreadsheets and csv files. In that case, additional preparation is needed to derive geometries from spatial attributes such as addresses ("address geocoding") and latitude/longitude coordinates ("coordinate indexing"). This lab walks you through the steps to load and prepare data in these formats using Spatial Studio. 


Estimated Lab Time: xx minutes


### Objectives

* Learn how to load and prepare spatial data

### Prerequisites

* This lab requires access to Spatial Studio and Oracle Database. 
* No previous experience with Oracle Spatial is required.
* Before you get started ...


## Task 1: Load data

You begin by loading  ..... 

1. Download the zip file containing the data to a convenient location: <a href="xxx">  xxx.zip  </a>

   ![Image alt text](images/xxx.png)
   
2. Unzip the file and observe the files for upload (geojson, shp, csv)...

   ![Image alt text](images/xxx.png)

3. In Spatial Studio, from the left panel menu navigate to the Datasets page, click **Create Dataset**, and select **From file upload**. Click on the upload region, navigate to your download location, and select all of the files (except for README.txt). Then click **Create**.
   
   ![Image alt text](images/xxx.png)

4. A preview of the 1st uploaded file will be displayed. Select the destination Connection for this upload. In this workshop we are using the SPATIAL_STUDIO connection (the Spatial Studio metadata repository), but in a production scenario you would have other connection(s) for such business data, separate from the metadata repository. Click **Submit** to initiate the 1st upload.
   
  ![Image alt text](images/xxx.png)

5. Repeat for all datasets.

   ![Image alt text](images/xxx.png)

## Task 2: Prepare Data

You next  .....   

1. The datasets are listed with a small warning icon to indicate that 1 or more preparation steps is needed. Begin by clicking the warning badge for SCHOOLS. This dataset was loaded from a non-spatial format (csv) and require preparation for mapping visualization. The dataset includes latitude/longitude columns, so select **Create Latitude/Longitude Index** and then click **Ok**. Observe that the dataset's icon changes from a table to a pin indicating that the dataset can be used for map visualization.
   
   ![Image alt text](images/xxx.png)  

2. Repeat for TRI_FACILITIES.

   ![Image alt text](images/xxx.png)
   
   
3. The remaining warning badges indicate that keys need to be defined for your datasets. Although this is not needed for basic mapping, we will add keys since keys are required for analyses you'll perform in a later in the workshop. Click on the warning icon for SCHOOLS and then click the link **Go to Dataset Columns**.

   ![Image alt text](images/xxx.png)

4.  Select ... verify... apply

   ![Image alt text](images/xxx.png)

5. Repeat for other datasets...

   ![Image alt text](images/xxx.png)




You may now [proceed to the next lab](#next).

## Learn More
* [Spatial Studio product portal] (https://oracle.com/goto/spatialstudio)

## Acknowledgements
* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - David Lapp, Database Product Management, April 2021
* **Lab Expiry** - March 31, 2022
