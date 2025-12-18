<!--
    {
        "name":"Create Graph",
        "description":"Login to Graph Studio and create a moviestream graph for when running the tenancy the lab."
    }
-->

# Hello World: Create, Analyze and Visualize a Graph from Scratch

## Introduction

In this lab you will explore Graph Studio and learn how you can create and analyze a graph from scratch very quickly using
Lakehouse or Autonomous Transaction Processing - Serverless (ATP) instance.

**Note: While this lab uses Lakehouse, the steps are identical for creating and connecting to an Autonomous Transaction Processing database.**

Estimated Time: 10 minutes.

### Objectives

Learn how to

- connect to your Autonomous AI Database using **Graph Studio**
- quickly create a very simply graph from scratch using PGQL
- load graphs into memory for analysis
- create a simple notebook
- write and execute basic Markdown, PGX Java and PGQL notebook paragraphs
- visualize graph data

### Prerequisites

- The following lab requires a Lakehouse or Autonomous Transaction Processing - Serverless account.

## Task 1: Log into Graph Studio

[](include:adb-goto-graph-studio.md)

## Task 2: Create a Simple Graph using PGQL

1. The following screenshot shows Graph Studio user interface with the menu, or navigation, icons on the left. They navigate to the Home, Models, Graphs, Notebooks, Templates, and Jobs pages respectively.

    ![Graph Studio home screen](./images/home-page.png "Graph Studio home screen ")

2. Click on the **Graphs** menu icon:

    ![Notebook menu screen in Graph Studio](./images/graphs-menu-blank.png "Notebook menu screen in Graph Studio ")

3. Next click the **`</> Query`** button on the page. You should see a page titled  **</> Query Playground**.

    ![Empty query playground](./images/query-playground-empty.png "Empty query playground ")

4. Copy and paste the following DDL code into the PGQL input text area:

    ```
    <copy>
    DROP PROPERTY GRAPH my_first_graph ;

    CREATE PROPERTY GRAPH my_first_graph ;

    INSERT INTO my_first_graph
        VERTEX austin LABELS (City) PROPERTIES (austin.name = 'Austin', austin.population = 964254),
        VERTEX tokyo LABELS (City) PROPERTIES (tokyo.name = 'Tokyo', tokyo.population = 9273672),
        VERTEX zurich LABELS (City) PROPERTIES (zurich.name = 'Zurich', zurich.population = 402762),
        VERTEX europe LABELS (Continent) PROPERTIES (europe.name = 'Europe'),
        VERTEX US LABELS (Country) PROPERTIES (US.name = 'United States of America'),
        VERTEX texas LABELS (State) PROPERTIES (texas.name = 'Texas', texas.area_size_km2 = 695662),
        VERTEX japan LABELS (Country) PROPERTIES (japan.name = 'Japan', japan.area_size_km2 = 377975),
        EDGE austinCapital BETWEEN austin AND texas LABELS (capital_of),
        EDGE austinCountry BETWEEN austin AND US LABELS (located_in),
        EDGE texasCountry BETWEEN texas AND US LABELS (located_in),
        EDGE zurichContinent BETWEEN zurich AND europe LABELS (located_in),
        EDGE tokyoCapital BETWEEN tokyo AND japan LABELS (capital_of),
        EDGE tokyoCountry BETWEEN tokyo AND japan LABELS (located_in),
        EDGE zurichTokyo BETWEEN zurich AND tokyo LABELS (connecting_flight) PROPERTIES (zurichTokyo.distance_km = 9576),
        EDGE zurichAustin BETWEEN zurich AND austin LABELS (connecting_flight) PROPERTIES (zurichAustin.distance_km = 8674)  

    </copy>
    ```

    This will create a very simple graph with 7 vertices and 8 edges. For more information about the syntax, please refer to the [PGQL specification](https://pgql-lang.org/spec/1.3/#inserting-vertices)

5. Click the **Run** button on the top left.

    ![Query playground create graph statement](./images/query-playground-create-graph-statement.png "Query playground create graph statement ")

## Task 3: Load the Graph into Memory

1. Navigate to the Graphs page:

    ![Graphs page](./images/graph-menu-my-first-graph.png "Graphs page ")

2. Click on `MY_FIRST_GRAPH`:

    ![Click graph to load it into memory in Graph Studio](./images/graph-first-graph-click-load-into-memory.png "Click graph to load it into memory in Graph Studio ")

3. Click on the **Load into memory** icon on the right of the details section:

    ![Click load into memory in Graph Studio](./images/graph-click-load-into-memory.png "Click load into memory in Graph Studio ")

    In the resulting dialog, click **Yes**.

    ![Load graph into memory dialog](./images/my-first-graph-load-into-memory.png "Load graph into memory dialog ")

4. You get redirected to the Jobs page. Wait for the job to complete.

    ![Load first graph into memory](./images/jobs-first-graph-load-into-memory.png "Load first graph into memory ")

## Task 4: Create your First Notebook

1. Navigate to the Notebooks page:

    ![Graph Studio notebooks menu](./images/notebooks-menu.png "Graph Studio notebooks menu ")

2. Click the **Create** button on the right.  

3. Name the notebook **Learn/My First Notebook**, then click **Create**. That will create a folder named `Learn` and the note `My First Notebook` within it.

    ![Create first notebook](./images/notebooks-create-first-notebook.png "Create first notebook ")

4. Each notebook is organized into a set of **paragraphs**. Each paragraph has an input (called *Code*) and an output (called **Result**). In Graph Studio, there are 7 types of paragraphs:

    ![Paragraph types in Graph Studio](./images/paragraph-types.png "Paragraph types in Graph Studio ")

  Enter the following text into the first paragraph.

```
<copy>
%md
# My First Notebook

This is my first paragraph
</copy>
```  

  The `%md` indicates that the paragraph input is Markdown code.

5. Execute the paragraph:

    ![Run the first paragraph in the Graph Studio notebook](./images/first-notebook-execute-md-para.png "Run the first paragraph in the Graph Studio notebook ")

    You will see the Markdown code rendered as HTML:

    ![Run the first paragraph in the Graph Studio notebook](./images/first-notebook-executed-first-md-para.png "Result in paragraph of the Graph Studio notebook ")

    Markdown paragraphs are useful to add explanations to your notebooks and order them into chapters. You can embed images and even videos using Markdown or HTML syntax, give it a try.

## Task 5: Analyze, Query and Visualize the Graph

1. Add another paragraph to the notebook by hovering at the middle of the bottom of the paragraph and clicking the **+** button which appears.

   ![Select the plus button to add a paragraph](./images/first-notebook-add-para.png "Select the plus button to add a paragraph")

2. Then enter the following code in the new paragraph.

    ```
    <copy>
    %java-pgx
    var graph = session.getGraph("MY_FIRST_GRAPH", GraphSource.PG_VIEW)
    </copy>
    ```

3. Execute that paragraph, you will see we successfully referenced our graph that we just created from scratch via the PGX Java APIs.

    ![Execute get graph statement](./images/first-notebook-pgx-get-graph.png "Execute get graph statement ")

**Note: Some users have encountered an issue when copying and pasting the `%md` and `%java-pgx` code above.** If you see an error message `"Invalid Parameter. No interpreter with the name 'java-pgx' is currently registered to the server."` then delete the text, or the paragraph, and manually enter the same text and re-execute the paragraph.
The following screenshot shows the error message some, but not all, have encountered.
    ![No interpreter found error](./images/no-interpreter-found-error.png "No interpreter found error ")

4. Modify the paragraph to run a graph algorithm. For example:

    ```
    <copy>
    %java-pgx
    var graph = session.getGraph("MY_FIRST_GRAPH")
    analyst.countTriangles(graph, true)
    </copy>
    ```

5. Execute the updated paragraph again. Upon completion it displays the result, i.e. the graph contains exactly one triangle.

    ![Count triangles in Graph](./images/first-notebook-pgx-count-triangles.png "Count triangles in Graph ")

6. Add a paragraph and enter the following code. This will be a PGQL paragraph since it starts with the line `%pgql-pgx`.

    ```
    <copy>
    %pgql-pgx
    select v, e from match (v)-[e]->() on MY_FIRST_GRAPH
    </copy>
    ```
    ![Run the first query](./images/first-notebook-pgql-execute-query.png "Run the first query")

7. Execute that paragraph and the results are rendered as an interactive graph.

    ![Visualize the result of the first query](./images/first-notebook-pgql-query-result.png "Visualize the result of the first query ")

8. Right click on one of the vertices on the screen to see all the details of that vertex.

    ![View the properties of a vertex](./images/first-notebook-pgql-view-properties.png "View the properties of a vertex")

9. Click on the settings icon of the visualization.

    ![Open the settings modal](./images/first-notebook-pgql-settings.png "Open the settings modal ")

10. Navigate to the **Visualization** tab and select **NAME** as the label to render next to the vertices:

    ![Select vertex label for visualization](./images/first-notebook-pgql-viz-label.png "Select vertex label for visualization ")

You now see the name next to each vertex, which will help you better understand the visualization. There are lots of other options to help you make sense of the graph. Feel free to play around with the settings as you like.

11. Add another paragraph with the following query and execute it.

    ```
    <copy>
    %pgql-pgx
    select c.NAME, c.POPULATION from match (c:City) on MY_FIRST_GRAPH order by c.POPULATION desc
    </copy>
    ```

    ![Visualize the next query](./images/first-notebook-population-query.png "Visualize the next query ")

12. Change the output to be a pie chart.

    ![Change visualization to display as pie chart](./images/first-notebook-population-as-pie-chart.png "Change visualization to display as pie chart ")

Congratulations! You successfully created, analyzed and visualized a graph from scratch using Graph Studio. Hopefully this little example gave you a feeling of how can use your Autonomous AI Database as a graph database.

Please **proceed to the next lab** to see more complex examples of how to create and analyze graphs.

## Acknowledgements

- **Author** - Jayant Sharma, Product Development
- **Contributors** -  Korbi Schmid, Rahul Tasker,  Ramu Murakami Gutierrez, Product Development
- **Last Updated By/Date** - Denise Myrick, December 2025
