# Extract Ontology-Aligned RDF Facts

## Introduction

In this lab, you will use a chat model to convert each document chunk into JSON triples. The ontology constrains the terms that the model may use. Staging the raw JSON separately from parsed triples makes the pipeline observable: you can review, repair, or reprocess a response without calling the model again.

Estimated Time: 15 minutes

### Objectives

- Store raw AI extraction responses as validated JSON.
- Parse each JSON response into relational RDF triple rows.
- Preserve document and chunk provenance for every fact.

## Task 1: Create extraction staging tables

1. Create a table for the raw JSON response from each chunk.

    ```sql
    CREATE TABLE f1_rdf_extract_stg (
      document_id NUMBER NOT NULL,
      chunk_id    NUMBER NOT NULL,
      response    CLOB CHECK (response IS JSON),
      CONSTRAINT f1_rdf_extract_stg_pk PRIMARY KEY (document_id, chunk_id)
    );
    ```

2. Create a table with one row per extracted triple.

    ```sql
    CREATE TABLE f1_rdf_triples_stg (
      document_id  NUMBER NOT NULL,
      chunk_id     NUMBER NOT NULL,
      subject_id   VARCHAR2(128) NOT NULL,
      predicate    VARCHAR2(128) NOT NULL,
      object_value VARCHAR2(4000) NOT NULL,
      object_kind  VARCHAR2(10) NOT NULL
        CHECK (object_kind IN ('iri', 'literal')),
      datatype_uri VARCHAR2(500),
      unit_value   VARCHAR2(64)
    );
    ```

## Task 2: Extract facts with the ontology

1. Run the following block after replacing `GENAI_PROFILE` with your chat profile. The ontology is deliberately included in the prompt so the model knows the permitted classes, predicates, inverse relationships, and aliases.

    ```sql
    DECLARE
      l_prompt CLOB;
      l_response CLOB;
    BEGIN
      FOR r IN (
        SELECT document_id, chunk_id, chunk_text
        FROM f1_document_chunks
        ORDER BY document_id, chunk_id
      ) LOOP
        l_prompt :=
          'Extract only explicitly stated Formula 1 2026 facts. ' ||
          'Return JSON only: {"triples":[{"subject":"id",' ||
          '"predicate":"term","object":"id or literal",' ||
          '"object_kind":"iri or literal","datatype":"IRI or null",' ||
          '"unit":"unit or null"}]}. ' ||
          'Use only this ontology: f1:VehicleFeature rdf:type owl:Class. ' ||
          'f1:EnergyMode rdfs:subClassOf f1:VehicleFeature. ' ||
          'f1:AeroMode rdfs:subClassOf f1:VehicleFeature. ' ||
          'f1:LegacySystem rdfs:subClassOf f1:VehicleFeature. ' ||
          'f1:usesFeature rdf:type owl:ObjectProperty. ' ||
          'f1:usesEnergyMode rdfs:subPropertyOf f1:usesFeature. ' ||
          'f1:usesAeroMode rdfs:subPropertyOf f1:usesFeature. ' ||
          'f1:replacesSystem rdf:type owl:ObjectProperty. ' ||
          'f1:replacedBy owl:inverseOf f1:replacesSystem. ' ||
          'f1:Tyre owl:sameAs f1:Tire. ' ||
          'Text to extract from: ' ||
          DBMS_LOB.SUBSTR(r.chunk_text, 12000, 1);

        l_response := DBMS_CLOUD_AI.GENERATE(
          prompt       => l_prompt,
          profile_name => 'GENAI_PROFILE',
          action       => 'chat'
        );

        INSERT INTO f1_rdf_extract_stg (document_id, chunk_id, response)
        VALUES (r.document_id, r.chunk_id, l_response);
      END LOOP;
      COMMIT;
    END;
    /
    ```

    In a production workshop, replace the abbreviated ontology in this code block with your complete approved ontology. Keep the text chunk outside the quoted ontology prompt and join it with `||`.

## Task 3: Parse JSON into triple rows

1. Convert the JSON array into one relational row per triple.

    ```sql
    INSERT INTO f1_rdf_triples_stg (
      document_id, chunk_id, subject_id, predicate,
      object_value, object_kind, datatype_uri, unit_value
    )
    SELECT e.document_id, e.chunk_id,
           jt.subject_id, jt.predicate, jt.object_value,
           LOWER(jt.object_kind), jt.datatype_uri, jt.unit_value
    FROM f1_rdf_extract_stg e
    CROSS JOIN JSON_TABLE(
      e.response,
      '$.triples[*]'
      COLUMNS (
        subject_id   VARCHAR2(128)  PATH '$.subject',
        predicate    VARCHAR2(128)  PATH '$.predicate',
        object_value VARCHAR2(4000) PATH '$.object',
        object_kind  VARCHAR2(10)   PATH '$.object_kind',
        datatype_uri VARCHAR2(500)  PATH '$.datatype',
        unit_value   VARCHAR2(64)   PATH '$.unit'
      )
    ) jt
    WHERE jt.subject_id IS NOT NULL
      AND jt.object_value IS NOT NULL
      AND LOWER(jt.object_kind) IN ('iri', 'literal');

    COMMIT;
    ```

2. Review the extracted facts and their provenance.

    ```sql
    SELECT document_id, chunk_id, subject_id, predicate,
           object_value, object_kind
    FROM f1_rdf_triples_stg
    ORDER BY document_id, chunk_id, predicate;
    ```

## Acknowledgements

* **Source** - [Oracle DBMS_CLOUD_AI documentation](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-package.html).
* **Last Updated** - August 4, 2026
