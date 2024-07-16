# Provision Autonomous Database Shared Free Tier Instance

## Introduction

This lab walks you through the steps to get started using the Oracle Autonomous Database (Autonomous Data Warehouse [ADW] and Autonomous Transaction Processing [ATP]) on Oracle Cloud. You will provision a new ATP instance using the cloud console.

*Note1: While this lab uses ATP, the steps are identical for creating and connecting to an ADW database.*

*Note2: If you want to create an Always Free autonomous database, you need to be in a region where Always Free Resources are available. (Not all regions have Always Free Resources)*

Estimated time: 5 minutes

Watch a video demonstration of provisioning an autonomous database in Autonomous Transaction Processing (same steps apply to provisioning an autonomous database in Autonomous Data Warehouse):

[youtube](youtube:Q6hxMaAPghI)

### Objectives

- Learn how to provision a new free tier Autonomous Transaction Processing instance

### Prerequisites

* An [Oracle Cloud Account](https://www.oracle.com/cloud/free/). You may use your own cloud account, a cloud account that you obtained through a trial, a Free Tier account, or a training account whose details were given to you by an Oracle instructor.

## Task 1: Choose ATP from the Services Menu

1. Login to the Oracle Cloud.

2. Once you are logged in, you are taken to the cloud services dashboard where you can see all the services available to you. Click the navigation menu in the upper left to show top level navigation choices.

    **Note:** You can also directly access your Autonomous Data Warehouse or Autonomous Transaction Processing service in the **Quick Actions** section of the dashboard.

    ![OCI Console](images/oci-console.png)

3. The following steps apply similarly to either Autonomous Data Warehouse or Autonomous Transaction Processing. This lab shows provisioning of an Autonomous Transaction Processing (ATP) database. Click the **Navigation Menu** in the upper left, navigate to **Oracle Database**, and select **Autonomous Transaction Processing**.

    ![Select ATP](images/database-atp-v2.png)

4. Make sure your Workload Type is **Transaction Processing** or **All** to see your Autonomous Transaction Processing instances. You can use the **List Scope** drop-down menu to select a Compartment. Select your **root compartment**, or **another compartment of your choice** where you will create your new ATP instance. If you want to create a new compartment or learn more about them, click [here](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingcompartments.htm#three).

    ***Note** - Avoid the use of the ManagedCompartmentforPaaS compartment as this is an Oracle default used for Oracle Platform Services.*

## Task 2: Creating the ADB instance

1. Click **Create Autonomous Database** to start the instance creation process.

    ![Create ADB](images/create-adb.png)

2.  This brings up the **Create Autonomous Database** screen where you will specify the configuration of the instance.

3. Provide basic information for the Autonomous Database:

    - **Choose a compartment** - Select a compartment for the database from the drop-down list.
    - **Display Name** - Enter a memorable name for the database for display purposes. For this lab, use **adb1**.
    - **Database Name** - Use letters and numbers only, starting with a letter. Maximum length is 30 characters. (Underscores not initially supported.) For this lab, use **adb1**.

4. Choose a workload type. Select the workload type for your database from the choices:

    - **Transaction Processing** - For this lab, choose **Transaction Processing** as the workload type.
    - **Data Warehouse** - Alternately, you could have chosen Data Warehouse as the workload type.

    ![Workload type](images/workload-type-v2.png)

5. Choose a deployment type. Select the deployment type for your database from the choices:

    - **Serverless** - For this lab, choose **Serverless** as the deployment type.
    - **Dedicated Infrastructure** - Alternately, you could have chosen Dedicated Infrastructure as the workload type.

    ![Deployment type](images/deployment-type-v2.png)

6. Configure the database:

    - **Always Free** - For this lab, if available, you can select this option to create an always free autonomous database, or not select this option and create a database using your paid subscription. An always free database comes with 1 CPU and 20 GB of storage. Selecting Always Free will suffice for this lab.
    - **Choose database version** - Select a database version from the available versions (`19c` or `23ai`).
    - **ECPU count** - Number of ECPUs.
    - **Compute auto scaling** - For this lab, keep auto scaling **disabled**.
    - **Storage (TB)** - Storage capacity in gigabytes or terabytes.
    - **New Database Preview** - If a checkbox is available to preview a new database version, do **not** select it.

    ![Select CPU and storage](images/atp-choose-cpu-storage-v2.png)

7. Create administrator credentials:

    - **Password and Confirm Password** - Specify the password for ADMIN user of the service instance. The password must meet the following requirements:
    - The password must be between 12 and 30 characters long and must include at least one uppercase letter, one lowercase letter, and one numeric character.
    - The password cannot contain the username.
    - The password cannot contain the double quote (") character.
    - The password must be different from the last 4 passwords used.
    - The password must not be the same password that is set less than 24 hours ago.
    - Re-enter the password to confirm it. Make a note of this password.

    ![Password](images/password.png)

8. Choose network access:
    - For this lab, accept the default, "Secure access from everywhere".
    - If you want a private endpoint, to allow traffic only from the VCN you specify - where access to the database from all public IPs or VCNs is blocked, then select "Virtual cloud network" in the Choose network access area.
    - You can control and restrict access to your Autonomous Database by setting network access control lists (ACLs). You can select from 4 IP notation types: IP Address, CIDR Block, Virtual Cloud Network, Virtual Cloud Network OCID.

    ![Network access](images/network-access.png)

9. Choose a license type. For this lab, choose **License Included**. The two license types are:

    ![License](images/license_2.png)

    Click on Switch to Bring your own license (BYOL), if you want to change the license type.

    - **Bring Your Own License (BYOL)** - Select this type when your organization has existing database licenses.
    - **License Included** - Select this type when you want to subscribe to new database software licenses and the database cloud service.

10. Click **Create Autonomous Database**.

    ![Create Autonomous Database](images/create-adb_2.png)

11. Your instance will begin provisioning. In a few minutes the state will turn from Provisioning to Available. At this point, your Autonomous Transaction Processing database is ready to use! Have a look at your instance's details here including its Name, Database Version, OCPU Count and Storage size.

11.  Your instance will begin provisioning. In a few minutes the state will turn from Provisioning to Available. At this point, your Autonomous Transaction Processing database is ready to use! Have a look at your instance's details here including its Name, Database Version, OCPU Count and Storage size.
    ![Status provisioning](images/atp-graph-provisioning-v2.png)
    ![Status available](images/atp-graph-available-v2.png)

You may now proceed to the next lab.

## Want to Learn More?

Click [here](https://docs.oracle.com/en/cloud/paas/atp-cloud/index.html) for documentation on using Autonomous Transaction Processing.

## Acknowledgements

- **Author** - Nilay Panchal
- **Adapted for Cloud by** - Richard Green, Ryota Yamanaka, Karin Patenge
- **Last Updated By/Date** - Denise Myrick, July 2024

