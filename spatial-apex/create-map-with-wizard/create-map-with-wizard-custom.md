# Create Map with Wizard

## Introduction

Oracle APEX provides a wizard to create a variety of useful page types. In this lab you will use the wizard to create a new application and a page with a map. You then inspect the resulting page to gain an understanding of the Map Region.

Estimated Lab Time: 10 minutes

### Objectives

* Understand the basics of APEX Map Region

### Prerequisites

* Completion of Lab 1: Install Sample Maps application

## Task 1: Create a New App with a Map Page using the Wizard

The wizard provides a quick and easy way to create a new application and your first map.

1. Navigate to **App Builder** and click **Create**.
    ![Create Application Wizard in App Builder](images/create-map-01.png)

2. Select **Use Create App Wizard**.
    ![Create an Application - New Application](images/create-map-02.png)

3. Enter a name for your application and click **Add Page**.
    ![Create an Application - Form](images/create-map-03-custom.png)

4. Select **Map** as the page type.
    ![Create an Application - Add Page](images/create-map-04.png)

>**Note**: This is the same wizard as using **Create Page** in an existing application.

5. Enter **Airports and States Map** as Page Name. (With this wizard, the Page Name will also be used as the name of the Map Region created in the page.)  Click the icon to the right of the table input to select the **EBA\_SAMPLE\_MAP\_AIRPORTS** table. For geometry column, select **GEOMETRY**, and finally select a column to use a tooltip when mousing over an item in the map. Then click on **Add Page**.
    ![Create an Application - Create Map Page](images/create-map-05-custom.png)

6. Observe your new page is now listed under **Pages**. Click **Create Application**.
    ![Create an Application - Finalize creating the application](images/create-map-06-custom.png)

7. You are navigated to the page where you manage your new application. Click **Run Application**.
    ![Run Application](images/create-map-07.png)

8. Sign in to your application using your APEX login username and password.
    ![Sign in to your application](images/create-map-08.png)

9. The default layout we selected for our application provides a home page with links to other pages. From the home page, navigate to the page you just created.
    ![Application Home Page](images/create-map-09-custom.png)

10. Observe the page includes an interactive map showing airport locations with tooltips as you configured.
    ![View the Map](images/create-map-10-custom.png)

## Task 2: Inspect the Map Page and Make Changes

You will now inspect the Map Region created by the wizard.

1. In the Developer Toolbar at the bottom of the page, click on the **Page 2** button to edit the page.
    ![Edit the Page](images/create-map-11-custom.png)

2. In the Page tree on the left, under **Body** click **Airports and States Map**. This is the title of the Map Region created by the Create Page wizard. It is, by default, the same as the Page title and can be changed as desired. Let's change the name of this region to **My Map Region**. In the Region details panel on the right, observe that this Region has a type of **Map**.
    ![View Page Properties](images/create-map-12-custom.png)

3. Map Regions include Layers which are the points, lines, and polygons (from Oracle Spatial, GeoJSON, or coordinates)  displayed on top of a background map. When stepping through the Create Page wizard, you selected a Map using the GEOMETRY column in table EBA\_SAMPLE\_MAP\_AIRPORTS (i e., Oracle Spatial data).

    So the wizard has created one layer containing those airport locations. By default the Layer has the same name as the Page, i.e. **Airports and States Map**. This can be changed as desired. 
    Let's change the name of this layer to **Airports**.
    ![Inspect Map Layer Properties](images/create-map-13-custom.png)

    To inspect this Layer, in the Page tree on the left panel, under Layers click on **Airports**. Configuration details are displayed in the **Layer** panel on the right. For information about configuration items, click on the **Help** tab in the middle panel. When you then click on configuration items, help info is displayed for that item. For example click in the **Layer Type** menu to see help on its options.
    ![Inspect Map Layer Properties](images/create-map-14-custom.png)

4. Scroll down in the Layer panel to see the other configuration options that were set by the wizard, including Column Mapping where the geometry data type is set. Here you are using Oracle's native spatial data type, SDO_GEOMETRY, and the column name is GEOMETRY.
    ![Inspect Map Layer Properties](images/create-map-15-custom.png)

    Return to the **Layout** tab and set the primary key column to **ID**.
    ![Inspect Map Layer Properties](images/create-map-16-custom.png)

5. Scroll down in the Layer properties panel on the right. To limit the airports rendered in the layer, add the where clause **LAND\_AREA\_COVERED > 2500**.  Enable the option Use Spatial Index using the switch.
    ![Update Layer properties](images/create-map-24-custom.png)

6. Scroll down in the Layer properties panel on the right to the **Info Window** section. This is where you can configure the content of a info window that pops up when clicking on an item in the map. Enable **Advanced Formatting** by clicking the switch button and then paste the following into the text area **HTML Expression**:

    ```
    <copy>
    <strong>&AIRPORT_NAME.</strong><br>
    &CITY., &STATE_NAME.<br>
    Code: &IATA_CODE.
    </copy>
    ```

    ![Update Layer properties](images/create-map-25a-custom.png)

## Task 3: Add a Layer to the Map

1. In the Page tree on the left, right-click on **Layers** under your Map Region and select **Create Layer**.
    ![Add a Layer](images/create-map-26-custom.png)

2. Click on the newly created Layer in the Page tree under your Map Region. Then in the Layer details panel on the right, update the Name to **States**, Layer type to **Polygons**, and Source to **EBA\_SAMPLE\_MAP\_SIMPLE\_STATES**.
    ![Update Layer properties](images/create-map-27-custom.png)

3. Layers will be rendered in the order they appear under Layers in the page tree. To have Airports render on top States, drag the **States** layer above the Airports layer under Layers in the page tree. Scroll down in the Layer details panel on the right to the Column Mapping section section. Select geometry data type **SDO\_GEOMETRY** and geometry column **GEOMETRY**. Under Appearance, select a stroke (outline) colors of your choosing. Set fill opacity to a value of your choosing, noting that a value of 1 means totally opaque so that the background map is not visible.
    ![Update Layer order](images/create-map-28.png)

4. At the upper right, click **Save** and then green **Run** button.
    ![Save and Run page](images/create-map-29.png)

5. Observe your map render with States and Airports layers. Click and drag the map to pan, and use the navigation control at the top right to zoom in and out. Click on an Airport to see the info window that you configured. Mouse over a state to see the tooltip that you configured. Turn layers off and on with the checkboxes under the map.
    ![Interact with the map](images/create-map-30.png)

Congratulations on creating your first maps. There is a lot of capability beyond the basics you have just explored. Feel free to experiment with adjustments to parameters and then Save and Run to see results. In the next Lab you will configure a new Map Region from scratch.

This concludes the lab. You may now proceed to the next lab.

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date**  - Ramu Murakami Gutierrez, Database Product Management, July 2024
