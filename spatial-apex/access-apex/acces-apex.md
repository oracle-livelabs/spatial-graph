# Sign up for an APEX Workspace

## Introduction

This lab walks you through the steps to get started using Oracle APEX on Oracle Autonomous Database (Autonomous Transaction Processing [ATP]). In this lab, you provision a new ATP instance and create an APEX workspace.

Estimated Time: 5 minutes

Objectives

In this lab, you will:

- Navigate to the Oracle Autonomous Transaction Processing cloud service using the Oracle Cloud Infrastructure console.
- Provision a new Autonomous Transaction Processing database.
- Create an APEX workspace.

Watch the video below for a quick walk-through of the lab.
[Create an App from a Spreadsheet](videohub:1_rcmsmco3)

## Task 1: Access the Autonomous Database 

1. Click the **Navigation Menu** in the upper left, navigate to **Oracle Database**, and select **Autonomous Database**.

    ![Navigating to Autonomous Database.](images/navigation-menu.png " ") 

2. Select the compartment provided on **View Login Info**, and click on the **Display Name** for the **Autonomous Database**. 

    ![Selecting Autonomous Database in the Navigation Menu.](images/select-autonomous-database.png " ") 

## Task 2: Create a APEX workspace

1. Within your new database, APEX is not yet configured. Therefore, when you first access APEX, you will need to log in as an APEX Instance Administrator to create a workspace.

    Click the **Apex Instance URL** provided on the ATP overview screen.

    ![Open APEX instance](images/apex-instance.png " ")

2. Now, click **Launch APEX**

    ![Launch APEX instance](images/launch-apex-inst.png " ")


3. Enter the password for the Administration Services and click **Sign In to Administration**.     
    The password is the same as the one entered for the ADMIN user when creating the ATP instance: **```SecretPassw0rd```**

    ![Administration Services login page](images/log-in-as-admin.png " ")

4. Click **Create Workspace**.

    ![Create Workspace page](images/welcome-create-workspace.png " ")

5. Depending on how you would like to create your workspace, select **New Schema** or **Existing Schema**. If you are getting started, select **New Schema**.

    ![Choose type of schema](images/choose-schema.png " ")

6. In the Create Workspace dialog, enter the following:

    | Property | Value |
    | --- | --- |
    | Workspace Name | DEMO |
    | Workspace Username | DEMO |
    | Workspace Password | **`SecretPassw0rd`** |


    Click **Create Workspace**.

    ![Create Workspace dialog](images/create-workspace.png " ")

7. In the APEX Instance Administration page, click the **DEMO** link in the success message.         
    >**Note:** This will log you out of APEX Administration so that you can log into your new workspace.

    ![APEX Instance Administration page](images/log-out-from-admin.png " ")  

8. On the APEX Workspace log in page, enter **``SecretPassw0rd``** for the password, check the **Remember workspace and username** checkbox, and then click **Sign In**.

    ![APEX Workspace log in page](images/log-in-to-workspace.png " ")


## Summary

  At this point, you know how to create an APEX Workspace and you are ready to start building amazing apps, fast.

  You may now **proceed to the next lab**.

## Acknowledgements
- **Author** - Apoorva Srinivas, Senior Product Manager, Ramu Murakami Gutierrez, Product Manager 
- **Last Updated By/Date** - Ramu Murakami Gutierrez, Product Manager, July 2024
