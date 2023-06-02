
# Create the Graph User

## Introduction

In this lab you will create a database user with the appropriate roles and privileges required for using the graph capabilities of the Autonomous Database.

Estimated Time: 5 minutes.

Watch the video below for a quick walk through of the lab.

[Link to video of this workshop](youtube:CQh8Q24Rboc)

### Objectives

Learn how to
-  create a database user with the appropriate roles and privileges required for accessing **Graph Studio**


### Prerequisites

- The following lab requires an Autonomous Data Warehouse - Shared Infrastructure or Autonomous Transaction Processing - Shared Infrastructure account

## Task 1: Connect to the Database Actions for your Autonomous Database instance


1. Open the service detail page for your Autonomous Database instance in the OCI console.  

   Then click the **Database Actions** link to open it.

   ![Autonomous Database home page pointing to the Database Actions button](images/open-database-actions.png "Autonomous Database home page pointing to the Database Actions button")

## Task 2: Create the web access and graph-enabled user

1. Login as the ADMIN user for your Autonomous Database instance.

    ![Log in to your Autonomous Database instance](./images/login.png "Log in to your Autonomous Database instance")

2. Click  the **DATABASE USERS** tile under **Administration**.

   ![Click the Database Actions tile](./images/db-actions-users.png "Click the Database Actions tile")

3. Click the **+ Create User** icon.

    ![Click Create User](./images/db-actions-create-user.png "Click Create User ")

4. Enter the required details, i.e. user name and password. Turn on the **Graph Enable** and **Web Access** radio buttons. And select a quota, e.g. **UNLIMITED**,  to allocate on the `DATA` tablespace.   

   	Note: The password should meet the following requirements:

	- The password must be between 12 and 30 characters long and must include at least one uppercase letter, one lowercase letter, and one numeric character.
	- The password cannot contain the username.
	- The password cannot contain the double quote (“) character.
	- The password must be different from the last 4 passwords used for this user.
	- The password must not be the same password that is set less than 24 hours ago.

	![Set Graph username and password, and select Create User](images/db-actions-create-graph-user.png "Set Graph username and password, and select Create User ")

	**Note: Please do not Graph Enable the ADMIN user and do not login to Graph Studio as the ADMIN user. The ADMIN user has additional privileges by default. Create and use an account with only the necessary privileges for with with graph data and analytics.**

	Click the **Create User** button at the bottom of the panel to create the user with the specified credentials.

	The newly created user will now be listed.

	![The newly created user will be listed](./images/db-actions-user-created.png "The newly created user will be listed ")   

	**Note:** *The UI steps above can be instead done by executing the following sql commands listed below when logged in as ADMIN. So Step 5 below is not necessary. It shows an alternate way of creating and enabling GRAPHUSER.*

5. Allocate a desired table space quota to the newly created user. Open the SQL page and issue the alter command.

   For example,
   `ALTER USER GRAPHUSER QUOTA UNLIMITED ON DATA;`   
   will allocate a quota the user `GRAPHUSER` in the tablespace named `DATA`.  
   Copy and paste the following command into the SQL worksheet.  
   Substitute the correct values for  `<username>` and `<quota>` and then click on Run to execute it.

      ```
      <copy>
      -- Optional statement to use in place of the UI of the Administration page
      ALTER USER <username> QUOTA <quota> ON DATA;
      </copy>
      ```

      ```
      <copy>
      -- Optional statements to use in place of the UI of the Administration page
      GRANT GRAPH_DEVELOPER TO <username> ;
      ALTER USER <username> GRANT CONNECT THROUGH "GRAPH$PROXY_USER";
      </copy>
      ```

   The screenshots below show an example of executing the ALTER USER statement.

   ![Alter user quota to 10G](./images/alter-user.png "Alter user quota to 10G")  

   ![Run the alter user statement](./images/run-sql.png "Run the alter user statement")  

   ![The user will show as altered in the script output](./images/user-altered.png "The user will show as altered in the script output")

 6. You can similarly use SQL statements to verify that GRAPHUSER has been set up correctly.  

    You must be logged into Data Actions SQL as `ADMIN` then enter the following SQL statements and execute them.

    ```
    <copy>
    select * from dba_role_privs where grantee='GRAPHUSER';

    select * from dba_proxies where client='GRAPHUSER';
    </copy>
    ```
    The results should be the same as in the screenshots below.

    ![Grant roles and privs to the graph user](images/graphuser-role-privs.png "Grant roles and privs to the graph user")

    ![Grant proxy to the graph user](images/graphuser-proxy-grant.png "Grant proxy to the graph user")



Please **proceed to the next lab** to learn how to create and analyze graphs in ADB.

## Acknowledgements
* **Author** - Jayant Sharma, Product Management
* **Contributors** -  Korbi Schmid, Rahul Tasker
* **Last Updated By/Date** - Jayant Sharma, June 2023
