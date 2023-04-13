# Install Spatial Studio

## Introduction

This lab walks though the process of provisioning Oracle Spatial Studio (Spatial Studio) using the Oracle Cloud Marketplace.  The Oracle Cloud Marketplace provides apps and services provided by Oracle and 3rd parties. Details are available [here](https://docs.oracle.com/en/cloud/marketplace/marketplace-cloud/index.html).

Estimated Lab Time: 30 minutes

### Objectives

In this lab, you will:

* Learn how to install Spatial Studio from the Oracle Cloud Marketplace
* Learn how to set Spatial Studio repository schema on initial launch

### Prerequisites

* An Oracle Free Tier, Always Free, Paid or LiveLabs Cloud Account
* Repository schema created (Lab 3).

<!-- *This is the "fold" - below items are collapsed by default* -->

## Task 1: Select Spatial Studio from Marketplace

1. Click the **Navigation Menu** in the upper left and select **Marketplace**.

  ![Oracle Cloud Marketplace](https://oracle-livelabs.github.io/common/images/console/marketplace.png "Marketplace")

2. Search for Spatial Studio and then click on the Oracle Spatial Studio app

  ![Oracle Spatial Studio in Oracle Cloud Marketplace](images/env-marketplace-2.png "Oracle Spatial Studio Marketplace images")

3. Review the Usage Instructions, then accept the terms and conditions and click Launch Stack

  ![Launch stack to deploy Oracle Spatial Studio](images/env-marketplace-3.png "Launch Stack")

## Task 2: Create Stack Wizard

1. Optionally enter a custom name and description for the deployment stack. Then select the Compartment to use for the deployment and click Next

  ![Create stack wizard](images/env-marketplace-4.png "Create the stack using the wizard")

2. Select Availability Domain and Shape for the Compute Instance.

  Details on compute shapes are [here](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm). Check for quota availability of your desired Shape in Availability Domains. This is particularly important when using an Always Free shape:
    *In the OCI Console, navigate to Governance > Limits, Quotas, and Usage
    * For Service select Compute and for Scope select an Availability Domain
    *Confirm availability of your desired Shape
    * Change the Availability Domain selection if necessary to identify available quota

  ![Limits, quotas and usage for Oracle Cloud resources](images/env-marketplace-4-1.png "Limit for Compute resources")

  Having confirmed quota, make selections in Create Stack wizard.

  ![Set stack parameters](images/env-marketplace-5.png "Select compute instance")

  Then scroll down.

3. Optionally change the HTTPS port and Spatial Studio admin user name from the defaults. For the authentication of the Spatial Studio admin user, you have the option to use OCI Vault Secrets or a password. The image below shows an example using a password. For production deployments you are encouraged to use OCI Vault Secrets. Scroll down to the section on network configuration.

Note: By default the Spatial Studio admin user name is **admin**. This is a Spatial Studio application user distinct from the database user name (studio\_repo) created in Lab 3 for the repository schema stored in the database.

  ![Set more parameters, such as port and password](images/env-marketplace-6.png "Spatial Studio Advanced Configuration - Spatial Studio admin user password")

4. For networking, you have the option to automatically create a new VCN or an existing one. Select the Compartment for creating a new VCN or searching for existing VCNs.

The image below shows an example using Create New VCN. To use an existing VCN it must be in the same Availability Domain as selected above in Step 2. If you do not have other existing VCNs then the remaining defaults can be left as is. If you do have other existing VCNs then update the CIDR values to avoid conflict.

  ![Configure the network](images/env-marketplace-7.png "Spatial Studio Advanced Configuration - Network configuration")

  Scroll down to the SSH Keys section.

5. Loading a SSH public key enables access to Spatial Studio's file system for administrative purposes. The dialog has links to general SSH connection documentation. Submit your SSH public key by browsing to the key file or copy-pasting the key string. If you load you SSH public key from a file, the key file name will be displayed as shown in the image below. Click Next.

  ![Add SSH key](images/env-marketplace-8.png "Spatial Studio Advanced Configuration - Public SSH key")

6. Review the summary of your entries. If corrections are needed then click Back. Otherwise click Create to start the deployment process. You will be redirected to a Job Details page for the deployment.

  ![Create stack](images/env-marketplace-9.png "Review stack definition and create stack")

## Task 3: Monitor Deployment Progress

1. The Logs section at the bottom of the Job Details page will show progress. It will initially display a spinner while setting up for deployment.

  ![Monitor stack deployment job - Terraform Apply](images/env-marketplace-10.png "Monitor stack deployment progress")

  After a couple minutes you will see log information.

  ![Log information about deployment job](images/env-marketplace-11.png "Stack deployment log")

2. Scroll down to the bottom of the logs section. When complete you will see Apply Complete! followed by instance details. The last item listed is the Spatial Studio public URL. Copy this URL and paste into a browser.

  ![Deployment job successfully completed](images/env-marketplace-12.png "Output variables for deployed stack")

## Task 4: First-Time Login

1. Opening the Spatial Studio public URL for the first time will display a browser warning related to privacy and security. The specific warning depends on your platform and browser.

  ![Warning when opening Spatial Studio URL](images/env-marketplace-13.png "Browser connection warning")

  This is not a Spatial Studio issue; it is generic to  access of web sites that do not have a signed HTTPS certificate. Loading and configuring a signed certificate removes this warning. However the process of loading certificates in Jetty is beyond the scope of this workshop.

  Click the link to continue to the website.

2. Enter the Spatial Studio admin user name (default is admin) and the password you entered in the Step 2 (Create Stack wizard, item 3). Then click Sign In.

  ![Provide username and password to log into Spatial Studio](images/env-marketplace-14.png "Spatial Studio login dialog")

3. On the first login to a Spatial Studio instance, you are prompted for connection information for the database schema to use as the Spatial Studio's metadata repository. This is the database schema used for all of Spatial Studio's metadata and can also be used by Spatial Studio admin users for storing other data. You will use the schema created in Lab 3 so select Oracle Autonomous Database and click Next.

  ![Chose metadata connection type](images/env-marketplace-15.png "Choose type of Spatial Studio metadata repository")

4. Browse to (or or drag-and-drop) the Wallet file saved in Lab 3. After loading, the wallet file name will be listed as Selected Wallet. Click OK.

  ![Upload wallet](images/env-marketplace-16.png "Upload the connection wallet")

5. Enter the user name and password defined in Lab 2 and the service. Medium service level is appropriate for this workshop. Click OK.

  ![Enter connection details for metadata repository](images/env-marketplace-17.png "Enter connection details")

6. Wait for a few moments while Spatial Studio makes its initial connection to the schema and creates several metadata tables. When finished, Spatial Studio will open with Getting Started information.

  ![Spatial Studio homepage - Getting started](images/env-marketplace-18.png "Spatial Studio landing page")

## Task 5: Load Data and Create a Map

To verify that Spatial Studio is operating properly, you will load, prepare, and visualize a small data sample. The data contains a list of museums including name and address. You will geocode the data and visualize the data on an interactive map.

1. You will not create a connection here since you can use the Spatial Studio repository connection for this verification. Click the tile to **Create Dataset**.

  ![Start wizard to upload data](images/verify-1.png "Create a dataset")

2. Download the data sample file [here](https://objectstorage.us-ashburn-1.oraclecloud.com/p/VEKec7t0mGwBkJX92Jn0nMptuXIlEpJ5XJA-A6C9PymRgY2LhKbjWqHeB5rVBbaV/n/c4u04/b/livelabsfiles/o/data-management-library-files/sf_area_museums.xlsx) and save to convenient location. Then drag and drop the file to the file upload tile.  You can also click on the file upload tile and navigate to the file.

![Create a data set by uploading data](images/verify-2.png "Upload existing spreadsheet data")

3. In the data preview, set the upload Connection to SPATIAL\_STUDIO and set the data type for POSTAL_CODE to STRING. Then click **Submit**.

  ![Specify upload details](images/verify-3.png "Specify upload details and check column settings")

4. When the upload is complete, the dataset will be listed with a warning icon indicating actions need to be taken. Click on the warning icon and then click the link **Go to Dataset Columns** in order to assign a key column.

  ![Set the key column for the dataset](images/verify-4.png "Resolve dataset issues - choose or add key column")

5. Select NAME as the key and then click **Validate key**.

  ![Validate key](images/verify-5.png "Validate the chosen key")

   After you validate the key, click **Apply**.

6. Again click the warning icon and then click the button to **Geocode Addresses** to convert addresses to coordinate locations for map visualization.

  ![Geocode addresses](images/verify-7.png "Resolve dataset issues - geocode addresses")

7. Observe that the ADDRESS and POSTAL\_CODE columns were automatically detected for use in geocoding. Accept the defaults and click **Apply**.

  ![Geocode addresses mapping](images/verify-8.png "Map dataset with geocoding reference data")

  When geocoding is complete, you are returned to the Datasets page.

8. Click on the action menu for the SF\_AREA\_MUSEUMS dataset and select **Create Project**.

  ![Start creating project](images/verify-9.png "Create new project for the dataset")

9. Click and drag the SF\_AREA\_MUSEUMS dataset and drop anywhere on the map.

  ![Adding datasets and drag them into the map canvas](images/verify-10.png "Add datasets as layers to the project")

  The SF\_AREA\_MUSEUMS dataset will be added as a map layer, and the map will pan and zoom to the area of the data.

10. Click on the action menu for the SF\_AREA\_MUSEUMS layer and select **Settings**

  ![Data layer settings](images/verify-11.png "Define styles and more for the data layer")

11. Style the map layer by selecting a color and opacity of your choosing.

  ![Style setting](images/verify-12.png "Select color and opacity for data layer")

12. Click on the **Interaction** tab, enable **Show info window**, and select all columns. Then click on an item in the map to see an info window with the data values for the selected item.

  ![Settings for map interactions](images/verify-13.png "Define details for interacting with the map")

  This verifies that basic data preparation and visualization is functioning properly.

13.Click on the left navigation panel button to return to the Datasets page. Select the option to **Discard Changes** since you do not need to preserve this test.

  ![Discard changes](images/verify-14.png "Discard changes made for the current project")

14. With verification complete, you can delete the test Dataset and database table.  Click on the action menu for SF\_AREA\_MUSEUMS and select **Delete**

  ![Delete dataset](images/verify-15.png "Delete the dataset")

15. Select the option to delete the database table and click **OK**.

  ![Check to permanently delete the database table](images/verify-16.png "Delete the database table related to the dataset")

Oracle Spatial Studio is now provisioned and tested. The following Lab provides steps to tear down Spatial Studio when no longer needed.

## Task 6: Uninstall Spatial Studio (When No Longer Needed)

**If you would like to fully remove your Marketplace deployment, proceed with the following.**

1. Click the **Navigation Menu** in the upper left, navigate to **Developer Services**, and select **Stacks**.

  ![Clean up all deployed resources](https://oracle-livelabs.github.io/common/images/console/developer-resmgr-stacks.png "Remove Marketplace deployment")

2. Choose the Compartment and Name used in STEP 2. In the example shown below, a compartment named sandbox and Stack named Oracle Spatial Studio was used.

  ![Choose the proper compartment and select the stack to be deleted](images/env-marketplace-20.png "Select stack")

3. Select Terraform Actions > Destroy

  ![Destroy all resources deployed via the Oracle Spatial Studio stack](images/env-marketplace-21.png "Destroy deployed resources")

  You will be prompted to confirm. This will remove the Compute and Network artifacts created by the Marketplace deployment.

4. After removing the Spatial Studio app, your repository schema remains in place. To remove the repository schema, connect to the database as **admin** as done in Lab 3 and run the following.

  ```sql
  <copy>DROP USER studio_repo CASCADE;</copy>
  ```

## Learn More

* [Spatial Studio product page](https://www.oracle.com/database/spatial/#rc30p2)
* [Get started with Spatial Studio](https://www.oracle.com/database/technologies/spatial-studio/get-started.html)

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - David Lapp, Database Product Management, March 2023
