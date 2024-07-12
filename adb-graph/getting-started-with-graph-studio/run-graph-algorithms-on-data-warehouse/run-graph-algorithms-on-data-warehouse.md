
# Analyze a Typical Data Warehouse 
<!---with Graph Algorithms in a Notebook--->

## Introduction

In this lab you will learn how to run graph algorithms and PGQL queries using notebooks directly in the Graph Studio interface of your
Autonomous Data Warehouse - Shared Infrastructure (ADW) or Autonomous Transaction Processing - Shared Infrastructure (ATP) instance.

Estimated Time: 20 minutes.

### Objectives

- Learn how to prepare graph data to be analyzed in notebooks
- Learn how to create and run explanatory paragraphs using Markdown syntax
- Learn how to create and run graph query paragraphs using PGQL
- Learn how to visualize graph query results
- Learn how to create and run graph algorithm paragraphs using the PGX Java APIs

### Prerequisites

- The following lab requires an Autonomous Database account.

- This lab assumes you have completed the previous lab (Lab 3) where we created the **SH\_PGVIEW\_GRAPH** graph.

## Task 1: Make sure the SH Graph is Loaded into Memory.

Before graphs can be analyzed in a notebook, we need to make sure the graph is loaded into memory. In the Graph Studio user interface, navigate to the **Graphs** page, verify whether the **SH\_PGVIEW\_GRAPH** graph is loaded into memory or not. You can also verify if the internal compute environment is attached or detached by the indicator in the upper right-hand corner.

![SH Graph is in memory](./images/graphs-sh-is-in-memory-v2.png "SH Graph is in memory ")

If the graph is loaded into memory (it says "![ALT text is not available for this image](./images/graphs-fa-bolt.png) in memory"), then you can proceed to STEP 2.

If the graph is **not** loaded into memory, as in the following screenshot,  click the **Load into memory** (lightning bolt) icon on the top right of the details section. In the resulting dialog, click **Confirm**.

![SH graph details](./images/graphs-sh-graph-details-v2.png "SH graph details ")

This will create a "Load into Memory" job for you. Wait for this job to finish:

![Loading SH into memory](./images/jobs-sh-load-into-memory-started.png "Loading SH into memory ")

## Task 2: Clone the Sales History Analysis Example Notebook

1. Click on the **Notebooks** icon in the menu on the left.

2. Open the **Use Cases** folder:

    ![Find Sales Analysis in the list of notebooks](./images/notebooks-list-sales-analysis.png "Find Sales Analysis in the list of notebooks ")

3. Click on the **Graph Queries on the SH sample data** notebook to open it.

    ![Open Sales Analysis from the list of notebooks](./images/notebooks-open-sales-analysis.png "Open Sales Analysis from the list of notebooks ")

4. The **Graph Queries on the SH sample data** notebook is a **built-in** notebook. You can identify **built-in** notebooks by the author being shown as `<<system-user>>`. Built-in notebooks are shared between all users and therefore read-only and locked.
   To execute the notebook, we need to create a private copy first and then unlock it. On the top of the notebook, click the **Clone** button.

    ![Select the clone button](./images/notebooks-clone-button-v2.png "Select the clone button ")

5. In the resulting dialog, give the cloned notebook a unique name so you can find it later again easily. Folder structures can be expressed by using the `/` symbol. Then click *Create*.

    ![Clone the Sales Analysis notebook](./images/notebooks-clone-sales-analysis.png "Clone the Sales Analysis notebook ")

6. The cloned notebook will open automatically. Click the **Disable Read-only** button on the top right of the cloned notebook.

    ![Unlock the notebook to make it writable](./images/notebooks-unlocked-for-write.png "Unlock the notebook to make it writable ")

    The notebook is now ready to execute.


## Task 3: Explore the Basic Notebook Features

Each notebook is organized into a set of **paragraphs**. Each paragraph has an input (called **Code**) and an output (called **Result**). In Graph Studio, there are 3 types of paragraphs:

To add a paragraph, hover over the top or the bottom of an existing paragraph.

![Hovering over paragraph](./images/paragraph-hover.png)

There are 9 different interpreters. Each option creates a paragraph with a sample syntax that can be customized.

![Shows the different paragraphs and samples](./images/paragraphs.png)

The notebook is designed to work with the graph created in the previous lab, so you do not have to modify any code to make the paragraphs execute. You may notice that there are some hidden paragraphs at the start of this notebook. These hidden paragraphs run through the SQL code that we ran through earlier in this lab. For this lab, only focus on the visible paragraphs.

1. We will start running paragraphs from the paragraphs titled **Query and Analyze the graph**. To execute the first paragraph, click the **Run** icon on the top right of the paragraph.

    ![First Markdown paragraph](./images/notebooks-first-md-para.png "First Markdown paragraph ")

2. The second paragraph illustrates how to reference graphs loaded into memory in `%java-pgx` paragraphs. You simply reference them by using the `session.getGraph("SH")` API.  
   Click the **Run** icon to execute it. This must be run in order for the rest of the notebook to work.

    ![Run the java-pgx paragraph to load the graph into memory](./images/notebooks-get-sh-graph.png "Run the java-pgx paragraph to load the graph into memory ")

3. The next three paragraphs illustrate how to query for the list of vertex and edge labels.

    ![Get vertex and edge labels from the next three paragraphs](./images/notebooks-get-vertex-edge-labels.png "Get vertex and edge labels from the next three paragraphs ")

4. The next paragraph shows the edges connecting SALES to the other vertices.

    ![This paragraph shows the edges connecting SALES to the other vertices](./images/notebooks-connecting-vertices.png "This paragraph shows the edges connecting SALES to the other vertices ")

5. The next paragraph shows the result of querying for two specific sales IDs (4744 and 4538). You can right click on any of the vertices to get more information about these two sales.

    ![Query by sales ID](./images/notebooks-query-by-sales-id.png "Query by sales ID ")

6. The next paragraph shows the relationship between products, sales, and customers. You can right click on any of the vertices and edges to get more information.

    ![Query for the relationship between products, sales, and customers](./images/notebooks-query-by-sales-association.png "Query for the relationship between products, sales, and customers ")

7. The next two paragraphs illustrate a typical data warehouse query, but expressed in PGQL instead of SQL. In PGQL queries, you reference which graph to query by using the `MATCH ... ON <graphName>` syntax.
    Notice that `%pgql-pgx` paragraphs return tabular format by default, so you do not have to do any conversion to visualize the result of PGQL queries as charts.

    ![Which products did customers buy](./images/notebooks-which-products-did-cust-buy.png "Query with dynamic forms for customer ")

8. Note the use of **dynamic forms** in this first `%pgql-px` paragraph. If you use the form syntax as shown in that paragraph inside the query, the notebook will automatically render an input field and use the value you specify in the input field when executing the query.

    ![Query with dynamic forms for customer](./images/notebooks-dynamic-forms-for-cust.png " ")

    If you combine this feature with the ability to hide the **Code** section of the paragraph, you can turn notebooks into zero-code applications that users can execute with various parameters without any programming knowledge.
    Apart from text input, there's also support for dropdown and other types of forms. Please check the Autonomous Graph User's guide for the full reference.

9. The next paragraph illustrates how you can visualize results using charts. You may notice that you only see a chart, but no code. If this is the case, in the notebooks, you can hide the input for a paragraph. This is useful for generating reports. To show the code, click on the eye icon on the top right of the paragraph and check the **Code** box.

    ![Show code](./images/show-code.png "Show code ")

       Any paragraph which produces tabular results can be visualized using charts. To produce a tabular result, make sure the output encodes each row separated by \n (newline) and column separated by \t (tab) with first row as header row.
       That is what this paragraph is doing to visualize the distribution of vertex types in our graph using a pie chart.

10. Click on the chart types to explore different chart visualizations and their configuration options.

    ![Chart types](./images/chart-types.png " Chart types")

## Task 4: Play with Graph Visualization

1. Run this paragraph which shows an example of how to visualize PGQL queries as a graph:

    ![Run query to find who bought from the same channel](./images/notebooks-who-bought-from-same-channel.png "Run query to find who bought from the same channel ")

    Any non-complex PGQL query can also be rendered as a graph instead of a table or chart. Exceptions to this are queries which do not return singular entities like queries that contain `GROUP BY` or other aggregations. Click on the **Settings** button to explore all the graph visualization options. You can choose what properties to render next to an vertex or edge, what graph layout to use and much more. Try to change of few settings to see the effect.

2. In the graph visualization settings, open the **Highlights** tab.

    ![Open the highlights tab](./images/notebooks-viz-highlights.png "Open the highlights tab ")

    By using **Highlights**, you can emphasize certain elements in your graph by giving them a different color, icon, size, etc. than others based on certain conditions. As you can see, here we added a few highlights to render different types of vertices differently based on a label condition. Try to create your own highlight or edit an existing one to see how it affects the output, by clicking the **New Highlight** and **Edit Highlight** buttons respectively.

3. Close the settings dialog again and do a right-click on one of the vertices. It will show all the associated properties of that vertex. The properties which are part the projection of the original PGQL query are shown in bold:

    ![Show all the associated properties of a vertex](./images/notebooks-vertex-properties.png "Show all the associated properties of a vertex ")

## Task 5: Play with Graph Exploration

The graph visualization feature allows you to further **explore** the graph visually directly in the visualization canvas.

1. Click on one of the vertices in the rendered graph.

    ![Selected Vertex](./images/notebooks-selected-vertex.png "Selected Vertex ")

    You'll notice that the graph manipulation toolbar on the right side gets enabled.

<!---
2. You can decrease or increase the number of hops in the graph visualization settings dialog.

    ![Notebook settings modal to change the number of hops](./images/notebooks-settings-for-hops.png "Notebook settings modal to change the number of hops ")

    Click on the **Expand** action.

    ![Selected Vertex after expanding](./images/notebooks-expanded-vertex.png "Selected Vertex after expanding ")

    Expand will show you all the neighbors of the selected vertex, up to 2 hops.

3. The graph manipulation toolbar provides a convenient **Undo** option to reverse the previous manipulation. Click it to remove the expanded vertices again.

    ![Undo last action](./images/notebooks-undo-last-action.png "Undo last action ") 

4. Select a vertex again, this time click **Focus**. Focus is like **Expand**, but it will remove all the other elements on the canvas.

    ![Selected vertex pointing to focus button](./images/notebooks-focus.png "Selected vertex pointing to focus button ")

    ![Selected vertex after focus](./images/notebooks-after-focus.png "Selected vertex after focus") 
--->

2. Next, try to group several vertices into one group. For that, hold the mouse down and drag over the canvas to select a group of vertices. Then click the **Group** button.

    ![Group several vertices](./images/notebooks-group-selected.png "Group several vertices ")

    You can create as many groups as you want. That way you can group noisy elements into a single visible group without actually dropping them from the screen. The little number
    next to a group tells you how many elements are in that group.

    ![grouped verticies after grouping](./images/notebooks-group-highlighted-updated.png "grouped verticies after group operation")

3. To ungroup the elements again later, click on the group and then click the **Ungroup** icon.

    ![Ungroup verticies](./images/notebooks-ungroup.png "Ungroup verticies ")

4. You can also drop individual elements from the visualization. Click on a vertex and then click the **Drop** action.

    ![Drop element from visualization](./images/notebooks-drop-selected.png "Drop element from visualization ")

    You can also drop a group of elements. Simply select all the vertices and edges you want to drop by click and drag on the canvas, then click the **Drop** icon.

    ![Elements are dropped from visualization](./images/notebooks-dropped-selected.png "Elements are dropped from visualization")

5. Paragraph results can be expanded into a full screen to give you more space for graph manipulation. Click the **Expand** button on the top right of the paragraph to enter full screen mode.

    ![Select fullscreen](./images/notebooks-choose-fullscreen.png "Select fullscreen ")

    ![Fullscreen selected](./images/notebooks-fullscreen-updated.png "Fullscreen selected")

    Click the same button again to go back to normal screen.

6. Lastly, to go back to our initial state of the visualization, click the **Reset** icon in the manipulation toolbar. This will revert all the temporary changes we made to the result.

    ![Reset the visualization to the initial state](./images/notebooks-reset-default-state.png "Reset the visualization to the initial state ")

<!---
This should be task 6
Find the Most Important Products and Recommendations using Graph Algorithms

The example notebook contains two paragraphs illustrating how you can use graph algorithms to gain new insights into your data.

1. Scroll down to the **Find the most important products** paragraph and familiarize yourself how the algorithm works by reading the Markdown description.

2. Follow the instructions in the next paragraph to create a `BIDIRECTED\_SH\_PGVIEW\_GRAPH` Property Graph using the Modeler, and run the next paragraph to load it into memory.

    ![Create Bidirected Property Graph](./images/notebooks-bidir-graph.png "Create Bidirected Property Graph ")

3. In the next paragraph, we run the graph algorithm by invoking the corresponding PGX API. The result of the algorithm is stored in a new vertex property which we call `centrality`. In the paragraph below, we query that newly computed property and order the result by centrality value. This example shows you how you can combine algorithms and PGQL queries to quickly rank elements in your graph.

    ![Use centrality to find important products](./images/notebooks-important-products.png "Use centrality to find important products ")

    Go ahead and run those paragraphs yourself.

4. The next few paragraphs illustrate how you can leverage the built-in **Personalized PageRank** algorithm to recommend products to a particular customer. Familiarize yourself how the algorithm works by reading the Markdown description. We again run the algorithm via an easy PGX API invocation and then query the result using PGQL. This time we use two queries. The first one shows you the products that the customer already bought. The second query shows the products recommended as a possible purchase.

    ![Use pagerank to create product recommendations](./images/notebooks-product-recommendation.png "Use pagerank to create product recommendations ")

--->

**Congratulations!** You successfully completed the lab.

## Acknowledgements
* **Author** - Jayant Sharma, Product Management
* **Contributors** -  Korbi Schmid, Rahul Tasker, Ramu Murakami Gutierrez, Product Development
* **Last Updated By/Date** - Denise Myrick, June 2024