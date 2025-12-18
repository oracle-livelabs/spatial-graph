# Connect to  Autonomous AI Database from Python

## Introduction

To prepare for data loading and analysis, you first establish a connection from Python to your Autonomous AI Database. The python-oracledb driver supports this connection and all subsequent database interactions. You will use the python-oracledb driver's ‘Thin’ mode which connects directly to Oracle AI Database and does not need Oracle Client libraries.

Estimated Lab Time: 5 minutes

### Objectives

* Connect to Autonomous AI Database from Python

### Prerequisites

* Completion of Lab 2: Create Autonomous AI Database

## Task 1: Create connection parameter files

1. To avoid including database connection information directly in your notebook, you create files with this information which your notebook can reference. In JupyterLab, click on the Text File tile to create a new text file.
  ![Connect to ADB](images/connect-to-adb-01.png)

2. Enter your ADB ADMIN user password. Then from the File menu select **Save Text**.
  ![Connect to ADB](images/connect-to-adb-02.png)

3. When prompted enter **my-pwd.txt** as your file name and click **Rename**.
  ![Connect to ADB](images/connect-to-adb-03.png)

4. Close the text file tab to return to the Launcher page.
   ![Connect to ADB](images/connect-to-adb-04.png)

5. Return to your Oracle Cloud browser tab and click on **Database Connection**.
  ![Connect to ADB](images/connect-to-adb-06-v3a.png)

6. Scroll down to the Connection Strings section. For TLS Authentication, select **TLS**. This is required to allow Thin mode connections. Then Under Connection String click the ellipsis and then click **Copy** for the TNS Name ending in \_low.
  ![Connect to ADB](images/connect-to-adb-07a.png)

7. Return to your JupyterLab browser tab. As done previously, click on the Text File tile to create another new text file. Paste the connection string just copied from your Autonomous Database. Then save the file and rename to **my-dsn.txt**.
  ![Connect to ADB](images/connect-to-adb-08.png)

  As done previously, close the text file tab to return to the Launcher page.

## Task 2: Create notebook and connect to Autonomous Database

1. From the Launcher, click the **Python 3** tile to create a new notebook.
  ![Connect to ADB](images/connect-to-adb-09.png)

2. In the first cell, paste the following statement and then click the **run** button. This loads the python-oracledb module which handles interaction with Oracle Database.

     ```
     <copy>
     import oracledb
     </copy>
     ```
     ![Connect to ADB](images/connect-to-adb-10.png)

3. In the next cell, paste the following statements and then click the **run** button. This loads your ADB password and DSN into variables

     ```
     <copy>
     # Get ADB password and DSN from file
     my_pwd = open('./my-pwd.txt','r').readline().strip()
     my_dsn = open('./my-dsn.txt','r').readline().strip()
     </copy>
     ```
     ![Connect to ADB](images/connect-to-adb-11.png)

4. In the next cell, paste the following statements and then click the **run** button. This creates a connection to your ADB.

     ```
     <copy>
     # Create database connection and cursor
     connection = oracledb.connect(user="admin", password=my_pwd, dsn=my_dsn)
     cursor = connection.cursor()
     </copy>
     ```
     ![Connect to ADB](images/connect-to-adb-12.png)

5. In the next cell, paste the following statements and then click the **run** button. This runs a test query to verify successful connection to ADB.

     ```
     <copy>
     # Run a test query
     cursor.execute("select object_type, count(*) from all_objects group by object_type")
     for row in cursor.fetchmany(size=10):
       print(row)
     </copy>
     ```
     ![Connect to ADB](images/connect-to-adb-13.png)

6. Right-click on your notebook file Untitled.ipynb in the left panel and select **Rename**.

     ![Connect to ADB](images/connect-to-adb-14.png)

7. Enter **my-notebook** (or a name of your choosing). Observe the notebook name is changed.

     ![Connect to ADB](images/connect-to-adb-15.png)

You may now **proceed to the next lab**.

## Learn More

* For more info on python-oracledb connections to Autonomous AI Database, please see the [documentation](https://python-oracledb.readthedocs.io/en/latest/user_guide/connection_handling.html#connecting-to-oracle-cloud-autonomous-databases).

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Contributors** - Rahul Tasker, Denise Myrick, Ramu Gutierrez
* **Last Updated By/Date** - Denise Myrick, December 2025
