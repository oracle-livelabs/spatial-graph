# Explore Spatial Data with Oracle Spatial Studio on Autonomous AI Database Serverless

## Introduction

Operations teams often need to combine locations, asset history, weather observations, and field conditions before they can act. Oracle Spatial Studio provides a visual workspace for loading, mapping, and analyzing data in Autonomous AI Database Serverless.

In this workshop, you will build a regional operations project from synthetic field data. You will use Database Users to create or inspect an author account, load and geocode service-center data, and create a base map. You will then add historical asset movement, Redline context, wind animation, H3 aggregation, and a within-distance analysis.

### Prerequisites

- An Oracle Autonomous AI Database Serverless database that uses the ECPU compute model
- An `ADMIN` user for the optional Database Users task, or an instructor-provided Spatial Studio user with the `SPATIAL_AUTHOR` role and required database privileges
- Access to Spatial Studio through the Autonomous AI Database Tool configuration page or Database Actions
- The workshop data files linked in Lab 2
- An instructor-provided Object Storage PAR URL for the wind image, its relative object path if the URL grants bucket access, and its velocity ranges and spatial metadata when the image does not include them
- An attached dedicated Spatial Studio compute environment for the GeoRaster upload in Lab 3
- A modern browser with pop-ups allowed for Oracle Cloud applications

### Objectives

In this workshop, you will:

- Create or inspect a Spatial Studio author account in Database Users.
- Upload operational datasets, geocode address records, and verify geometry and key columns.
- Build a map and table visualization that supports routine operational decisions.
- Configure a historical spatiotemporal layer, H3 aggregation, and proximity result.
- Visualize wind flow and tune map motion.
- Draw, edit, save, and export Redline features.
- Create an H3 aggregation and run a within-distance spatial analysis.

Estimated Workshop Time: 3 hours

## Learn More

- [Using Oracle Spatial Studio on Autonomous AI Database, Release 26.1](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/get-started-using-spatial-studio1.html)
- [Access Spatial Studio](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/access-spatial-studio.html)
- [Set Up Spatial Studio Users and Privileges](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/set-spatial-studio-users-and-privileges.html)

## Acknowledgements

- **Authors** - Oracle LiveLabs
- **Last Updated By/Date** - Oracle LiveLabs, July 2026
- **Source** - [About Oracle Spatial Studio on Autonomous AI Database Serverless](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/oracle-spatial-studio.html)
