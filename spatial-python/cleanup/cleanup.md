# Clean-up placeholder

## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Option 1: Reset ADB to pre-workshop state


1. 

      ```
      <copy>
      cursor.execute("drop view v_transactions_labelled")
      cursor.execute("drop view v_st_cluster_centroids")
      cursor.execute("drop table transactions")
      cursor.execute("drop table locations")
      cursor.execute("drop table transaction_labels")
      cursor.execute("drop function lonlat_to_proj_geom")
      cursor.execute("delete from user_sdo_geom_metadata")
      </copy>
      ```

## Option 2: Terminate resources


1.  