# Clean-up

## Introduction

You may clean-up your workshop environment by resetting your Autonomous AI Database to pre-workshop state.

Estimated Lab Time: 2 minutes

### Objectives

* Reset Autonomous AI Database to pre-workshop state

### Prerequisites

* Active Autonomous AI Database instance

## Task 1: Reset Autonomous AI Database to pre-workshop state

1. Run the following to remove all database artifacts created in this workshop.

      ```
      <copy>
      import oracledb
      my_pwd = open('./my-pwd.txt','r').readline().strip()
      my_dsn = open('./my-dsn.txt','r').readline().strip()
      connection = oracledb.connect(user="admin", password=my_pwd, dsn=my_dsn)
      cursor = connection.cursor()
      cursor.execute("drop table transactions")
      cursor.execute("drop table locations")
      cursor.execute("drop table transaction_labels")
      cursor.execute("drop function lonlat_to_proj_geom")
      cursor.execute("delete from user_sdo_geom_metadata")
      connection.commit()
      </copy>
      ```

## Acknowledgements

* **Author** - David Lapp, Database Product Management, Oracle
* **Last Updated By/Date** - Denise Myrick, December 2025
