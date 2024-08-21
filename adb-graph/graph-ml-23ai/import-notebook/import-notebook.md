<!--
    {
        "name":"Create Graph",
        "description":"Login to Graph Studio and create a moviestream graph for when running the tenancy the lab."
    }
-->

# Import Notebook

## Introduction

Notebooks enable you to execute code and to work interactively with long workflows. You can analyze and visualize graph results using a notebook. In this lab we will be importing the movie_recommendations notebook.

Estimated Time: 15 minutes.

### Objectives

Learn how to

- Log into Graph Studio
- Import a notebook

### Prerequisites

- The following lab requires an Autonomous Database Serverless instance.
- And that the Graph-enabled user exists. That is, a database user with the correct roles and privileges exists.

## Task 1: Log into Graph Studio

1. Click on **Oracle Database Actions**. This will take you to the main Database Action Page.

    ![Click on Oracle Database Actions](images/database-actions.png " ")

2. The Database Actions page opens. In the **Development** box, click **Graph Studio**.

    ![Click Graph Studio.](./images/dbactions-click-graph-studio.png " ")

    Login using the following credentials:
    
    **Username:** MOVIESTREAM
    **Password:** watchS0meMovies#

    ![Click Graph Studio.](./images/graph-studio-signin.png " ")

## Task 2: Import the notebook

 You can import a notebook that has the graph queries and analytics. Each paragraph in the notebook has an explanation.  You can review the explanation, and then run the query or analytics algorithm.

  [Click here to download the notebook](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/labfiles/Movie%20Recommendations%20-%20Personalized%20SALSA.dsnb) and save it to a folder on your local computer.  This notebook includes graph queries and analytics for the MOVIE_RECOMMENDATIONS graph.

 1. Click the **Notebook** icon. Import a notebook by clicking on the notebook icon on the left, and then clicking on the **Import** icon on the far right.

    ![Click the notebook icon and import the notebook.](images/task3step1.png " ")
    
     Select or drag and drop the notebook and click **Import**.

    ![Select the notebook to import and click on Import.](images/task3step2.png " ")

    A dialog pops up named **Environment Attaching**. It will disappear when the compute environment finishes attaching, usually in less than one minute. Or you can click **Dismiss** to close the dialog and start working on your environment. Note that you will not be able to run any paragraph until the environment finishes attaching.

## Acknowledgements
* **Author** - Ramu Murakami Gutierrez, Product Management
* **Contributors** -  Melliyal Annamalai, Rahul Tasker, Denise Myrick, Ramu Murkami Gutierrez Product Management
* **Last Updated By/Date** - Denise Myrick, Product Manager, July 2024
