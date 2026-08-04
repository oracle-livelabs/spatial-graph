# Vectorize Graph Entities

## Introduction

Vectorizing the original PDF chunks alone can miss a graph fact that was extracted from a different chunk. In this lab, you will create one vectorized card for each RDF entity. Each card contains the entity and every connected triple. Vector search can then identify a relevant entity, while RDF graph facts remain the evidence sent to the answer model.

Estimated Time: 15 minutes

### Objectives

- Create one graph-fact card per RDF entity.
- Generate a vector embedding for each card.
- Inspect semantic nearest-neighbour results for an F1 question.

## Task 1: Create graph entity cards

1. Create the entity-card table.

    ```sql
    CREATE TABLE f1_graph_entity_cards (
      entity_term VARCHAR2(1000) NOT NULL,
      card_text   CLOB NOT NULL,
      embedding   VECTOR(*, FLOAT32),
      CONSTRAINT f1_graph_entity_cards_pk PRIMARY KEY (entity_term)
    );
    ```

2. Build a card for every RDF IRI that appears as a subject or object.

    ```sql
    INSERT INTO f1_graph_entity_cards (entity_term, card_text)
    WITH entities AS (
      SELECT DISTINCT RDF$STC_SUB AS entity_term
      FROM f1_rdf_load_stg
      UNION
      SELECT DISTINCT RDF$STC_OBJ
      FROM f1_rdf_load_stg
      WHERE RDF$STC_OBJ LIKE '<%'
    )
    SELECT e.entity_term,
           TO_CLOB('Graph entity: ' || e.entity_term || CHR(10) ||
                   'Connected RDF facts:' || CHR(10)) ||
           TO_CLOB(
             LISTAGG(
               r.RDF$STC_SUB || ' ' || r.RDF$STC_PRED || ' ' ||
               r.RDF$STC_OBJ || ' .',
               CHR(10)
             ) WITHIN GROUP (ORDER BY r.RDF$STC_PRED, r.RDF$STC_OBJ)
           )
    FROM entities e
    JOIN f1_rdf_load_stg r
      ON r.RDF$STC_SUB = e.entity_term
      OR r.RDF$STC_OBJ = e.entity_term
    GROUP BY e.entity_term;

    COMMIT;
    ```

    The card is an RDF-focused retrieval unit. It is not a replacement for the graph; it gives vector search enough context to choose a useful graph neighbourhood.

## Task 2: Generate entity-card embeddings

1. Replace the profile name and generate one embedding per card.

    ```sql
    UPDATE f1_graph_entity_cards
    SET embedding = TO_VECTOR(
      DBMS_CLOUD_AI.GENERATE(
        prompt       => DBMS_LOB.SUBSTR(card_text, 4000, 1),
        profile_name => 'F1_EMBED_PROFILE',
        action       => 'embedding'
      )
    )
    WHERE embedding IS NULL;

    COMMIT;
    ```

    Use the same embedding profile for both stored cards and user questions. Embeddings from different models should not be compared.

2. For a larger demo dataset, create a vector index after loading the embeddings.

    ```sql
    CREATE VECTOR INDEX f1_entity_cards_hnsw_idx
    ON f1_graph_entity_cards (embedding)
    ORGANIZATION INMEMORY
    NEIGHBOR GRAPH
    WITH TARGET ACCURACY 95
    DISTANCE COSINE;
    ```

## Task 3: Inspect vector retrieval

1. Run a nearest-neighbour search and inspect the retrieved entity cards.

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
    )
    SELECT c.entity_term,
           VECTOR_DISTANCE(c.embedding, q.embedding, COSINE) AS distance,
           DBMS_LOB.SUBSTR(c.card_text, 1000, 1) AS card_preview
    FROM f1_graph_entity_cards c
    CROSS JOIN question_vector q
    ORDER BY VECTOR_DISTANCE(c.embedding, q.embedding, COSINE)
    FETCH FIRST 15 ROWS ONLY;
    ```

    For a small graph, use a larger result count such as 15 or 20 to favor recall. In a large graph, add hybrid keyword-plus-vector retrieval and reranking.

## Acknowledgements

* **Source** - [Oracle AI Vector Search documentation](https://docs.oracle.com/en/database/oracle/oracle-database/26/vecse/ai-vector-search-users-guide.pdf).
* **Last Updated** - August 4, 2026
