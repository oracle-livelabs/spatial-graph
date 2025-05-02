# Explore Graph Studio

## Introduction

This lab shows you how to create a property graph in Graph Studio using the data definition created in previous steps. After creating the graph, there will be steps to import a Graph Studio notebook and explore the paragraphs. Finally, you will convert the graph to SQL form to be used in the next lab.

Estimated Time: 30 minutes

 
### Objectives

 

In this lab, you will:
* Create a Property Graph in Graph Studio
* Import a Graph Studio notebook and explore paragraphs
* Convert Graph to SQL format

### Prerequisites (Optional)


This lab assumes you have:
* An Oracle Cloud account
* All previous labs successfully completed


## Task 1: Create property graph in graph studio 


1. Open Database Actions, click the hamburger icon and select Graph Studio from the Development menu.

   ![Open Graph Studio](images/open_graph_studio.png "Open Graph Studio")

   ![Graph Studio Console](images/graph_studio_console.png "Graph Studio Console")

 2. Navigate to the graphs pageview but dont click the Create Graph button, click the Query button, paste the PGQL below to create a PGQL Property Graph.

       Paste the PL/SQL:

      ```text
          <copy>
            CREATE PROPERTY GRAPH  pg_rag_pgql
            VERTEX TABLES (
              "GRAPH_ENTITIES"
                KEY ( "ID" )
                LABEL "ENTITY" PROPERTIES ( "ENTITY_NAME", "ENTITY_TYPE" )
            )
            EDGE TABLES (
              "GRAPH_RELATIONS"  KEY ( "ID" )
                SOURCE KEY ( "HEAD_ID" ) REFERENCES "GRAPH_ENTITIES"( "ID" )
                DESTINATION KEY ( "TAIL_ID") REFERENCES "GRAPH_ENTITIES" ( "ID" )
                LABEL "RELATION" PROPERTIES ( "CHUNK_ID", "RELATION", "TEXT" )
            )
            OPTIONS( PG_PGQL)
          </copy>
      ```
   ![Create Graph](images/create_graph.png "Create Graph")

   ![Run Create Graph Query](images/run_create_graph_query.png "Run Create Graph Query")


## Task 2: Import notebook

 1. Click on the link to download the required notebook.

   [graph_rag_live_lab.dsnb](https://objectstorage.us-chicago-1.oraclecloud.com/n/idb6enfdcxbl/b/Livelabs/o/property-graph-live-lab%2Fgraph_rag_live_lab.dsnb)

   ![Create Graph](images/create_graph.png "Create Graph")

 2. Navigate to the notebook pageview, click the import button and select the notebook downloaded in the previous step.

   ![Import Notebook](images/import_notebook.png "Import Notebook")


 3. Run all paragraphs using the run button and make sure show results is enabled.

   ![Run All Paragraphs](images/run_all_paragraphs.png "Run All Paragraphs")

 4. View the visualizations for each paragraph and note the relationships that have been generated.

   ![PGQL Query on Blue Carbuncle](images/graph_visual_blue_carbuncle.png "PGQL Query on Blue Carbuncle")

   ![PGQL Query on James Ryder](images/graph_visual_james_ryder.png "PGQL Query on James Ryder")

   ![PGQL Query on Hat](images/graph_visual_hat.png "PGQL Query on Hat")


## Task 3 Convert PGQL graph to SQL Graph

 1. Open the Graph page view.

![open graphs page view](images/open_graphs_page.png "open graphs page view")

 2. Click the menu button for the graph created in task 1 and select "Convert to SQL Graph".

![Convert to SQL Graph](images/convert_to_sql_graph.png "Convert to SQL Graph")

 3. Confirm the migration to SQL Graph.

![Convert to SQL Graph](images/confirm_sql_migration.png "Convert to SQL Graph")

 4. Verify existence of SQL version of property graph.

![Convert to SQL Graph](images/finish_sql_graph_migration.png "Convert to SQL Graph")

## Learn More

*(optional - include links to docs, white papers, blogs, etc)*

* [URL text 1](http://docs.oracle.com)
* [URL text 2](http://docs.oracle.com)

## Acknowledgements
* **Author**
    * **Jadd Jennings**, Principal Cloud Architect, NACIE

* **Contributors**
    * **Melliyal Annamalai**,  Distinguished Product Manager
    * **Eduard Cuba**,  Senior Member of Technical Staff


* **Last Updated By/Date**
    * **Jadd Jennings**, Principal Cloud Architect, NACIE, May 2025

