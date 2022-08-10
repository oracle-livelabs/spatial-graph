# Deploy Spatial Studio to Oracle Cloud

## Introduction

In this lab you deploy Spatial Studio from the Cloud Marketplace using Always Free resources. The Cloud Marketplace takes care of installing and configuring Spatial Studio and an Autonomous Database. The Spatial Studio instance that is created is meant to be temporary, for use during this workshop. 

Estimated Lab Time: 15 minutes

### Objectives

In this lab, you will:
* Deploy Spatial Studio from the Oracle Cloud Marketplace using Always Free resources.

### Prerequisites

* An Oracle Free Tier, Always Free, Paid or LiveLabs Cloud Account
* You are an Admin in the cloud account. For example, your own Free Tier account.

<!-- *This is the "fold" - below items are collapsed by default* -->

## Task 1: Verify Availability of Compute Resource

Before starting the Spatial Studio deployment it is necessary to verify the availability domain having quota for the Always Free compute shape. 

1. Navigate to **Governance & Administration > Limits, Quota, and Usage**

   ![Image alt text](images/quota-01.png "Image title")

2. The Scope menu lists availability domains. Select the first availability domain, type **micro** in the Resource menu, and select **Cores for Standard.E2.1.Micro VM Instances**. 

   ![Image alt text](images/quota-02.png "Image title")

3. The result listing shows the service limit (quota), usage, and availability of the selected shape in the selected availability domain. In the example below, there is no availability for the selected availability domain.

  ![Image alt text](images/quota-03.png "Image title")

4. If the selected availability domain does not have quota, change to the next availability domain and again enter **micro** in the Resource menu and select **Cores for Standard.E2.1.Micro VM Instances**. In this case the second availability domain has quota.

 ![Image alt text](images/quota-04.png "Image title")

 Note the availability domain having quota for your target compute shape, as you will need to select it when installing Spatial Studio from the Cloud Marketplace. 


## Task 2: Install Spatial Studio from Cloud Marketplace

1. Click the hamburger icon at the top left to open the main Navigation Menu. Select **Marketplace** and then click **All Applications**.

   ![Image alt text](images/mp-01.png "Image title")

2. Search for **spatial** and then click on the **Oracle Spatial Studio** app

   ![Image alt text](images/mp-02.png "Image title")
 
4. If you have an existing preferred compartment then select it, otherwise leave the default (root). Accept the terms and conditions, and click **Launch Stack**

   ![Image alt text](images/mp-04.png "Image title")


5. Accept defaults and click **Next**

   ![Image alt text](images/mp-05.png "Image title")

6. Select the availability domain having quota, as you identified in Task 1.  Select the Always Free shape **VM.Standard.E2.1.Micro**.  If you have available cloud credits or a paid account you may select a paid shape instead.

   ![Image alt text](images/mp-06.png "Image title")

    Then scroll down.


7. By default, Spatial Studio allows only HTTPS access, which requires additional configuration for secure access. For this workshop you are deploying a temporary instance that will not include any sensitive information. Therefore uncheck **HTTPS only** and read the help text to be sure you understand the intended usage. 
  
   ![Image alt text](images/mp-07.png "Image title")

    Then scroll down.

8.  Enter a password for the Spatial Studio admin user. This is the password you will use when you log in to Spatial Studio.    

   ![Image alt text](images/mp-07a.png "Image title")


9.  Under Configure Networking, leave the defaults to have a network created for you.  

    Then scroll down.

10. SSH keys enable access to the Spatial Studio server for administration such as restarting the instance and checking log files. In this case your Spatial Studio instance is temporary, meant for the duration of this workshop. So administration is not needed. Therefore **uncheck** the **Add SSH key** option. 

   ![Image alt text](images/mp-09.png "Image title")

  Then scroll down.

6. Spatial Studio requires access to an Oracle Database. Accept the defaults to have an Autonomous Database created and configured for you.

     ![Image alt text](images/mp-11.png "Image title")

  Scroll down and enter a password for the database user that stores Spatial Studio's metadata. This will be used in the automatic configuration of metadata fir your Spatial Studio instance. Then click **Next**.

      ![Image alt text](images/mp-12.png "Image title")

7. You are now on the Review step of the wizard. Scroll to the bottom and make sure **Run apply** is checked. Then click **Create**.

     ![Image alt text](images/mp-13.png "Image title")

8. Wait approximately 5 min for the status to change from IN PROCESS to SUCCEEDED. 
   
     ![Image alt text](images/mp-14.png "Image title")

   After the status is SUCCEEDED, **wait an additional 3 min** for automated post-install steps to complete before proceeding. 
   
## Task 3: Log in to Spatial Studio

1. Click on the **Application Information** tab, and then click for **Spatial Studio HTTP URL**.

   ![Image alt text](images/mp-15.png "Image title")


2. Log in with user name **admin** and the password you entered in the Step 7 above.

   ![Image alt text](images/mp-17.png "Image title")

4. Once logged in, hover over the icons in the main navigation panel on the left to see tooltips with the page names.

   ![Image alt text](images/mp-19.png "Image title")

5. At any time you may also click on the "hamburger" icon at the top left to expand and collapse the main navigation panel. 

   ![Image alt text](images/mp-20.png "Image title")   

You are now logged in and ready to start using Spatial Studio.

## Learn More
* [Spatial Studio product page](https://oracle.com/goto/spatial)

## Acknowledgements
* **Author** - David Lapp, Database Product Management
* **Last Updated By/Date** - David Lapp, Database Product Management, March 2021

