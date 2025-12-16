<!--
    {
        "name":"Create Graph",
        "description":"Login to Graph Studio and create a moviestream graph for when running the tenancy the lab."
    }
-->

# Create a Graph

## Introduction

In this lab you will create a graph from the `MOVIE, CUSTOMER\_SAMPLE`, and `WATCHED` tables using the Graph Studio guided user experience.

Estimated Time: 15 minutes.

### Objectives

Learn how to

- Use Graph Studio to create a graph from existing tables or views.

### Prerequisites

- The following lab requires an Autonomous AI Database Serverless instance.
- And that the Graph-enabled user exists. That is, a database user with the correct roles and privileges exists.

## Task 1: Access the Autonomous AI Database

1. Click the **Navigation Menu** in the upper left, navigate to **Oracle AI Database**, and select **Autonomous AI Database**.

    ![Navigating to Autonomous AI Database.](images/navigation-menu.png " ")

2. Select the compartment provided on **View Login Info**, and click on the **Display Name** for the **Autonomous AI Database**.

    ![Selecting Autonomous AI Database in the Navigation Menu.](images/select-autonomous-database.png " ")

## Task 2: Log into Graph Studio

[](include:adb-goto-graph-studio.md)

## Task 3: Create a Movie Recommendations graph

[](include:adb-create-graph.md)

## Acknowledgements

- **Author** - Melli Annamalai, Product Manager, Oracle Spatial and Graph
- **Contributors** -  Jayant Sharma, Ramu Murakami Gutierrez
- **Last Updated By/Date** - Denise Myrick, Product Manager, Oracle Spatial and Graph, December 2025
