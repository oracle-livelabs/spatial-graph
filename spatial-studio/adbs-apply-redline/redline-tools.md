# Annotate the Map with Redline Tools

## Introduction

Redline tools capture operational context directly on a map without changing the source dataset. You will mark an advisory area, label an access route, edit the shapes, and export the drawing set as GeoJSON.

Estimated Time: 20 minutes

### Objectives

In this lab, you will:

- Draw point, line, and polygon Redline features.
- Edit, duplicate, resize, rotate, and annotate features.
- Save the project and export Redline features as GeoJSON.

## Task 1: Draw an advisory area and access route

1. Under Data, click **Add dataset**, then select `SERVICE_CENTERS`. Click **OK**.

    ![Add service centers dataset](./images/add-service-centers-dataset.png "Add service centers dataset")

2. Drop `SERVICE_CENTERS` onto map.

    ![Add service centers to map](./images/add-service-centers-map.png "Add service centers to map")

3. Select **Actions** on the map toolbar, and then select **Redline**.

    ![Turn on Redline](./images/redline.png "Turn on Redline")

4. Select **Draw Polygon** and draw an advisory area that intersects several weather observations.

    ![Draw polygon](./images/polygon.png "Draw polygon")

    Tip: Right-click and choose **Close polygon** to complete the drawing.

5. Select **Draw Line** and trace a possible access route from the nearest service center into the advisory area.

    ![Draw line](./images/line.png "Draw line")

6. Select the line, open **Edit Feature Properties**, and change its color or width so it stands out against the map.

    ![Edit line](./images/edit-line.png "Edit line")

7. Select **Draw Point** to mark a proposed staging location. Select the point, open **Edit Feature Properties**, and choose a contrasting color.

    ![Edit point](./images/point.png "Edit point")

## Task 2: Edit the Redline features

1. Select **Select feature**, and then select the advisory polygon.

2. Move one or more vertices to refine the polygon boundary.

    ![Selected polygon with editable vertices](./images/resize-polygon.png "Edit polygon vertices")

3. Open **Edit Feature Properties**, enter `Weather advisory area` as the description, and adjust its fill or outline.

    ![Edit polygon](./images/edit-polygon.png "Edit polygon")

4. Select the polygon. Hold **Ctrl+R** and drag to rotate it. Hold **Ctrl+S** and drag to resize it.

    ![Rotate polygon](./images/rotate-polygon.png "Rotate polygon")

5. Select the polygon, right-click it, choose **Duplicate Feature**, and move the copy to another part of the map.

## Task 3: Toggle Visibility

1. In the Redline toolbar, select **Toggle Visibility**.

    ![Visibility on](./images/visibility-on.png "Visibility on")

2. Observe that the shapes appear and disappear as you toggle the button.

    ![Visibility off](./images/visibility-off.png "Visibility off")

3. Select **Save** to persist the Redline drawings with the project. When you reopen the project, select **Actions** > **Redline** to make the saved shapes editable again.

## Task 4: Export the Redline features

1. On the Redline toolbar, select **Export Features**, and then select **Download as GeoJson**.

2. Save the `.geojson` file to your computer. Descriptions and object IDs are included in the export; custom colors and outline widths are not.

    You may now **proceed to the next lab**.

## Learn More

- [Use the Redline Map Tool](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/use-redline-map-tool.html)

## Acknowledgements

- **Authors** - Denise Myrick, Oracle Database Product Management
- **Last Updated By/Date** - Denise Myrick, October 2026
