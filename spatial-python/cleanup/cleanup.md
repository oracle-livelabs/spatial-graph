# Clean-up

## Introduction

You may clean-up your workshop environment by resetting your Autonomous Database to pre-workshop state.

Estimated Lab Time: 2 minutes

### Objectives

* Reset Autonomous Database to pre-workshop state

### Prerequisites

* Active Autonomous Database instance


## Reset Autonomous Database to pre-workshop state

1. 

      ```
      <copy>
      cursor = connection.cursor()
      cursor.execute("drop table transactions")
      cursor.execute("drop table locations")
      cursor.execute("drop table transaction_labels")
      cursor.execute("drop function lonlat_to_proj_geom")
      cursor.execute("delete from user_sdo_geom_metadata")
      connection.commit()
      </copy>
      ```


