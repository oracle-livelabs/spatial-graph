# Connect to ADB


## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Task 1: ... 

1. In JupyterLab, click on the Text File tile to create a new text file. 
  ![Navigate to Oracle Database](images/connect-to-adb-01.png)

2. Enter your ADB ADMIN user password. Then from the File menu select **Save Text**. When prompted enter **my-pwd.txt** as your file name.
  ![Navigate to Oracle Database](images/connect-to-adb-02.png)

3. When prompted enter **my-pwd.txt** as your file name.
  ![Navigate to Oracle Database](images/connect-to-adb-03.png)

4.  Close the text file tab to return to the Launcher.
   ![Navigate to Oracle Database](images/connect-to-adb-04.png)

5. Return to your Oracle Cloud browser tab and minimize Cloud Shell.
  ![Navigate to Oracle Database](images/connect-to-adb-05.png)

1. Click on **Database Connection**.
  ![Navigate to Oracle Database](images/connect-to-adb-06.png)

1. Scroll down to the Connection Strings section. For TLS Authentication, select **TLS**. Then Under Connection String click **Copy** for the TNS Name ending in \_low.
  ![Navigate to Oracle Database](images/connect-to-adb-07.png)

1. Return to your JupyterLab browser tab. As done previously, click on the Text File tile to create another new text file. Paste the connection string just copied from yor ADB. Then save the file as **my-dsn.txt**. Then close the text file tab to return to the Launcher.
  ![Navigate to Oracle Database](images/connect-to-adb-08.png)

1. From the Launcher, click the **Python 3** tile to create a new notebook.
  ![Navigate to Oracle Database](images/connect-to-adb-09.png)

1. In the first cell, paste the following statement and then click the **run** button. This loads the python-oracedb module which handles interaction with Oracle Database.

     ```
     <copy>
     import oracledb
     import csv
     </copy>
     ```
     ![Navigate to Oracle Database](images/connect-to-adb-10.png)

2. In the next cell, paste the following statements and then click the **run** button. This loads your ADB password and DSN into variables

     ```
     <copy>
     # Get ADB password and DSN from file
     my_pwd = open('./my-pwd.txt','r').readline().strip()
     my_dsn = open('./my-dsn.txt','r').readline().strip()
     </copy>
     ```
     ![Navigate to Oracle Database](images/connect-to-adb-11.png)

3. In the next cell, paste the following statements and then click the **run** button. This creates a connection to your ADB.

     ```
     <copy>
     # Create database connection and cursor
     connection = oracledb.connect(user="admin", password=my_pwd, dsn=my_dsn)
     cursor = connection.cursor()
     </copy>
     ```
     ![Navigate to Oracle Database](images/connect-to-adb-12.png)

3. In the next cell, paste the following statements and then click the **run** button. This runs a test query to verify successful connection to ADB.

     ```
     <copy>
     # Run a test query
     cursor.execute("select object_type, count(*) from all_objects group by object_type")
     for row in cursor.fetchmany(size=10):
     print(row)
     </copy>
     ```
     ![Navigate to Oracle Database](images/connect-to-adb-13.png)


4. Right-click on your notebook in the left panel and select **Rename**.

     ![Navigate to Oracle Database](images/connect-to-adb-14.png)


5. Enter **my-notebook** (or a name of your choosing). Observe the notebook name is changed.

     ![Navigate to Oracle Database](images/connect-to-adb-15.png)

You may now proceed to the next lab.

## Learn More
* 

## Acknowledgements
* **Author** - 
