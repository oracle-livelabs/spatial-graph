# Analyze


## Introduction

.....


Estimated Lab Time: xx minutes


### Objectives

* .....

### Prerequisites

* .....


## Task 1: Identify schools in the projected flood area

You begin by   ..... 

1. To focus on schools and the projected flood area, turn visibility off for TRI\_FACILITIES and PARCELS. Then from the action menu for ANNUAL\_FLOOD\_2080\_10PCT, select **Zoom to layer**.

   ![Image alt text](images/analyze-01.png)

2. From the action menu for SCHOOLS, select **Spatial Analysis**. This opens the dialog to access the spatial analysis features of Oracle Database.

   ![Image alt text](images/analyze-02.png)

3. You will apply a spatial filter on schools based on containment in the projected flood area. So select the tab for **Filter** and click on the tile for **Return shapes that are inside another**.

   ![Image alt text](images/analyze-03.png)

4. For Analysis name, enter **SCHOOLS INSIDE FLOOD\_2060\_10PCT**. For Layer to be filtered select **SCHOOLS** and for Layer to use as teh flter select **ANNUAL\_FLOOD\_2060\_10PCT**. Then click **Run**.

   ![Image alt text](images/analyze-04.png)

   As shown in Lab 3 > Task 2 > Step 6, click the right facing arrowhead to expand the Data/Visualizations panel.

5. Observe your analysis listed under Analyses. Click and hold on your analysis, and then drag and drop onto the map. As you've previously, change the style of the layer: open the action menu for **SCHOOLS INSIDE FLOOD\_2060\_10PCT** , select **Settings** and change the color to red fill with white stroke (outline).

   ![Image alt text](images/analyze-05.png)


   **Note:** You can hover over a Layer, Dataset, or Analysis name that is truncated to see its full name in a tooltip.
   
6. To view the results of your spatial analysis in tabular form, click on the Visualizations tab and then drag and drop a table next to the map. You may drop the table on any edge of the map.

   ![Image alt text](images/analyze-06.png)


7. Click on the Data tab and then click and hold on your analysis, and then drag and drop into the table view. When done reviewing the results listing, click on the **X** to close the table view.

   ![Image alt text](images/analyze-07.png)


7. While zoomed out, you will observe some items in the results that appear very close to the projected flood area boundary. Zoom into one of these areas and observe that the items in the results are indeed inside the projected flood area.

   Technical details behind analyses are available. From the action menu for you analysis, select Properties.

   ![Image alt text](images/analyze-08.png)

8. In the Properties dialog, observe the section showing the analysis SQL.  In particular, note the SDO\_INSIDE operator which performs the spatial filter. The SQL is slightly more involved than the most generic example because it involves a function-based spatial index for schools instead of a geometry column, and also wraps the main query with an outer SELECT to de-duplicate schools in the event that a schools was inside multiple regions.

   Note also the automatically generated endpoint that streams the analysis results in GeoJSON format for consumption by any standards-based mapping client.

   ![Image alt text](images/analyze-09.png)

8. In Spatial Studio, analyses are themselves Datasets. In the main navigation panel click on the button for the **Datasets** page. Observe your analysis is listed so that it could be used in other projects, exported, or saved as a table or view.

   ![Image alt text](images/analyze-10.png)


## Task 2: Identify TRI Facilities near the projected flood area

You begin by   ..... 

1. In the main navigation panel click on the button to return to your **Active Project**. Adjust layer visibility so that the projected flood area and facilities are visible. From the action menu for TRI\_FACILITIES, select **Spatial Analysis**.

   ![Image alt text](images/analyze-11.png)

## Task 2: Identify parcels in contact with the projected flood area

You begin by   ..... 

1. ...

   ![Image alt text](images/xxx.png)




You may now [proceed to the next lab](#next).

## Learn More
* [Spatial Studio product portal] (https://oracle.com/goto/spatialstudio)

## Acknowledgements
* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - David Lapp, Database Product Management, April 2021
* **Lab Expiry** - March 31, 2022
