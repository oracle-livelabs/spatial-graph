# Create an RDF graph in Graph Studio

## Introduction
Graph Studio in Oracle Autonomous Database enables users to model, create, query, and analyze graph data. It includes notebooks, developer APIs for executing graph queries using PGQL, 60+ built-in graph algorithms, and offers dozens of visualizations including native graph visualization.
In addition to property graph, Graph Studio now extends support for semantic technologies, including storage, inference, and query capabilities for data and ontologies based on Resource Description Framework (RDF) and Web Ontology Language (OWL).
You can now use Graph Studio for the following supported RDF features:
- Create an RDF graph
- Execute SPARQL queries on the RDF graph in a notebook paragraph
- Analyze and visualize RDF graphs

Estimated Time: 5 minutes

Watch the video below for a quick walk-through of the lab.
[Create an RDF graph in Graph Studio](videohub:1_hyi4jq4z)

### Objectives
- Create RDF Graph in Graph Studio
- Validate the RDF Graph
- Execute SPARQL Queries on the Playground Page

### Prerequisites
- The following lab requires an Autonomous Database - Shared Infrastructure account.
- And that the Graph-enabled user (GRAPHUSER) exists. That is, a database user with the correct roles and privileges exists.

## Task 1: Create RDF graph in Graph Studio

Assuming that you have completed the previous labs and are currently logged in, execute the following steps:

1. Click on **Graphs** on the navigation menu from the left to navigate the Graphs page.

  ![The landing page after creating the environment is the jobs menu](./images/graph-studio-home.png "")

2. In the Graph Type dropdown menu select **RDF** and then click the **Create** button on the top-right corner of the interface.

  ![The Graph Studio page graph type dropdown menu displays PG and RDF graph options](./images/graph-studio-graphs.png "")

3. Select **RDF graph** and then click the **Confirm** button.

  ![confirm button to select rdf graph option](./images/click-confirm-rdf.png "")

4. Create RDF Graph Wizard opens as shown:

  ![The 'create RDF graph' page.](./images/create-rdf-graph.png "")

5. Enter the OCI Object Storage URI path:

    ```
      <copy>https://objectstorage.us-ashburn-1.oraclecloud.com/p/VEKec7t0mGwBkJX92Jn0nMptuXIlEpJ5XJA-A6C9PymRgY2LhKbjWqHeB5rVBbaV/n/c4u04/b/livelabsfiles/o/data-management-library-files/moviestream_rdf.nt
    ```

6. Click **No Credential**.

7. Click **Next**.
    The following dialog should appear, enter "MOVIESTREAM" for Graph Name:

  ![The 'create RDF graph' second page](./images/create-rdf-graph-2.png "")

8. Click **Create**.

    The RDF graph creation job will be initiated. Since the RDF file contains 139461 records, the process may take 3 to 4 minutes. You can monitor the job on the **Jobs** page in Graph Studio.

  ![The 'jobs' page of Graph Studio displays a job 'Create a RDF Graph - MOVIESTREAM' still in progress](./images/graph-studio-jobs.png "")

    When succeeded, the status will change from pending to succeeded and Logs can be viewed by clicking on the three dots on the right side of the job row and selecting **See Log**. The log for the job displays details as shown below:

    ```
    Tue, Mar 1, 2022 08:21:04 AM
    Finished execution of task Graph Creation - MOVIESTREAM.

    Tue, Mar 1, 2022 08:21:04 AM
    Graph MOVIESTREAM created successfully

    Tue, Mar 1, 2022 08:21:04 AM
    Optimizer Statistics Gathered successfully

    Tue, Mar 1, 2022 08:20:50 AM
    External table <graph-user>_TAB_EXTERNAL dropped successfully

    Tue, Mar 1, 2022 08:20:49 AM
    Data successfully bulk loaded from ORACLE_ORARDF_STGTAB

    Tue, Mar 1, 2022 08:20:39 AM
    Model MOVIESTREAM created successfully

    Tue, Mar 1, 2022 08:20:37 AM
    Network RDF_NETWORK created successfully

    Tue, Mar 1, 2022 08:20:24 AM
    Data loaded into the staging table ORACLE_ORARDF_STGTAB from <graph-user>_TAB_EXTERNAL

    Tue, Mar 1, 2022 08:20:19 AM
    External table <graph-user>_TAB_EXTERNAL created successfully

    Tue, Mar 1, 2022 08:20:19 AM
    Using the Credential MOVIES_CREDENTIALS

    Tue, Mar 1, 2022 08:20:19 AM
    Started execution of task Graph Creation - MOVIESTREAM.
    ```

## Task 2: Validate the RDF graph

You can explore and validate the newly created RDF graph on the **Graphs** page in Graph Studio as shown:

1. Navigate to the **Graphs** page and set the **Graph Type** to RDF using the dropdown menu. Select the MOVIESTREAM graph row from the available RDF graphs, sample statements (triples or quads should appear), use the three horizontal dots to resize these statements, and bring them into view. Sample statements (triples or quads) from the RDF Graph are displayed on the bottom panel as shown:

  ![Sample statements from the RDF graph 'MOVIESTREAM' are displayed in triplets](./images/graph-sample-statements.png "")

2. After selecting the MOVIESTREAM Graph, scroll to the bottom of the page and verify that you see 500 rows of RDF triples have been retrieved.

  ![Sample statements from the MOVIESTREAM RDF graph](./images/sample-statements.png "")

## Task 3: Execute SPARQL queries on the playground page

You can execute SPARQL Queries on the RDF Graph from the **Query Playground** page.

1. On the **Graphs** page select the **RDF** from the Graph Type dropdown menu and click the **Query** button to navigate to the Query Playground page.

  ![Graphs page with RDF graph type selected and the query button highlighted](./images/graph-type.png "")

2. If you have multiple graphs in graph studio, you will have to choose the graph to query. In the Graph Name menu, select the MOVIESTREAM from the dropdown menu.

  ![Query playground displays the graph name 'MOVIESTREAM' selected from the dropdown menu](./images/query-playground.png "")

3. Execute the following query for the RDF Graph.

    ```
    <copy>PREFIX rdf: &lthttp://www.w3.org/1999/02/22-rdf-syntax-ns#&gt
    PREFIX rdfs: &lthttp://www.w3.org/2000/01/rdf-schema#&gt
    PREFIX xsd: &lthttp://www.w3.org/2001/XMLSchema#&gt
    PREFIX ms: &lthttp://www.example.com/moviestream/&gt

    SELECT DISTINCT ?gname
    WHERE {
      ?movie ms:actor/ms:name "Keanu Reeves" ;
      ms:genre/ms:genreName ?gname .
    }
    ORDER BY ASC(?gname)<copy>
    ```

      When the query is executed successfully the query output will be displayed as shown:

  ![Query playground displays the successful execution of a query on the MOVIESTREAM RDF graph and displays query results](./images/query-playground-script.png "")

This concludes this lab. **You may now proceed to the next lab.**

## Acknowledgements

- **Author** -  Malia German, Ethan Shmargad, Matthew McDaniel Solution Engineers, Ramu Murakami Gutierrez Product Manager
- **Technical Contributor** -  Melliyal Annamalai Distinguished Product Manager, Joao Paiva Consulting Member of Technical Staff, Lavanya Jayapalan Principal User Assistance Developer
- **Last Updated By/Date** - Ramu Murakami Gutierrez, Product Manager, June 2022
