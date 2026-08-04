# Ask Ontology-Grounded Questions

## Introduction

In this lab, you will create `f1_ask`, a function that uses vector search to select relevant graph entities, expands those entities into RDF triples, and asks a chat model to answer using the ontology and the selected RDF facts only.

The ontology is schema context: it explains classes, aliases, inverse properties, and permitted relationships. The retrieved RDF triples are the evidence used to answer each question. Vector search improves focus and scale; it does not replace the RDF graph.

Estimated Time: 10 minutes

### Objectives

- Create an ontology- and graph-grounded question-answering function.
- Test answers and inspect the selected RDF facts.
- Explain how vectors, RDF facts, and the ontology work together.

## Task 1: Create the question-answering function

1. Create the function. Replace `F1_EMBED_PROFILE`, `GENAI_PROFILE`, the graph model, and semantic network names if they differ in your environment.

    ```sql
    CREATE OR REPLACE FUNCTION f1_ask (
      p_question IN VARCHAR2
    ) RETURN CLOB
    AUTHID DEFINER
    AS
      l_ontology    CLOB;
      l_graph_facts CLOB;
    BEGIN
      l_ontology := TO_CLOB(
    'f1:VehicleFeature rdf:type owl:Class .
    f1:VehicleDimension rdf:type owl:Class .
    f1:Measurement rdf:type owl:Class .
    f1:Unit rdf:type owl:Class .
    f1:EnergyMode rdf:type owl:Class ; rdfs:subClassOf f1:VehicleFeature .
    f1:AeroMode rdf:type owl:Class ; rdfs:subClassOf f1:VehicleFeature .
    f1:LegacySystem rdf:type owl:Class ; rdfs:subClassOf f1:VehicleFeature .
    f1:ChargingTechnique rdf:type owl:Class .
    f1:Tyre rdf:type owl:Class .
    f1:FrontTyre rdf:type owl:Class ; rdfs:subClassOf f1:Tyre .
    f1:RearTyre rdf:type owl:Class ; rdfs:subClassOf f1:Tyre .
    f1:LengthMeasurement rdfs:subClassOf f1:Measurement .
    f1:WeightMeasurement rdfs:subClassOf f1:Measurement .
    f1:usesFeature rdf:type owl:ObjectProperty .
    f1:hasMeasurement rdf:type owl:ObjectProperty .
    f1:hasUnit rdf:type owl:ObjectProperty .
    f1:measures rdf:type owl:ObjectProperty .
    f1:usesEnergyMode rdf:type owl:ObjectProperty ;
        rdfs:subPropertyOf f1:usesFeature .
    f1:usesAeroMode rdf:type owl:ObjectProperty ;
        rdfs:subPropertyOf f1:usesFeature .
    f1:replacesSystem rdf:type owl:ObjectProperty .
    f1:replacedBy rdf:type owl:ObjectProperty ;
        owl:inverseOf f1:replacesSystem .
    f1:occursDuring rdf:type owl:ObjectProperty .
    f1:disables rdf:type owl:ObjectProperty .
    f1:keepsState rdf:type owl:ObjectProperty .
    f1:Tyre owl:sameAs f1:Tire .'
      );

      WITH
        question_vector AS (
          SELECT TO_VECTOR(
                   DBMS_CLOUD_AI.GENERATE(
                     prompt       => p_question,
                     profile_name => 'F1_EMBED_PROFILE',
                     action       => 'embedding'
                   )
                 ) AS embedding
          FROM dual
        ),
        relevant_entities AS (
          SELECT c.entity_term
          FROM f1_graph_entity_cards c
          CROSS JOIN question_vector q
          ORDER BY VECTOR_DISTANCE(c.embedding, q.embedding, COSINE)
          FETCH FIRST 15 ROWS ONLY
        ),
        relevant_triples AS (
          SELECT DISTINCT r.RDF$STC_SUB, r.RDF$STC_PRED, r.RDF$STC_OBJ
          FROM f1_rdf_load_stg r
          JOIN relevant_entities e
            ON r.RDF$STC_SUB = e.entity_term
            OR r.RDF$STC_OBJ = e.entity_term
        )
      SELECT XMLCAST(
               XMLAGG(
                 XMLELEMENT(
                   e,
                   RDF$STC_SUB || ' ' || RDF$STC_PRED || ' ' ||
                   RDF$STC_OBJ || ' .' || CHR(10)
                 )
                 ORDER BY RDF$STC_PRED, RDF$STC_OBJ
               ).EXTRACT('//text()') AS CLOB
             )
      INTO l_graph_facts
      FROM relevant_triples;

      RETURN DBMS_CLOUD_AI.GENERATE(
        prompt => TO_CLOB(
          'Answer using only the ontology and RDF graph facts below. ' ||
          'The ontology defines the meaning of classes, aliases, and relationships. ' ||
          'The RDF graph facts are evidence for claims about Formula 1 2026. ' ||
          'Use inverse relationships correctly. Do not use outside knowledge. ' ||
          'If the supplied facts do not support an answer, say CANNOT DETERMINE.' ||
          CHR(10) || CHR(10) || 'ONTOLOGY:' || CHR(10)
        ) || l_ontology || TO_CLOB(
          CHR(10) || CHR(10) || 'RELEVANT RDF GRAPH FACTS:' || CHR(10)
        ) || NVL(l_graph_facts, 'No relevant RDF graph facts were found.') ||
        TO_CLOB(CHR(10) || CHR(10) || 'USER QUESTION: ' || p_question),
        profile_name => 'GENAI_PROFILE',
        action       => 'chat'
      );
    END;
    /
    ```

## Task 2: Test grounded answers

1. Ask a question that the graph is expected to answer.

    ```sql
    SELECT DBMS_LOB.SUBSTR(
             f1_ask('What energy mode does the 2026 Formula 1 car use?'),
             4000, 1
           ) AS answer
    FROM dual;
    ```

2. Test a term or feature in the source graph.

    ```sql
    SELECT DBMS_LOB.SUBSTR(
             f1_ask('Can I use DRS?'),
             4000, 1
           ) AS answer
    FROM dual;
    ```

3. Test the missing-information behavior.

    ```sql
    SELECT DBMS_LOB.SUBSTR(
             f1_ask('What is the 2026 F1 car maximum speed?'),
             4000, 1
           ) AS answer
    FROM dual;
    ```

## Task 3: Inspect the graph context sent to the model

1. Run this query to see the RDF triples selected for a question before the chat model is called.

    ```sql
    WITH question_vector AS (
      SELECT TO_VECTOR(
               DBMS_CLOUD_AI.GENERATE(
                 prompt       => 'Can I use DRS?',
                 profile_name => 'F1_EMBED_PROFILE',
                 action       => 'embedding'
               )
             ) AS embedding
      FROM dual
    ),
    relevant_entities AS (
      SELECT c.entity_term,
             VECTOR_DISTANCE(c.embedding, q.embedding, COSINE) AS distance
      FROM f1_graph_entity_cards c
      CROSS JOIN question_vector q
      ORDER BY VECTOR_DISTANCE(c.embedding, q.embedding, COSINE)
      FETCH FIRST 15 ROWS ONLY
    )
    SELECT e.entity_term, e.distance,
           r.RDF$STC_SUB, r.RDF$STC_PRED, r.RDF$STC_OBJ
    FROM relevant_entities e
    JOIN f1_rdf_load_stg r
      ON r.RDF$STC_SUB = e.entity_term
      OR r.RDF$STC_OBJ = e.entity_term
    ORDER BY e.distance, r.RDF$STC_PRED;
    ```

    This query makes the retrieval path explainable: question, vector-selected entities, connected RDF facts, and final answer. The function always sends RDF facts and the ontology to the chat model; it never sends source PDF chunks as answer context.

## Learn More

- [Oracle AI Vector Search](https://docs.oracle.com/en/database/oracle/oracle-database/26/vecse/ai-vector-search-users-guide.pdf)
- [Oracle RDF Graph Developer's Guide](https://docs.oracle.com/en/database/oracle/oracle-database/26/rdfrm/graph-developers-guide-rdf-graph.pdf)

## Acknowledgements

* **Source** - [Oracle DBMS_CLOUD_AI documentation](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-package.html).
* **Last Updated** - August 4, 2026
