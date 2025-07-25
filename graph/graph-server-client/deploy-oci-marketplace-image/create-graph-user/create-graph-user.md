# Create and Enable a Database User in Database Actions

## Introduction

This lab walks you through the steps to get started with Database Actions. You will learn how to create a user in Database Actions and provide that user the access to Database Actions.

Estimated time: 3 minutes

### Objectives

- Learn how to setup the required database roles in Database Actions.
- Learn how to create a database user in Database Actions.

### Prerequisites

- Oracle Cloud account
- Provisioned Autonomous Database

## Task 1: Login to Database Actions

[](include:adb-connect-with-sql-worksheet-body.md)

## Task 2: Create database roles

1. Now create the roles required for the graph feature. Enter the following commands into the SQL Worksheet and click "Run Script" while connected as the Admin user.

    ```sql
    <copy>
    DECLARE
      PRAGMA AUTONOMOUS_TRANSACTION;
      role_exists EXCEPTION;
      PRAGMA EXCEPTION_INIT(role_exists, -01921);
      TYPE graph_roles_table IS TABLE OF VARCHAR2(50);
      graph_roles graph_roles_table;
    BEGIN
      graph_roles := graph_roles_table(
        'GRAPH_DEVELOPER',
        'GRAPH_ADMINISTRATOR',
        'PGX_SESSION_CREATE',
        'PGX_SERVER_GET_INFO',
        'PGX_SERVER_MANAGE',
        'PGX_SESSION_READ_MODEL',
        'PGX_SESSION_MODIFY_MODEL',
        'PGX_SESSION_NEW_GRAPH',
        'PGX_SESSION_GET_PUBLISHED_GRAPH',
        'PGX_SESSION_COMPILE_ALGORITHM',
        'PGX_SESSION_ADD_PUBLISHED_GRAPH');
      FOR elem IN 1 .. graph_roles.count LOOP
      BEGIN
        dbms_output.put_line('create_graph_roles: ' || elem || ': CREATE ROLE ' || graph_roles(elem));
        EXECUTE IMMEDIATE 'CREATE ROLE ' || graph_roles(elem);
      EXCEPTION
        WHEN role_exists THEN
          dbms_output.put_line('create_graph_roles: role already exists. continue');
        WHEN OTHERS THEN
          RAISE;
        END;
      END LOOP;
    EXCEPTION
      when others then
        dbms_output.put_line('create_graph_roles: hit error ');
        raise;
    END;
    /
    </copy>
    ```

2. Assign default permissions to the roles, **`GRAPH_ADMINISTRATOR`** and **`GRAPH_DEVELOPER`**, to group multiple permissions together. Copy and paste the following commands into the SQL Workshop and run them as script.

    ```sql
    <copy>
    GRANT PGX_SESSION_CREATE TO GRAPH_ADMINISTRATOR;
    GRANT PGX_SERVER_GET_INFO TO GRAPH_ADMINISTRATOR;
    GRANT PGX_SERVER_MANAGE TO GRAPH_ADMINISTRATOR;
    GRANT PGX_SESSION_CREATE TO GRAPH_DEVELOPER;
    GRANT PGX_SESSION_NEW_GRAPH TO GRAPH_DEVELOPER;
    GRANT PGX_SESSION_GET_PUBLISHED_GRAPH TO GRAPH_DEVELOPER;
    GRANT PGX_SESSION_MODIFY_MODEL TO GRAPH_DEVELOPER;
    GRANT PGX_SESSION_READ_MODEL TO GRAPH_DEVELOPER;
    </copy>
    ```

## Task 3: Create a database user

Now create the **CUSTOMER_360** user and provide Database Actions access for this user.

[](include:adb-create-user.md)

## Task 4: Grant graph roles

1. Go to the **Granted Roles** tab and make sure to grant the roles **`GRAPH_DEVELOPER`** and **`PGX_SESSION_ADD_PUBLISHED_GRAPH`** to the user. (Two roles **CONNECT** and **RESOURCE** are selected by default. Please keep them checked so they will be also granted.)

    ![user-3](images/user-3.png)

2. Proceed with **Create User**, and open the Login window.

    ![user-4](images/user-4.png)

3. Confirm that you can login with the new user.

    ![user-5](images/user-5.png)

For details, see the ["Create Users on Autonomous Database with Database Actions"](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/manage-users-create.html#GUID-DD0D847B-0283-47F5-9EF3-D8252084F0C1) section in the documentation.

You may now proceed to the next lab.

## Acknowledgements

- **Author** - Jayant Sharma, Product Manager, Spatial and Graph
- **Contributors** - Arabella Yao, Jenny Tsai, Ryota, Yamanaka, Karin Patenge
- **Last Updated By/Date** - Ramu Murakami Gutierrez, Spatial and Graph Product Manager, June 2025
