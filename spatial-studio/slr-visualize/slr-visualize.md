# Visualize


## Introduction

.....


Estimated Lab Time: xx minutes


### Objectives

* .....

### Prerequisites

* .....


## Task 1: Create Project

You begin by   ..... 

1. Navigate to the Projects page and click **Create Project**.

   ![Image alt text](images/vis-01.png)

2. Click **Add Dataset**, select all of your datasets, and then click **OK**.

   ![Image alt text](images/vis-02.png)

3. Drag and drop ANNUAL\_FLOOD\_2080\_10PCT into the map. 

   ![Image alt text](images/vis-03.png)

4. Repeat for ANNUAL\_FLOOD\_2060\_10PCT and then ANNUAL\_FLOOD\_2040\_10PCT.

   ![Image alt text](images/vis-04.png)

   **Note:** If your layers are in a different order, you may click-hold-drag layers up or down in the Layers list to change their order.

5. Using your mouse wheel, zoom into an area of overlapping flood areas to observe the differences in the flood models over time. 

   ![Image alt text](images/vis-05.png)

6. View individual flood models by clicking the eye icon to toggle layer visibility.  

   ![Image alt text](images/vis-06.png)

7. You will use the 2060 flood model for the following steps, so remove 2040 and 2080 from the map. Select **Remove** from the action menu for ANNUAL\_FLOOD\_2040\_10PCT.

   ![Image alt text](images/vis-07.png)

  Then repeat for ANNUAL\_FLOOD\_2080\_10PCT.

8. Adjust the map to fit the 2060 flood model by selecting **Zoom to layer** from the action menu.

   ![Image alt text](images/vis-08.png)

## Task 2: Configure map layers

Next you add map layers and apply styling.

1. In the action menu for ANNUAL\_FLOOD\_2060\_10PCT, click **Settings**.

   ![Image alt text](images/vis-09.png)

2. You are now in the Layer Settings dialog. Under Fill click on the color tile and adjust to dark blue and use the slider to reduce opacity. Under Outline, change the width to 0. You may need to scroll down to see all settings.

   ![Image alt text](images/vis-10.png)

3. At the top of the Layer Settings dialog, click on **Back** to return to the Layers List.

   ![Image alt text](images/vis-11.png)

4. Drag and drop **PARCELS**, **SCHOOLS**, and **TRI\_FACILITIES** onto the map. You may drag individually or multi-select and drag together.

   ![Image alt text](images/vis-12.png)

5. Spatial Studio allows you to create multiple maps and/or tables in your project. You will only create this one map, so you can collapse the Data/Visualizations panel to gain screen space. Hover over the right edge of the panel and click on the collapse icon (left-facing arrowhead).

   ![Image alt text](images/vis-13.png)


 6. Once collapsed, panels may be restored by hovering and clicking on the expand icon (right-facing arrowhead).

   ![Image alt text](images/vis-14.png)

======


1.  Drop SCHOOLS onto the map. Style opaque green fill, white stroke.
   
2.  Drop TRI_FACILITIES onto the map. Style opaque magenta fill, white stroke.

3.  Drop PARCELS onto the map. Drag to bottom of layers. Zoom in. Style lt grey fill, dark grey stroke.
   
4.  Style PARCELS by PCAT 
    
5.  Style TRI\_FACILITIES by risk score
   
6.  Configure SCHOOL and TRI\_FACILITY info windows






You may now [proceed to the next lab](#next).

## Learn More
* [Spatial Studio product portal] (https://oracle.com/goto/spatialstudio)

## Acknowledgements
* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - David Lapp, Database Product Management, April 2021
* **Lab Expiry** - March 31, 2022
