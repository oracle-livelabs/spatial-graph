# Visualize Wind Flow and Tune Animations

## Introduction

Wind flow converts gridded horizontal and vertical speed values into moving particles. You will add a prepared wind GeoRaster, tune its display, and animate moving assets.

Estimated Time: 25 minutes

### Objectives

In this lab, you will:

- Add a wind dataset to the active project.
- Tune particle count, speed, fading, and the color palette.
- Confirm that historical asset animation continues alongside the wind visualization.

## Task 1: Verify the wind dataset

1. Open **Datasets** and locate `REGIONAL_WIND_FLOW`.

2. Open its properties and confirm that Spatial Studio enables **Wind Animation**.

3. Review the minimum and maximum values for the `u` and `v` components without changing them.

    The instructor staged an image whose red channel encodes `u` and whose green channel encodes `v`. The stored ranges convert image values back to speeds.

4. If the dataset is absent, notify the instructor. GeoRaster image loading requires dedicated Spatial Studio compute and an Object Storage pre-authenticated request URL.

## Task 2: Add and tune wind flow

1. Add `REGIONAL_WIND_FLOW` to `Regional Operations Explorer`.

2. Drag the wind dataset onto the map.

3. Open the wind layer menu and note the current **Number of Particles**, **Speed Factor**, and **Fade Opacity** values.

4. Increase the particle count until the flow is easy to interpret without obscuring the point layers.

5. Adjust **Speed Factor** within its zero-to-one range and observe the change in on-screen motion.

6. Adjust **Fade Opacity** and observe the length and lifetime of particle trails.

7. Select **Set palette** and apply a color scheme that separates lower and higher speed ranges.

8. Keep map pitch at zero and do not rotate the map. Spatial Studio pauses wind flow when you pitch or rotate the map.

## Task 3: Check your work

1. Pause and resume the historical timeline and confirm that the asset symbols respond.

2. Temporarily change the wind particle count and confirm that the map refreshes.

3. Save the project with the wind layer visible and the timeline displayed.

    You may now **proceed to the next lab**.

## Learn More

- [About the Spatial Studio compute node](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/compute-environment-spatial-studio.html)
- [Visualize a Wind Animation Dataset](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/visualize-wind-animation-dataset.html)

## Acknowledgements

- **Authors** - Oracle LiveLabs
- **Last Updated By/Date** - Oracle LiveLabs, October 2026
