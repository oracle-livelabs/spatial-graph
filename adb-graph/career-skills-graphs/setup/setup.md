# Prepare the Career Graph Environment

## Introduction

The Career Explorer runs in an APEX application backed by Oracle Autonomous AI Database. First verify the database user and APEX workspace. Then import the application and confirm that its support objects exist.

Estimated Time: 10 minutes

### Objectives

In this lab, you will:

- Verify `GHC_USER` with Graph, REST, GraphQL, Web Access, and `DBMS_CLOUD_AI` access.
- Import application 100 into the enabled APEX workspace.
- Open the Career Explorer entry page.

## Task 1: Create the GHC_DEV user

1. Open **Database Actions** as `ADMIN` for the instructor-provided Autonomous AI Database.

2. Select **Administration > Database Users > Create User**. Enter:

    - **User Name**: `GHC_USER`
    - **Password**: input your password
    - **Quota on tablespace DATA**: Unlimited

3. Enable these capabilities:

    - **Graph**
    - **REST, RESTful Services and SODA, GraphQL, and Web Access**
    - **DBMS_CLOUD_AI package**, if the form exposes the option

4. Select **Create User**. The Graph option normally adds the `GRAPH_DEVELOPER` role. Web Access supports Database Actions and local file loading.

## Task 2: Verify the user capabilities

1. Sign in to Database Actions as `GHC_USER`. Open **SQL > SQL Worksheet** and run [verify-ghc-dev.sql](files/verify-ghc-dev.sql).

2. Confirm these results:

    - The connected user is `GHC_USER`.
    - A graph role or privilege appears, normally `GRAPH_DEVELOPER` or `CREATE PROPERTY GRAPH`.
    - `DBMS_CLOUD_AI` appears in the received grants.
    - The expected AI profile appears when the instructor has configured it.

3. Stop if Graph or Web Access is missing. Ask the instructor to update the account before continuing.

## Task 3: Import and launch the APEX application

1. Open the enabled APEX workspace. Select **App Builder > Import**.

2. Upload [f100.sql](files/f100.sql). Keep application **100**, use the `ghc_dev` application name, and map the parsing schema to `GHC_USER`.

3. Open application 100 and select **Run**. Sign in with the APEX account created for the workshop.

    The APEX account and the `GHC_USER` database user are separate accounts. Ask the workspace administrator to create the APEX account if it does not exist.

4. Open **Career Explorer**. Confirm that the page shows a profile editor and an **Explore career options** button.

## Task 4: Check the application support boundary

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
