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

5. Observe your analysis listed under Analyses. Click and hold on your analysis, and then drag and drop onto the map. In the Layers List, open the action menu for **SCHOOLS INSIDE FLOOD\_2060\_10PCT** and select **Settings** and change the color to red fill with white stroke (outline).

   ![Image alt text](images/analyze-05.png)


   **Note:** You can hover over a Layer, Dataset, or Analysis name that is truncated to see its full name in a tooltip.
   

6. 




## Task 2: Identify the nearest TRI facilities to the projected flood area

You begin by   ..... 

1. ...

   ![Image alt text](images/xxx.png)

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
