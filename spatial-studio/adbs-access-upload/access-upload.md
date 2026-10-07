# Set Up Access and Load Operations Data

## Introduction

You will load four small datasets for one operating region.

Estimated Time: 25 minutes

### Objectives

In this lab, you will:

- Upload GeoJSON and address datasets to your database schema.
- Verify dataset keys, geometry columns, and timestamps.

## Task 1: Upload service-center data

1. Download [service-centers.geojson](files/service-centers.geojson) and [service-center-addresses.csv](files/service-center-addresses.csv) from the workshop files.

2. In Spatial Studio, open **Datasets**, select **Create Dataset**, and then select **Local File**.

3. Upload `service-centers.geojson`, and then select **Create**.

4. Select your workshop connection in **Upload to connection**.

5. Set the destination dataset name to `SERVICE_CENTERS`, review the detected columns, and then select **Submit**.

6. Open the dataset properties and confirm that `CENTER_ID` is the key and that the GeoJSON geometry column contains points.

## Task 2: Upload the address, movement, and weather datasets

1. Upload `service-center-addresses.csv` through **Create Dataset** > **Local File**. Name it `SERVICE_CENTER_ADDRESSES`. Use `CENTER_ID` as the key. Retain the address fields as text.

2. Repeat the Local File upload for [field-asset-history.geojson](files/field-asset-history.geojson).

3. Name the dataset `FIELD_ASSET_HISTORY`, use `OBS_ID` as the key, and confirm that Spatial Studio imports `OBSERVED_AT` as a date or timestamp column.

4. Repeat the upload for [weather-observations.geojson](files/weather-observations.geojson).

5. Name the dataset `WEATHER_OBSERVATIONS`, use `OBS_ID` as the key, and confirm that `WIND_SPEED` is numeric.

6. Return to **Datasets** and verify that all four datasets appear without unresolved key or geometry warnings.

    If a warning appears, open it, go to the dataset columns, assign the stated key column, validate the key, and apply the change.

## Task 3: Check your work

1. Confirm that the Datasets page contains `SERVICE_CENTERS`, `SERVICE_CENTER_ADDRESSES`, `FIELD_ASSET_HISTORY`, and `WEATHER_OBSERVATIONS`.

2. Open each dataset and use its preview to confirm that the points fall in the northeastern United States.

3. Confirm that `FIELD_ASSET_HISTORY` contains repeated `ASSET_ID` values with different `OBSERVED_AT` timestamps.

    You may now **proceed to the next lab**.

## Learn More

- [Access Spatial Studio](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/access-spatial-studio.html)
- [Set Up Spatial Studio Users and Privileges](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/set-spatial-studio-users-and-privileges.html)
- [Create a Dataset by Uploading a File](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adstu/create-dataset-uploading-file.html)

## Acknowledgements

- **Authors** - Denise Myrick, Oracle Database Product Management
- **Last Updated By/Date** - Denise Myrick, October 2026
