# Create adb


## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Task 1: ... 

1. Navigate to Oracle Database...
  ![Navigate to Oracle Database](images/adb-01.png)

2. Select root or other compartment, then click **Create Autonomous Database**...
  ![Select compartment](images/adb-02.png) 

3. For display name enter **my-adw** and for database name enter **myadw**. Leave workload type as Data Warehouse.
   ![Create ADW](images/adb-03.png) 

4. For database version select **19c**.
   ![Create ADW](images/adb-04.png) 

5. Enter and confirm a password for the database ADMIN user. In the next step you will need the IP address of your compute instance. Click on the restore link to expand Cloud Shell.
   ![Create ADW](images/adb-05.png) 

6. Copy the IP address from your SSH command. Then collapse the Cloud Shell.

 ![Create ADW](images/adb-06.png) 

7. For network access, select **Secure access from allowed IPs and VCNs only**. Under Values, paste your compute IP address. Then click **Create Autonomous Database**.
 ![Create ADW](images/adb-07.png) 

