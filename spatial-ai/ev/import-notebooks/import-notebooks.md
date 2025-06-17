# Import notebooks

## Introduction

The Oracle Machine Learning User Interface (OML UI) is the entry point for OML, with links to OML features and artifacts. A central feature of OML is OML Notebooks, an Apache Zeppelin-based web interface for machine learning workflows using any combination of Markdown, Python, SQL, and R. In this lab you log into the OML UI, create a simple notebook, and import a set of pre-built Python notebooks used for the remainder of this workshop.

[Make Better Predictions](videohub:1_4q5ul7ex)

Estimated Lab Time: 5 minutes

### Objectives

* Log into OML UI
* Get familiar with OML Notebooks
* Load pre-built notebooks

### Prerequisites

* Access to the OML UI

## Task 1: Log into OML UI

1. Click View Login Info to access your reservation information. 

   ![View login info](images/view-login-info.png)

2. Note the database user and password at the bottom. Then click the link for the OML UI. 

  ![Reservation info](images/reservation-information.png)

3. Sign into the OML UI using the database user and password in your reservation information.

  ![OML UI sign in](images/omluser-signin.png)

## Task 2: Work with OML Notebooks

1. From OML user interface home page, click the link for Notebooks. 

  ![OML UI sign in](images/oml-homepage.png)

2. Click the **Create** link to create a new notebook.

     ![Create notebook](images/create-notebook-a.png)

   When prompted, enter the name **Testing** and click OK.

      ![Create notebook](images/create-notebook-b.png)

3. Hover your mouse above or below the empty paragraph to display buttons for creating a new paragraph. Click on the markdown icon to add a markdown paragraph.

      ![Markdown paragraph](images/md-paragraph-a.png)

4. In the markdown paragraph, add a new line, enter the following command, and click the run icon.

```copy md
#### Hello World!
```

   ![Markdown paragraph](images/md-paragraph-b.png)    

5. Hover your mouse below the markdown paragraph to display buttons for creating a new paragraph. Click on the Python icon to add a Python paragraph.

      ![Python paragraph](images/py-paragraph-a.png)

6. In the Python paragraph, add a new line, enter the following commands, and then click the run icon. This loads the OML Python library and verifies connectivity to your database.

     ![Python paragraph](images/py-paragraph-b.png)

7. Hover your mouse below the Python paragraph to display buttons for creating a new paragraph. Click on the SQL icon to add a SQL paragraph.

      ![SQL paragraph](images/sql-paragraph-a.png)

8. In the SQL paragraph, add a new line, enter the following command, and then click the run icon. This verifies SQL access by running a query that counts the objects in your database schema.

       ![SQL paragraph](images/sql-paragraph-b.png)

1. You can clear all results and run all paragraphs using the erasure and play buttons in the top button bars.

       ![Clear/run all paragraph](images/clear-run-all-paragraphs.png)

2. To navigate back to the Notebooks page, Click the icon to open the main navigation panel and then click **Notebooks**.

       ![Navigate to Notebooks](images/nav-to-notebooks.png)

3. You can now delete the test notebook. Select the notebook with the checkbox and click **Delete**.

       ![Delete notebook](images/del-test-notebook-a.png)

  When prompted click OK.

       ![Delete notebook](images/del-test-notebook-b.png)


## Task 3: Import pre-built notebooks

1. Click [**here**](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles/oml-notebooks-2.zip) to download the file OML notebooks containing pre-built notebooks. Then unzip the file. 

       ![Download notebooks](images/download-notebooks.png)

1. Return to the OML Notebooks page and click **Import**
    
       ![Import notebooks](images/import-notebooks.png)

2. Select all the notebooks unzipped in step 1, and click Open or OK depending on your platform.
    
       ![Import notebooks](images/select-notebooks.png)

3. Verify all notebooks are imported. If truncated, you can see the full notebook name in a tooltip by hovering your mouse over the notebook name.
    
       ![Verify notebooks](images/verify-notebooks.png)

   OML notebooks allow selecting a service level. The pre-built notebooks for this workshop are configured to use the **Low** service level. You should leave this setting as-is. Do not switch to a different service level.
    
       ![Service level low](images/service-level-low.png)

   The pre-built notebooks begin with paragraphs that import required libraries. The following summarizes the libraries that will be used:

* [**oml**](https://docs.oracle.com/en/database/oracle/machine-learning/oml4py/2/mlapi/) is the core OML4Py library
* [**oraclesai**](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/saipy/) is the core OML4Py Spatial AI library
* [**numpy**](https://numpy.org/) provides array structures
* [**pandas**](https://pandas.pydata.org/) provides data structures and manipulation
* [**shapely**](https://pypi.org/project/shapely/) provides geometry data structure and manipulation
* [**geopandas**](https://geopandas.org) adds spatial data capabilities to pandas
* [**sklearn**](https://scikit-learn.org) provides machine learning  
* [**matplotlib**](https://matplotlib.org/) provides visualizations

## Learn More

* [Oracle Machine Learning Notebooks](https://docs.oracle.com/en/database/oracle/machine-learning/oml-notebooks/)

## Acknowledgements

* **Author** - David Lapp, Product Manager
* **Last Updated By/Date**  - Denise Myrick, June 2025
