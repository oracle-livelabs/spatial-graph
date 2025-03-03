# Create and Validate an RDF Graph User in Graph Studio

## Introduction
In this lab, we will create and validate an RDF Graph User in Graph Studio.

Estimated Time: 10 minutes

### Objectives
- Create a Graph User to Access RDF in Graph Studio
- Enable RDF for the Graph User
- Create RDF Graph in Graph Studio
- Validate the RDF Graph
- Execute SPARQL Queries on the Playground Page

### Prerequisites
This lab assumes you have:
  - An Oracle Free Tier or Paid Cloud Account
  - You have completed:
      - Lab 1: Provision an ADB Instance

## Task 1: Create a graph user 
[](include:adb-create-user.md)

## Task 2: Access Graph Studio
[](include:adb-goto-graph-studio.md)

## Task 3: Create RDF Graph

1. Click on Graphs on the navigation menu from the left to navigate the Graphs page.

  ![The 'get started' page for Graph Studio. On the left-hand navigation bar, the button for 'Graphs' is highlighted](./images/graph-studio-home.png "")

2. Select **RDF GRAPH** as the graph type, and click on **Create Graph**.

  ![The Graph Studio page graph type dropdown menu displays PG and RDF graph options](./images/graph-studio-graphs.png "")

  Then, in the pop-up window select **RDF Graph**, and click **Confirm**. 

  ![Pop up windows asking to select rdf graph or collections](./images/select-rdf-graph.png "")

3. Create RDF Graph Wizard opens as shown:

  ![The 'create RDF graph' page.](./images/create-rdf-graph.png "")

4. Enter the OCI Object Storage URI path:

    ```
      <copy>https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/data-management-library-files/moviestream_rdf.nt
    ```

5. Click **No Credential**.

6. Click **Next**.
    The follow dialog should appear, enter "MOVIESTREAM" for Graph Name:

  ![The 'create RDF graph' second page](./images/create-rdf-graph-2.png "")

7. Click **Create**.

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

## Task 3: Validate the RDF graph

You can explore and validate the newly created RDF graph on the **Graphs** page in Graph Studio as shown:

1. Navigate to the **Graphs** page and set the **Graph Type** to RDF using the dropdown menu. Select the MOVIESTREAM graph row from the available RDF graphs, sample statements (triples or quads should appear), use the three horizontal dots to resize these statements, and bring them into view. Sample statements (triples or quads) from the RDF Graph are displayed on the bottom panel as shown:

  ![Sample statements from the RDF graph 'MOVIESTREAM' are displayed in triplets](./images/graph-sample-statements.png "")

## Task 4: Execute SPARQL queries on the playground page

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

This concludes this lab. *You may now proceed to the next lab.*

## Acknowledgements

- **Author** -  Malia German, Ethan Shmargad, Matthew McDaniel Solution Engineers, Ramu Murakami Gutierrez Product Manager
- **Technical Contributor** -  Melliyal Annamalai Distinguished Product Manager, Joao Paiva Consulting Member of Technical Staff, Lavanya Jayapalan Principal User Assistance Developer
- **Last Updated By/Date** - Ramu Murakami Gutierrez Product Manager, June 2023
