# Workshop Details

## Short Description

Map and analyze regional operations data in Oracle Spatial Studio. Geocode service centers, visualize historical asset movement and wind flow, and identify weather coverage with H3 and proximity analysis.

## Long Description

Build a regional operations project from the workshop's synthetic service-center, asset-history, and weather datasets. Use Spatial Studio on Autonomous AI Database Serverless to geocode address records, create a map, animate historical movement, annotate operational context with Redline, and display a wind GeoRaster. Finish by creating an H3 aggregation and a within-distance analysis of weather observations near service centers.

The wind image is provided by the instructor as an Object Storage PAR URL with its spatial metadata and velocity ranges. Raster upload requires an attached dedicated Spatial Studio compute environment.

## Prerequisites

- An Oracle Autonomous AI Database Serverless instance using the ECPU compute model.
- An `ADMIN` user for the account setup lab, or an instructor-provided `SPATIAL_AUTHOR` account with the required database privileges.
- Access to Spatial Studio through Database Actions or the Autonomous AI Database Tool configuration page.
- The instructor-provided PAR URL and wind image metadata for the GeoRaster task.
- A modern browser with pop-ups allowed for Oracle Cloud applications.

## Workshop Outline

1. Create a Spatial Studio author account and sign in.
2. Load service-center, address, asset-history, and weather data.
3. Geocode addresses, load the wind image into GeoRaster, and build a base map and table visualization.
4. Configure historical asset movement and use the timeline.
5. Draw, edit, duplicate, save, and export Redline features.
6. Add the wind dataset and tune its particle animation.
7. Create an H3 aggregation and analyze weather observations within 25 km of service centers.
