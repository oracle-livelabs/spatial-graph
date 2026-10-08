# Prepare the Career Graph Environment

## Introduction

The Career Explorer runs in an APEX application backed by Oracle Autonomous AI Database. Import the application and confirm that its support objects exist.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Import the Career Explorer application into the enabled APEX workspace.
- Open the Career Explorer entry page.

## Task 1: Download application from Github

1. Navigate to [GitHub](https://github.com/oracle-samples/oracle-graph/tree/master/shared/demos) and download the Career Explorer application to your desktop.

## Task 2: Log into APEX

1. Click the **Navigation Menu** in the upper left, navigate to **Oracle AI Database**, and select **Autonomous AI Database**.

    ![Navigating to Autonomous AI Database.](images/navigation-menu.png " ")

2. Select the compartment provided on **View Login Info**, and click on the **Display Name** for the **Autonomous AI Database**.

    ![Autonomous AI Database list with GHC Career Recommendation Graph selected.](images/select-autonomous-database.png " ")

3. Click Tool configuration then **Copy** the Public access URL under Oracle APEX. Paste this link in a new tab in your browser.

    ![Copy link to APEX.](images/apex-link.png " ")

4. Click **GHC_WORKSPACE** to log into the APEX workspace.

    ![Log in to APEX.](images/apex-login.png " ")

## Task 3: Import and launch the APEX application

1. Select **App Builder > Import**.

    ![Click App builder](images/app-builder.png " ")
    ![Click import](images/apex-import.png " ")

2. Upload the application that you downloaded in Task 1. Click **Next**. 

    ![Import app](images/import-app.png " ")

3. Review the settings. Use the `ghc_dev` application name, map the parsing schema to `GHC_USER`, under Build Status, click `Run and Build Application`, and under Import As Application, select `Reuse Application ID 100 From Imported Application`. Click **Import Application**.

    ![Import app](images/import-app-step-2.png " ")

4. Click **Run Application**.

    ![Run app](images/run-application.png " ")

5. Use your GHC_USER and password to log into the application

    ![Log into application](images/sign-in.png " ")

## Acknowledgements

- **Oracle documentation** - [Create a Graph User](https://docs.oracle.com/en/cloud/paas/autonomous-database/csgru/create-graph-user.html).
- **Last Updated By/Date** - Denise Myrick, Oracle AI Database Product Management, September 2026
