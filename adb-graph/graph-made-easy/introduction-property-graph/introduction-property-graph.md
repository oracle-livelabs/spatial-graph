# Work with Graph Studio

## About This Workshop

This workshop introduces key graph data modeling and analytics concepts using the Graph Studio features in an Autonomous Database. It shows you how to use graph queries to find circular payments which may indicate fraudulent transactions, and graph analytics algorithms to identify accounts through which a lot of transactions flow. You will be querying data containing (artificial) accounts and transactions information. You will start by creating a graph, querying the graph, running an analytics algorithm, and visualizing the results. An optional section introduces semantic (RDF) graph concepts, commonly used for Knowledge Graphs, and shows you how to load data from a standard RDF graph format such as the n-triple format, and how to query it using SPARQL, the query language for RDF graphs.

Estimated Workshop Time: 75 minutes


<if type="odbw">If you would like to watch us do the workshop, click [here](https://youtu.be/Ymk9TE9Q2K4).</if>

### About Graph Studio
Oracle Autonomous Database has features that enable it to function as a scalable graph database. They automate the creation of graph models and in-memory graphs from database tables. They include notebooks and developer APIs for executing graph queries using PGQL, a SQL-like graph query language, over 60 built-in graph algorithms using Java or Python APIs, and native graph visualization.

Watch the following two videos for more information on Graph Studio. The first is an introduction to property graphs and their use cases. The second is a tour of the Graph Studio interface.

[Simplify Graph Analytics with Autonomous Database](youtube:eCd-969hrak)   Simplify Graph Analytics with Autonomous Database   

[Autonomous Database: A tour of the Graph Studio interface](youtube:S6Q-IJcBkU0)   Autonomous Database: A tour of the Graph Studio interface

### Objectives

In this workshop you will:
* Create a graph using PGQL's (a graph query language) CREATE PROPERTY GRAPH statement
* Load the graph into memory for analysis
* Create a notebook
* Query and visualize the graph using PGQL notebook paragraphs
* Execute graph algorithms and visualize the results

### Prerequisites

* Oracle Cloud Account   
* Provisioned Autonomous Database-Serverless instance  
<!---
* A database user with the correct roles and privileges for working with **Graph Studio**. That is, successful completion of Lab 1 of the [Get Started with Graph Studio workshop](https://oracle-livelabs.github.io/adb/shared/adb-graph/workshops/freetier/index.html?lab=lab-1-create-graph-user)
--->

This concludes this lab. **You may now proceed to the next lab.**

## Acknowledgements
* **Author** - Jayant Sharma, Product Management
* **Contributors** -  Jayant Sharma, Product Management
* **Last Updated By/Date** - Ramu Murakami Gutierrez, Product Manager, August 2023
