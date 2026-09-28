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

4. Select **Draw Line** and trace a possible access route from the nearest service center into the advisory area.

    ![Draw line](./images/line.png "Draw line")

    Tip: Right-click and choose **Close polygon** to complete the drawing.

5. The orange color of the line is difficult to see. Select the line and click **Edit Feature Properties**, then choose a different color so the line stands out more. You can also change the width.

    ![Edit line](./images/edit-line.png "Edit line")

6. Select **Draw Point** to mark a proposed staging location. Select the point and click **Edit Feature Properties**, then choose a different color so the point stands out more. You can also change the width.

    ![Edit point](./images/point.png "Edit point")

## Task 2: Edit the Redline features

1. Select **Select feature**, and then select the advisory polygon.

2. Move one or more vertices to refine its boundary.

    ![Resize polygon](./images/resize-polygon.png "Resize polygon")

3. Open **Edit Feature Properties**, enter `Weather advisory area` as the description, and adjust its fill or outline.

    ![Edit polygon](./images/edit-polygon.png "Edit polygon")

4. Select the polygon and place your mouse near one of the edges. The mouse pointer will turn into a rotation icon. Click and drag to rotate the polygon.

    ![Rotate polygon](./images/rotate-polygon.png "Rotate polygon")

## Task 3: Toggle Visibility

1. In the Redline toolbar, select **Toggle Visibility**.

    ![Visibility on](./images/visibility-on.png "Visibility on")

2. Observe that the shapes appear and disappear as you toggle the button.

    ![Visibility off](./images/visibility-off.png "Visibility off")

3. Select **Save** to persist the Redline drawings with the project.

    You may now **proceed to the next lab**.

## Learn More

- [Use the Redline Map Tool](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/style-map-layer1.html)

## Acknowledgements

- **Authors** - Denise Myrick, Oracle Database Product Management
- **Last Updated By/Date** - Denise Myrick, August 2026
