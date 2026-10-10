# Prepare the Career Graph Environment

## Introduction

The Career Explorer runs in an APEX application backed by Oracle Autonomous AI Database. Import the application and confirm that its support objects exist.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Import the Career Explorer application into the enabled APEX workspace.
- Open the Career Explorer entry page.

## Task 1: Download application

1. Download the [Career Explorer application](https://c4u02.objectstorage.us-ashburn-1.oci.customer-oci.com/p/9DEArLjsgbKXuJgQtSG95E8hMXRFtxgHR8jiHbqz4HgyVYXVnSo0SC_s-zq5CJA3/n/c4u02/b/hosted-files/o/f101.sql) to your desktop.

## Task 2: Log into APEX

1. On your reservation page, click View Login Info. Copy compartment name and the password. Click OCI.

    ![Navigating to Autonomous AI Database.](images/reservation-information.png " ")

2. Reset password to a custom password.

    ![Change your account password.](images/change-password.png " ")

3. Click the **Navigation Menu** in the upper left, navigate to **Oracle AI Database**, and select **Autonomous AI Database**.

    ![Navigating to Autonomous AI Database.](images/navigation-menu.png " ")

4. Select the compartment provided on **View Login Info**, and click on the **Display Name** for the **Autonomous AI Database**.

    ![Autonomous AI Database list with GHC Career Recommendation Graph selected.](images/select-autonomous-database.png " ")

5. Click Tool configuration then **Copy** the Public access URL under Oracle APEX. Paste this link in a new tab in your browser.

    ![Copy link to APEX.](images/apex-link.png " ")

6. Click **GHC_WORKSPACE** to log into the APEX workspace.

    ![Log in to APEX.](images/apex-login.png " ")

## Task 3: Import and launch the APEX application

1. Select **App Builder > Import**.

    ![App Builder in the APEX workspace.](images/app-builder.png " ")

    ![Import in App Builder.](images/apex-import.png " ")

2. Upload the application that you downloaded in Task 1. Click **Next**.

    ![Upload the application file.](images/import-app.png " ")

3. Review the settings. Use the `ghc_dev` application name, map the parsing schema to `GHC_USER`, under Build Status, click `Run Application`, and under Import As Application, select `Reuse Application ID 101 From Imported Application`. Click **Import Application**.

    ![Import settings for the application.](images/import-app-step-2.png " ")

4. Click **Run Application**.

    ![Run Application button.](images/run-application.png " ")

5. Use your GHC_USER and password to log into the application

    ![Career Explorer sign-in page.](images/sign-in.png " ")

6. Career Explorer opens on one page. The numbered steps in the banner map to the tasks in Labs 2 and 3. The **Lab 1** section confirms that setup is complete and shows the signed-in user.

    ![Career Explorer home with the step banner and the completed Lab 1 section.](images/career-explorer-home.png " ")

## Acknowledgements

- **Authors** - Denise Myrick, Ramu Murakami Gutierrez, Ruiqi Jiang
- **Last Updated By/Date** - Denise Myrick, Oracle AI Database Product Management, October 2026
