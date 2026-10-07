# Source Traceability

Review updated: 2026-10-05

## Sources and Classification

| Source | Classification | Use in the workshop |
| --- | --- | --- |
| [Set Up Spatial Studio Users and Privileges](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/set-spatial-studio-users-and-privileges.html) | Oracle-owned public documentation | `SPATIAL_AUTHOR` role, required system privileges, and `SPATIAL$PROXY_USER` connection grant. |
| [Access Spatial Studio](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/access-spatial-studio.html) | Oracle-owned public documentation | Supported access paths and sign-in flow. |
| [Load Raster Images into Oracle Spatial GeoRaster](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/create-dataset-loading-raster-images-oracle-spatial-georaster.html) | Oracle-owned public documentation | PAR-based raster upload, metadata checks, and compute-environment prerequisite. |
| [Create a Wind Animation Dataset](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/create-wind-animation-dataset.html) and [Visualize a Wind Animation Dataset](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/visualize-wind-animation-dataset.html) | Oracle-owned public documentation | GeoRaster dataset setup, `u`/`v` ranges, wind controls, and map rotation/pitch limitation. |
| [Configure Spatiotemporal for Non-Live Moving Objects](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/configure-spatiotemporal-non-live-moving-objects-dataset.html) and [Visualize Spatiotemporal Datasets](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/visualize-spatiotemporal-datasets.html) | Oracle-owned public documentation | Timestamp and entity settings, UTC/GMT requirement, timeline, and trail behavior. |
| [Use the Redline Map Tool](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/use-redline-map-tool.html) | Oracle-owned public documentation | Editing, duplicate, rotation/resize shortcuts, saving, and GeoJSON export behavior. |
| [Prepare an H3 Aggregation Dataset](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/prepare-dataset-h3-aggregation.html) and [Generate a Spatial Analysis Dataset](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/generate-spatial-analysis-dataset.html) | Oracle-owned public documentation | H3 dataset and Spatial Studio analysis workflow. |
| Files under `spatial-studio/adbs-access-upload/files/` | Synthetic workshop data authored for this repository | Service-center points and addresses, historical asset positions, and weather observations used by the upload lab. |
| Existing screenshots under `spatial-studio/adbs-*/images/` | Oracle product screenshots already present in the workshop repository | Image links and selected screenshots were reviewed against the corresponding lab steps. New screenshots were not captured because the supplied LiveLabs session displayed a different workshop. |

## Attribution and Rights Review

The technical references are Oracle-owned public documentation. The data files are synthetic and authored for this repository. No external or unclear source material was added, so no third-party permission or attribution is required for these changes.
