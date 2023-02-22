# Use Graph Analytics to Recommend Movies

## Introduction

#### Video Preview

<!--[](youtube:6ik6ahjmYQQ)-->

In this lab, you will use Graph Studio to detect and create customer communities based on movie viewing behavior. Once you've created communities - make recommendations based on what your community members have watched.

Estimated Time: 10 minutes

<!--Watch the video below for a quick walk-through of the lab.
[Use graph analytics to recommend movies](videohub:1_ret5ywcn) Create a new video of delete this-->

### About graph
When you model your data as a graph, you can run graph algorithms to analyze connections and relationships in your data. You can also use graph queries to find patterns in your data, such as cycles, paths between vertices, anomalous patterns, and others. Graph algorithms are invoked using a Java or Python API, and graph queries are run using PGQL (Property Graph Query Language, see [pgql-lang.org](https://pgql-lang.org)).

In this lab you will use a graph created from the tables MOVIE, CUSTOMER\_PROMOTIONS, and CUSTSALES\_PROMOTIONS. MOVIE and CUSTOMER\_PROMOTIONS are vertex tables (every row in these tables becomes a vertex). CUSTSALES\_PROMOTIONS connects the two tables, and is the edge table. Every time a customer in CUSTOMER\_PROMOTIONS rents a movie in the table MOVIE, that is an edge in the graph. This graph has been created for you for use in this lab.  

You have the choice of over 60 pre-built algorithms when analyzing a graph. In this lab you will use the **Personalized SALSA** algorithm, which is a good choice for product recommendations. Customer vertices map to *hubs* and movies map to *authorities*. Higher hub scores indicate a closer relationship between customers. Higher authority scores indicate that the vertex (or movie) is plays a more important role in establishing that closeness.

### Objectives

In this lab, you will use the Graph Studio feature of Autonomous Database to:
* Use a notebook
* Run a few PGQL graph queries
* Use python to run Personalized SALSA from the algorithm library
* Query and save the recommendations

### Prerequisites

- Oracle Cloud Account

## Acknowledgements
* **Author** - Melli Annamalai, Product Manager, Oracle Spatial and Graph
* **Contributors** -  Jayant Sharma
* **Last Updated By/Date** - Ramu Murakami Gutierrez, Product Manager, Oracle Spatial and Graph, February 2023
