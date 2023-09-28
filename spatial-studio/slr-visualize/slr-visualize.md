# Visualize spatial data

## Introduction

In this lab you visually explore the projected flood regions and cultural features. You create an interactive map and apply data-driven styling to expose location relationships and patterns.

Estimated Lab Time: 20 minutes

Watch the video below for a quick walk-through of the lab.

[Visualize spatial data using Oracle Spatial Studio](videohub:1_74fmvydy)

### Objectives

* Learn how to create interactive maps based on the data you have prepared.
* Learn how to configure the style and interactive behavior of your map.
* Understand the use of Projects to save your work.

### Prerequisites

* Completion of Lab 2: Load and prepare data

## Task 1: Create project

You begin by creating a Project. A Project is where you visualize and analyze your data, and then save your work.

1. Navigate to the Projects page and click **Create Project**.

   ![Create project](images/vis-01.png)

2. Move your mouse over the map. To pan the pan, click and hold and then drag the map. To zoom in and out, use your mouse wheel.

   Alternatively, you can display a navigation widget by clicking on the gear icon above the map and selecting the **Navigation Bar** dropdown. Choose **Zoom and Compass**, and then click **OK**.

   ![Visualization settings](images/vis-01a.png)

   Enabling navigation controls will show a navigation widget in the map.

   ![Visualize data](images/vis-01b.png)

3. Click **Add Dataset**, select all of your datasets, and then click **OK**.

   ![Add dataset](images/vis-02.png)

4. Drag and drop FLOOD2080 into the map.

   ![Drag dataset as layer onto the map](images/vis-03.png)

5. Repeat for FLOOD2060 and then FLOOD2040.

   ![Drag more datasets as layers onto the map](images/vis-04.png)

   **Note:** If your layers are in a different order, you may click-hold-drag layers up or down in the Layers list to change their order.

6. Zoom into an area of overlapping flood areas to observe the differences in the flood models over time.

   ![Zoom into area](images/vis-05.png)

7. View individual flood models by clicking the eye icon to toggle layer visibility.

   ![Toggle viewing datasets (layers)](images/vis-06.png)

8. You will use the FLOOD2060 for the following steps, so remove FLOOD2040 and FLOOD2080 from the map. Select **Remove** from the action menu for FLOOD2040.

   ![Remove dataset (layer)](images/vis-07.png)

   Then repeat for FLOOD2080.

9. Adjust the map to fit FLOOD2060 by selecting **Zoom to layer** from the action menu.

   ![Zoom to layer](images/vis-08.png)

## Task 2: Configure map layers

Next you add map layers and apply styling.

1. From the action menu for FLOOD2060, click **Settings**.

   ![Settings for dataset (layer)](images/vis-09.png)

2. You are now in the Layer Settings dialog. Under Fill click on the color tile and adjust to dark blue and use the slider to reduce opacity. Under Outline, change the width to 0. You may need to scroll down to see all settings.

   ![Set styling for dataset (layer)](images/vis-10.png)

2. In later steps you be selecting items in the map. To avoid selecting the entire flood area you now configure the layer to not be selectable. From the Configure pull-down select **Interaction**. Change the **Allow selection** switch to off. The flood area is still able to be used for visualization and analysis, it is just not selected in the map with a mouse click.

   ![Set styling for dataset (layer)](images/vis-10a.png)


3. At the top of the Layer Settings dialog, click on **back arrow** to return to the Layers List. Please take note of this step as you will navigate using this back arrow many times in this workshop.

   ![Go back to layers list](images/vis-11.png)

4. Drag and drop **SCHOOLS** onto the map. Then from the SCHOOLS layer action menu select **Settings**.

   ![Drag another dataset as layer onto the map](images/vis-12.png)

5. Scroll down to see sections on basic (fill) and stroke (outline) styles. Change the fill opacity to 100%. Change the stroke color to white and opacity to 100%.

   ![Change settings for the dataset (layer)](images/vis-16.png)

6. Scroll to the top of the Settings dialog, pull down the Configure menu, and select **Interaction**.

   ![Select Interaction](images/vis-17.png)

7. Scroll down to the Tooltip section. Enable tooltips and select **NAME** as the tooltip column. Then mouse over schools to view the tooltips.

   ![Configure tooltip](images/vis-18.png)

   As you did in a previous step, scroll to the top of the Settings dialog and click **back arrow** to return to the Layers list.

   ![Go back to layers list](images/vis-18a.png)

   Next you configure styles dynamically driven by data.

8. Drag and drop the **FACILITIES** dataset onto the map. Then from the FACILITIES layer action menu select **Settings**.

   ![Drag another dataset as layer onto the map](images/vis-19.png)

9. Change the fill color to magenta and opacity to 100%. Change the stroke color to white and opacity to 100%.

   ![Change style for the dataset (layer)](images/vis-20.png)

10. From the Radius menu, select the option **Based on data**.

   ![Define color coding based on data](images/vis-21.png)

11. From the column menu, select **RISK\_SCORE** as the column to drive the map symbol size. Click the **pencil button** to create value bins for symbol sizing. Enter **0** for minimum, **1000** for maximum,  **Interval** for grouping, and **4** for number of ranges. Then click **Regenerate bin values**.

   ![Select column that contains the data for color coding](images/vis-23.png)

12. Update the sizes for the bins to **4**, **6**, **8**, **10**.

   ![Update sizes for bins](images/vis-24.png)

   Then click the **back arrow** at the top link to return to Layer Settings.

13. Next you configure pop-up windows. From the Configure menu, select **Interaction**.

   ![Change settings for Interaction](images/vis-25.png)

14. In the Settings dialog, scroll down to the Info window section. Enable info windows using the **Show info window** switch, and select columns of your choosing. Then click on a facility in the map to observe the info window pop-up.

   ![Enable Show Info window](images/vis-26.png)

  Scroll to the top of the Settings dialog and click **back arrow** to return to the Layers list.

15. Drag and drop the **BUILDINGS** dataset onto the map. Then move the BUILDINGS layer to the bottom of the layers list so that other layers such as the flood model render on top. To move the layer in the layers list, click-hold-drag the layer.

   ![Drag another dataset as layer onto the map](images/vis-27.png)

16. Zoom into an area with buildings along the flood boundary to observe the overlap.

   ![Zoom into the dataset (layer)](images/vis-28.png)

   The BUILDINGS layer includes an attribute for square footage.  You next style the parcels according to this attribute.

17. As you have done in previous steps, from the BUILDINGS layer action menu, select **Settings**. Under the Fill section change the Color menu selection to **Based on data**.

   ![Define color coding based on data](images/vis-29.png)

18. In the Column menu select **AREA\_SQ\_FT** as the column to use for controlling building fill color. Click the button to **Create bin values**. Set the minimum and maximum value to 100 and 10,000 respectively and click "Regenerate bin values". 

   ![Select column that contains the data for color coding](images/vis-30.png)

    Click the **Set palette** button and select a color palette of your choosing.

       ![Choose a color palette](images/vis-30a.png)

       Navigate the map to explore the relationships between the flood area and your other layers. Add and remove the other flood models to observe differences in the relationships.

       In the next lab you will perform spatial analyses to identify items that satisfy various spatial relationships with the flood model.

19. This is a good time to save your work. Click the **Save** button on the top right. Give your project a name such as SLR Project, then click **Save**.

   ![Save your project](images/vis-31.png)

20. From the main navigation panel on the left, navigate to the **Projects** page. Observe the thumbnail of your project is displayed. You can revisit the project later by clicking on the thumbnail.

   ![Find your project in the projects view](images/vis-32.png)

You may now **proceed to the next lab**.

## Learn more

* [Oracle Spatial product page](https://www.oracle.com/database/spatial)
* [Get Started with Spatial Studio](https://www.oracle.com/database/technologies/spatial-studio/get-started.html)
* [Spatial Studio documentation](https://docs.oracle.com/en/database/oracle/spatial-studio)

## Acknowledgements

- **Author** - David Lapp, Database Product Management, Oracle
- **Contributors** - Denise Myrick, Jayant Sharma
- **Last Updated By/Date** - David Lapp, August 2023
