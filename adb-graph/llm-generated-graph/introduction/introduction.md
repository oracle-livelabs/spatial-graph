# Introduction

## About this Workshop

This workshop shows how Generative AI can be used to create an informative property graph from unstructured data. It also shows how to use the graph for retrieval augmented generation. The first lab will go through the steps of using generative AI to create property graph staging data from a Sherlock Holmes story. In the second lab you will process the staging data and create a working property graph data structure. When you get to the third lab you will explore the graph in graph studio. Finally you will use the graph for retrieval augmented generation.

Estimated Workshop Time: -- 3 hours -- minutes (This estimate is for the entire workshop - it is the sum of the estimates provided for each of the labs included in the workshop.)

### About Graph Studio
Oracle Autonomous Database has features that enable it to function as a scalable graph database. They automate the creation of graph models and in-memory graphs from database tables. They include notebooks and developer APIs for executing graph queries using PGQL, a SQL-like graph query language, over 60 built-in graph algorithms using Java or Python APIs, and native graph visualization.

Watch the following two videos for more information on Graph Studio. The first is an introduction to property graphs and their use cases. The second is a tour of the Graph Studio interface.

[Simplify Graph Analytics with Autonomous Database](youtube:eCd-969hrak)   Simplify Graph Analytics with Autonomous Database   

[Autonomous Database: A tour of the Graph Studio interface](youtube:S6Q-IJcBkU0)   Autonomous Database: A tour of the Graph Studio interface

### Objectives

In this workshop you will:
* Vectorize text data for ingestion
* Use Generative AI to summarize text chunks for graph edge/vertice relationships 
* Transform responses from LLM into suitable format for creating Property Graph
* Create graph studio notebook
* Query and visualize the graph using PGQL notebook paragraphs
* Use graph information for retrieval augmented generation

### Prerequisites

* Oracle Cloud Account   
* Provisioned Autonomous Database-Serverless instance  
<!---
* A database user with the correct roles and privileges for working with **Graph Studio**. That is, successful completion of Lab 1 of the [Get Started with Graph Studio workshop](https://oracle-livelabs.github.io/adb/shared/adb-graph/workshops/freetier/index.html?lab=lab-1-create-graph-user)
--->


## Task 1: Create Autonomous Database

This task involves creating Autonomous Database 23ai.

1. Locate Autonomous Databases under Oracle Databases. Click on Create Autonomous Database.

    ![Create ADB](images/create_adb.png)

2. Provide information for Compartment, Display name, Database name. Also, choose workload type as APEX.
    
    ![Create ADB Name](images/)
    
3. Choose deployment type as Serverless, database version as 23ai and disable Compute auto scaling.

    ![Create ADB Deployment](images/create_adb_deployment_type.png)

4. Make sure Network Access is Secure access from everywhere, provide password, valid email ID and click on Create Autonomous Database.

    ![Create ADB Password](images/create_adb_password_network.png)

5. After deployment is complete, check to make sure your autonomous database is available on the autonomous databases page with the specified compartment selected.

    ![Create ADB Done](images/create_adb_complete.png)

This concludes this lab. **You may now proceed to the next lab.**

## Acknowledgements

* **Author**
    * **Jadd Jennings**, Principal Cloud Architect, NACIE

* **Contributors**
    * **Melliyal Annamalai**,  Distinguished Product Manager
    * **Eduard Cuba**,  Senior Member of Technical Staff
    * **Kaushik Kundu**, Master Principal Cloud Architect, NACIE


* **Last Updated By/Date**
    * **Jadd Jennings**, Principal Cloud Architect, NACIE, April 2025
