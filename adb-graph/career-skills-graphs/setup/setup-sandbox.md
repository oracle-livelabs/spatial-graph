# Prepare the Career Graph Environment

## Introduction

The Career Explorer runs in an APEX application backed by Oracle Autonomous AI Database. Import the application and confirm that its support objects exist.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Import application 100 into the enabled APEX workspace.
- Open the Career Explorer entry page.

## Task 1: Log into APEX

1. Click the **Navigation Menu** in the upper left, navigate to **Oracle AI Database**, and select **Autonomous AI Database**.

    ![Navigating to Autonomous AI Database.](images/navigation-menu.png " ")

2. Select the compartment provided on **View Login Info**, and click on the **Display Name** for the **Autonomous AI Database**.

    ![Selecting Autonomous AI Database in the Navigation Menu.](images/select-autonmous-database.png " ")

3. Click Tool configuration then **Copy** the Public access URL under Oracle APEX. Paste this link in a new tab in your browser.

    ![Copy link to APEX.](images/apex-link.png " ")

4. Click **GHC_WORKSPACE** to log into the APEX workspace

## Task 1: Import and launch the APEX application

1. Select **App Builder > Import**.

2. Upload [f100.sql](files/f100.sql). Click **Next**. 

3. Review the settings. Use the `ghc_dev` application name, map the parsing schema to `GHC_USER`, and under Import As Application, select `Reuse Application ID 100 From Imported Application`. Click **Import Application**.

4. Click **Run Application**.

3. Open application 100 and select **Run**. Sign in with the APEX account created for the workshop.

    The APEX account and the `GHC_DEV` database user are separate accounts. Ask the workspace administrator to create the APEX account if it does not exist.

4. Open **Career Explorer**. Confirm that the page shows a profile editor and an **Explore career options** button.

## Task 2: Check the application support boundary

1. Ask the instructor to confirm these objects:

    - `CAREER_PROFILE_TASK_HISTORY`
    - `CAREER_PROFILE_AGENT_TOOLS.RUN_PROFILE_TASKS`
    - `CAREER_PROFILE_TASK4_RUNNER.RUN`
    - The career tables and property graph used by the application

2. Stop if any object is missing. The import can succeed while the **Explore career options** action still lacks its database dependencies.

## Learn More

- [Create a Graph User](https://docs.oracle.com/en/cloud/paas/autonomous-database/csgru/create-graph-user.html)
- [Create and Manage Users on Autonomous AI Database](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/manage-users-create.html)
- [Manage AI Profiles](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-manage-profiles.html)

## Acknowledgements

- **Oracle documentation** - [Create a Graph User](https://docs.oracle.com/en/cloud/paas/autonomous-database/csgru/create-graph-user.html).
- **Last Updated By/Date** - Denise Myrick, Oracle AI Database Product Management, September 2026
