# Deploy Spatial Studio to Oracle Cloud

## Introduction

In this lab, you deploy Spatial Studio from the Cloud Marketplace using Always Free resources. The Cloud Marketplace takes care of installing and configuring Spatial Studio and an Autonomous Database. The Spatial Studio instance created is meant to be temporary for use during this workshop.

Estimated Lab Time: 15 minutes

Watch the video below for a quick walk-through of the lab.

[Deploy Spatial Studio to Oracle Cloud](videohub:1_63orvw8q)

### Objectives

In this lab, you will:

* Deploy Spatial Studio from the Oracle Cloud Marketplace using Always Free resources.

### Prerequisites

* An Oracle Cloud Account
* You are an Admin for the cloud account.

<!-- *This is the "fold" - below items are collapsed by default* -->

## Task 1: Verify availability of Compute resource

Before starting the Spatial Studio deployment, it is necessary to verify the availability domain having quota for the Always Free compute shape.

1. Navigate to **Governance & Administration > Limits, Quota, and Usage**.

   ![Check limits and quotas](images/quota-01.png)

2. The Scope menu lists availability domains. Select the first availability domain, type **micro** in the Resource menu, and select **Cores for Standard.E2.1.Micro VM Instances**.

   ![Select compute shape](images/quota-02.png)

3. The result listing shows the service limit (quota), usage, and availability of the selected shape in the selected availability domain. In the example below, there is no availability for the selected availability domain.

   ![Check availability for selected compute shape](images/quota-03.png)

4. If the selected availability domain does not have quota, change to the next availability domain and again enter **micro** in the Resource menu and select **Cores for Standard.E2.1.Micro VM Instances**. In this case, the second availability domain has quota.

   ![Check availability for alternative compute shape](images/quota-04.png)

 Note the availability domain having quota for your target compute shape, as you will need to select it when installing Spatial Studio from the Cloud Marketplace.

## Task 2: Install Spatial Studio from Cloud Marketplace

1. Click the hamburger icon at the top left to open the main Navigation Menu. Select **Marketplace** and then click **All Applications**.

   ![Go to Oracle MarketPlace](images/mp-01.png)

2. Search for **spatial** and then click on the **Oracle Spatial Studio** app.

    **Note:**  Make sure you select "Oracle Spatial Studio" and not "Oracle Spatial Studio for Roving Edge Infrastructure".

   ![Search for application Oracle Spatial Studio](images/mp-02.png)

3. If you have an existing preferred compartment, then select it, otherwise leave the default (root). Accept the terms and conditions, and click **Launch Stack**

   ![Launch stack for Oracle Spatial Studio](images/mp-04.png)

4. Accept defaults and click **Next**.

   ![Define parameters for the deployment of Oracle Spatial Studio](images/mp-05.png)

5. Select the availability domain having quota, as you identified in Task 1.  Select the Always Free shape **VM.Standard.E2.1.Micro**. If you have available cloud credits or a paid account, you may select a paid shape instead.

   ![More parameters for the deployment](images/mp-06.png)

   Then scroll down.

6. By default, Spatial Studio allows only HTTPS access, which requires additional configuration for secure access. For this workshop you are deploying a temporary instance that will not include any sensitive information. Therefore uncheck **HTTPS only** and read the help text to be sure you understand the intended usage. For Spatial Studio Admin User Name enter **admin** (lower case). This user name will be case sensitive.

   ![Spatial Studio Advanced Configuration](images/mp-07.png)

   Then scroll down.

7. Enter a password for the Spatial Studio admin user. This is the password you will use when you log in to Spatial Studio.

   ![Password for Spatial Studio Admin user](images/mp-07a.png)

   Then scroll down.

8. Under Configure Networking, leave the defaults to have a network created for you. Then scroll down.

9.  SSH keys enable access to the Spatial Studio server for administration such as restarting the instance and checking log files. In this case your Spatial Studio instance is temporary, meant for the duration of this workshop. So administration is not needed. Therefore **uncheck** the **Add SSH key** option.

   ![Add SSH key for the compute instance used by Oracle Spatial Studio](images/mp-09.png)

   Then scroll down.

10. Spatial Studio requires access to an Oracle Database. Check the box for Always Free and accept the other defaults to have an Autonomous Database created and configured for you. If you have available cloud credits or a paid account, you may uncheck this box and select a paid configuration instead.

   ![Configure Database to be used as repository by Oracle Spatial Studio](images/mp-11.png)

   Then scroll down.

11. For Autonomous database service level, select **medium**. Then enter a password for the database user that stores Spatial Studio's metadata. This will be used in the automatic configuration of metadata for your Spatial Studio instance. You will not need to use this password again in this workshop. Then click **Next**.

   ![Deploy Spatial Studio](images/mp-12.png)

12. You are now on the Review step of the wizard. Scroll to the bottom and make sure **Run apply** is checked. Then click **Create**.

   ![Deploy Spatial Studio](images/mp-13.png)

13. Wait approximately 5 min for the status to change from IN PROCESS to SUCCEEDED.

   ![Deploy Spatial Studio](images/mp-14.png)

   After the status is SUCCEEDED, **wait an additional 5 min** for automated post-install steps to complete before proceeding.

## Task 3: Log in to Spatial Studio

1. Click on the **Application Information** tab, and then click the link for **Spatial Studio HTTP URL**.

   ![Fetch URL to start Spatial Studio](images/mp-15.png)

2. Log in with user name **admin** and the password you entered in the Step 7 above.

   ![Login dialog for Spatial Studio](images/mp-17.png)

3. Once logged in, hover over the icons in the main navigation panel on the left to see tooltips with the page names.

   ![Spatial Studio Getting Started page](images/mp-19.png)

4. At any time you may also click on the "hamburger" icon at the top left to expand and collapse the main navigation panel.

   ![Spatial Studio Navigation pane](images/mp-20.png)

You are now logged in and ready to start using Spatial Studio.

You may now **proceed to the next lab**.

## Learn more

* [Oracle Spatial product page](https://www.oracle.com/database/spatial)
* [Get Started with Spatial Studio](https://www.oracle.com/database/technologies/spatial-studio/get-started.html)
* [Spatial Studio documentation](https://docs.oracle.com/en/database/oracle/spatial-studio)

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Contributors** - Jesus Vizcarra
* **Last Updated By/Date** - David Lapp, August 2023
