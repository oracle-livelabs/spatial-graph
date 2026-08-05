# Create and Query the Electronics Ontology

## Introduction

Create an RDF network and a graph that holds the electronics product ontology. The ontology describes a product hierarchy independently of the relational product-type values.

Estimated Time: 20 Minutes

### Objectives

In this lab, you will:

- Create the RDF network and ontology graph.
- Load the electronics product class hierarchy.

## Task 1: Create the RDF network and graph

1. Run the following commands.

    ```
    <copy>
    EXECUTE SEM_APIS.CREATE_RDF_NETWORK('DATA', network_owner => 'KGLAYER', network_name => 'RDF_NETWORK');
    EXECUTE SEM_APIS.CREATE_RDF_GRAPH('coreontology', 'null', 'null', network_owner => 'KGLAYER', network_name => 'RDF_NETWORK');
    </copy>
    ```

    Replace `KGLAYER` and `RDF_NETWORK` if your environment uses different names.

## Task 2: Drop the graph when resetting the lab

1. The source script includes this command after graph creation. Run it only to remove an existing ontology graph before recreating the lab; do not run it in a first-time setup.

    ```
    <copy>
    EXECUTE SEM_APIS.DROP_RDF_GRAPH('coreontology', 'null', network_owner => 'KGLAYER', network_name => 'RDF_NETWORK');
    </copy>
    ```

## Task 3: Load the product hierarchy

1. Run this PL/SQL block to add the ontology triples.

    ```
    <copy>
    BEGIN
      SEM_APIS.UPDATE_RDF_GRAPH('COREONTOLOGY',
        'PREFIX ex: <https://example.com/electronics/>
         PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
         PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
         PREFIX owl: <http://www.w3.org/2002/07/owl#>
         INSERT DATA {
           ex:ElectronicsOntology rdf:type owl:Ontology .
           ex:Product rdf:type owl:Class ; rdfs:label "Product" .
           ex:ElectronicProduct rdf:type owl:Class ; rdfs:label "Electronic product" ; rdfs:subClassOf ex:Product .
           ex:ComputerDevice rdf:type owl:Class ; rdfs:label "Computer device" ; rdfs:subClassOf ex:ElectronicProduct .
           ex:Laptop rdf:type owl:Class ; rdfs:label "Laptop" ; rdfs:subClassOf ex:ComputerDevice .
           ex:GamingLaptop rdf:type owl:Class ; rdfs:label "Gaming laptop" ; rdfs:subClassOf ex:Laptop .
           ex:BusinessLaptop rdf:type owl:Class ; rdfs:label "Business laptop" ; rdfs:subClassOf ex:Laptop .
           ex:MobileDevice rdf:type owl:Class ; rdfs:label "Mobile device" ; rdfs:subClassOf ex:ElectronicProduct .
           ex:Smartphone rdf:type owl:Class ; rdfs:label "Smartphone" ; rdfs:subClassOf ex:MobileDevice .
           ex:Tablet rdf:type owl:Class ; rdfs:label "Tablet" ; rdfs:subClassOf ex:MobileDevice .
           ex:AudioDevice rdf:type owl:Class ; rdfs:label "Audio device" ; rdfs:subClassOf ex:ElectronicProduct .
           ex:Headphones rdf:type owl:Class ; rdfs:label "Headphones" ; rdfs:subClassOf ex:AudioDevice .
           ex:NoiseCancellingHeadphones rdf:type owl:Class ; rdfs:label "Noise-cancelling headphones" ; rdfs:subClassOf ex:Headphones .
         }', network_owner => 'KGLAYER', network_name => 'RDF_NETWORK');
    END;
    /
    COMMIT;
    </copy>
    ```

## Acknowledgements

* **Source** - User-provided Electronics Store knowledge-graph script. Built with permission from the author(s).
* **Last Updated By/Date** - Codex / August 2026

