# Install the Sample Maps Application

## Introduction

Oracle APEX provides access to a portfolio of sample applications that highlight specific areas of functionality. Among these is the Sample Maps application which showcases the mapping capabilities in Oracle APEX. A wide variety of examples are provided to serve as functional examples and starting points for further customization. In this lab you will install and configure the Sample Maps application.

Estimated Lab Time: 15 minutes

### Objectives

* Install the Sample Maps application
* Load supporting data

### Prerequisites

* Oracle APEX 21.1+ is required. The screenshots in this workshop are taken using APEX 24.1. Since we generally recommend using the [latest version of APEX](https://www.oracle.com/tools/downloads/apex-downloads/), expect occasional small differences in the user interface.

## Task 1: Install the Application

   >**Note:** Your interface may look different because the screenshots are shown in **Light Mode**. You can change this by clicking on the username in the top right corner and selecting your preferred mode.

1. Begin by clicking on **App Builder**.

   ![APEX Application Builder](images/install-sample-maps-00.png)

2. Click **Install a Starter or Sample App**.

   ![Select Starter or Sample App](images/install-sample-maps-01.png)

   **Note:** If your Workspace has existing application(s) then click **Create** and then **Starter App**.

3. Scroll down to **Sample Maps** and click **Install**.

   ![Image alt text](images/install-sample-maps-03.png)

4. Once installation is complete, click the **Run** icon.

   ![Click Run Application](images/install-sample-maps-11.png)

5. Sign in to the Sample Maps application using your APEX workspace username and password.

   ![Sign in](images/install-sample-maps-12.png)

## Task 2: Load Data

1. You are now in the Sample Maps application which provides numerous examples of maps and spatial operations in APEX. On initial launch a warning message is displayed regarding data loading. Click on the **Data Loading** link within that message. You will navigate to a page where you complete loading of demo data.

   ![Click on Data Loading](images/install-sample-maps-13.png)

2. The Data Loading page shows the loading status of the US States and Airports datasets used by the Sample Maps application and the rest of this workshop. Upon installation of the Sample Maps application, these datasets are only partially loaded. To complete the sample data loading, you may either load directly from files stored in GitHub, or you may first download the files and load from your local system. If you are running APEX in a network that requires a proxy to access GitHub, then you should use the latter option.

   If your APEX instance does not require a proxy to access GitHub (for example, apex.oracle.com or APEX wth Oracle Autonomous Database), then click on the button to load **Directly from GitHub** and then click **Load Dataset** at the top right.

   ![Click on Directly from GitHub](images/install-sample-maps-14.png)

   If your APEX instance requires a proxy to access GitHub (for example, APEX running behind your corporate firewall), or if you have other issues loading directly from GitHub, then click the button **Upload Files** which provides alternate instructions.

3. When data loading is complete you will see a notification at the top right, and the warning message is gone. The Sample Maps application is now ready to use.

   ![Data Loading confirmation](images/install-sample-maps-15.png)

## Task 3: Explore the Sample Maps Application

1. Clicking on any of the tiles navigates to the associated page in the application. As an example, click on **Map and Report**.

   ![Navigate to Map and Report page](images/install-sample-maps-16.png)

2. In this page, clicking on an item in the report on the right centers the map on the item and opens an info popup. Clicking on the hamburger icon at the top left corner opens a navigation panel to access other pages in the application.

   ![Interact with the map](images/install-sample-maps-17.png)

3. Click items in the navigation panel to access other pages in the application.

   ![Navigation panel shows other pages](images/install-sample-maps-18.png)

4. To close the navigation panel click the icon at the top left. You can also navigate to the application home page by clicking on **Sample Maps** on the top left.

   ![Close navigation panel](images/install-sample-maps-19.png)

## Task 4: Explore the Demo Data

1. Return to APEX, click **SQL Workshop** and then **Object Browser**.

   ![SQL Workshop - Object Browser](images/install-sample-maps-20.png)

2. Observe the tables created by the data loading step performed previously. Click on **EBA\_SAMPLE\_MAP\_AIRPORTS**. Observe that the columns includes a column named GEOMETRY that has the type SDO\_GEOMETRY (Oracle's native spatial data type).

   ![Table with native geometry column](images/install-sample-maps-21.png)

3. Click on the **Data** tab to view the table contents.

   ![Table contents](images/install-sample-maps-22.png)

<!--
   Then scroll to the right to see the geometry column. Since airports are stored as points, APEX displays a string representation of the point geometry value. Points are always based on a single coordinate so it makes sense for APEX to display the value in this way.

   ![Point geometries](images/install-sample-maps-23.png)


4. Click on **EBA\_SAMPLE\_MAP\_SIMPLE_STATES**. Again, observe that the columns includes a column named GEOMETRY that has the type SDO\_GEOMETRY (Oracle's native spatial data type).

   ![Table with native geometry column](images/install-sample-maps-24.png)

5. Click on the **Data** tab to view the table contents. Since this table stores states, the geometries are polygons. APEX does not display a string representation of these values since they may include be extremely long sets of coordinates.

   ![Polygon geometries](images/install-sample-maps-25.png)
-->
4. Observe the tables with names like **MDRT_....$**. These are automatically created and managed behind the scenes by the database to support spatial indexes on other tables. You never manually create, update, or delete these tables. They are solely to support spatial analysis operations and can be ignored.

   ![Spatial index artifacts](images/install-sample-maps-26.png)

5. Finally, you can run a basic spatial query with this data.  Click on **SQL Workshop** and then  **SQL Commands**.

   ![SQL Workshop - SQL Commands](images/install-sample-maps-27.png)

6. The following query returns the number of airports with land coverage over 1000 acres that are within 100km of Texas. Notice the use of the native spatial operator **sdo\_within\_distance**. Copy and paste the query into the SQL Commands window and then click **Run** at the top right.

    ```
    <copy>
    SELECT count(a.id) AS number_of_airports
    FROM EBA_SAMPLE_MAP_AIRPORTS a,
         EBA_SAMPLE_MAP_SIMPLE_STATES b
    WHERE b.state_code= 'TX'
      and land_area_covered > 1000
      and sdo_within_distance(a.geometry, b.geometry, 'distance=100 unit=KM') = 'TRUE'</copy>
     ```

   ![Spatial query](images/install-sample-maps-28.png)

7. In the sdo\_within\_distance operator, update the distance to 300km and re-run. Observe the result changes based on the larger search area.

   ![Spatial query](images/install-sample-maps-29.png)

In a later lab you will configure a map that displays the results of this query where the state and distance are controlled by the menus in the page.

You now have installed and explored the Sample Maps application and data. Next you move on to begin creating your own application and maps.

This concludes the lab. You may now **proceed to the next lab**.

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Contributors** - Carsten Czarski, APEX Development, Ramu Murakami Gutierrez, Database Product Management, Oracle
* **Last Updated By/Date** - Denise Myrick, Database Product Management, November 2024
