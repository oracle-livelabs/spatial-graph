# Examine the Data and Ontology

## Introduction

Begin the LiveLab flow by examining the relational data and the electronics-store ontology that Terraform has already provisioned.

Estimated Time: 20 Minutes

### Objectives

In this lab, you will:

- Examine the source tables.
- Examine the electronics-store ontology.

## Task 1: Examine the data in the tables

1. Run the table queries from the script.

    ```
    <copy>
    SELECT * FROM customer;
    SELECT * FROM product;
    SELECT * FROM sales_order;
    SELECT * FROM sales_order_item;
    </copy>
    ```

## Task 2: Examine the Electronics Store ontology

1. List the subclasses of `Laptop`.

    ```
    <copy>
    SELECT s$rdfterm AS entity
      FROM TABLE(SEM_MATCH(
        'PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
         PREFIX ex: <https://example.com/electronics/>
         SELECT ?s WHERE { ?s rdfs:subClassOf ex:Laptop . }',
        SEM_MODELS('coreontology'), NULL, NULL, NULL, NULL, 'PLUS_RDFT=VC',
        NULL, NULL, 'KGLAYER', 'RDF_NETWORK'))
    ORDER BY s$rdfterm;
    </copy>
    ```

2. List all classes below `ElectronicProduct`.

    ```
    <copy>
    SELECT product_class, class_label FROM TABLE(SEM_MATCH(
      'PREFIX ex: <https://example.com/electronics/>
       PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
       SELECT ?product_class ?class_label WHERE {
         ?product_class rdfs:subClassOf+ ex:ElectronicProduct .
         OPTIONAL { ?product_class rdfs:label ?class_label . }
       } ORDER BY ?class_label',
      SEM_MODELS('COREONTOLOGY'), NULL, NULL, NULL, NULL, 'PLUS_RDFT=VC',
      NULL, NULL, 'KGLAYER', 'RDF_NETWORK'));
    </copy>
    ```

## Acknowledgements

* **Source** - User-provided Electronics Store knowledge-graph script. Built with permission from the author(s).
* **Last Updated By/Date** - Codex / August 2026
