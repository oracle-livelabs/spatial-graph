# Query the Created Knowledge Graph

## Introduction

After creating `KNOWLEDGEGRAPH`, run the final queries from the source script.

Estimated Time: 10 Minutes

### Objectives

In this lab, you will:

- Query resources and relationships in `KNOWLEDGEGRAPH`.
- Run the SQL laptop-order question.

## Task 1: Query the knowledge graph

1. Return all resources and relationships in `KNOWLEDGEGRAPH`.

    ```
    <copy>
    SELECT s$rdfterm, p$rdfterm, o$rdfterm AS entity
      FROM TABLE(SEM_MATCH(
        'SELECT ?s ?p ?o WHERE { ?s ?p ?o . }',
        SEM_MODELS('KNOWLEDGEGRAPH'), NULL, NULL, NULL, NULL, 'PLUS_RDFT=VC',
        NULL, NULL, 'KGLAYER', 'RDF_NETWORK'))
    ORDER BY s$rdfterm;
    </copy>
    ```

## Task 2: Find customers who ordered a laptop with SQL

1. Run the SQL question from the script.

    ```
    <copy>
    SELECT DISTINCT c.customer_id, c.customer_name, c.email_address
    FROM customer c
    JOIN sales_order o ON o.customer_id = c.customer_id
    JOIN sales_order_item oi ON oi.order_id = o.order_id
    JOIN product p ON p.product_id = oi.product_id
    WHERE p.product_type IN ('GAMING_LAPTOP', 'BUSINESS_LAPTOP')
    ORDER BY c.customer_name;
    </copy>
    ```

## Acknowledgements

* **Source** - User-provided Electronics Store knowledge-graph script. Built with permission from the author(s).
* **Last Updated By/Date** - Codex / August 2026
