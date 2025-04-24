# Title of the Lab

## Introduction

*Describe the lab in one or two sentences, for example:* This lab walks you through the steps to ...

Estimated Time: -- minutes

### About <Product/Technology> (Optional)
Enter background information here about the technology/feature or product used in this lab - no need to repeat what you covered in the introduction. Keep this section fairly concise. If you find yourself needing more than two sections/paragraphs, please utilize the "Learn More" section.

### Objectives

*List objectives for this lab using the format below*

In this lab, you will:
* Objective 1
* Objective 2
* Objective 3

### Prerequisites (Optional)

*List the prerequisites for this lab using the format below. Fill in whatever knowledge, accounts, etc. is needed to complete the lab. Do NOT list each previous lab as a prerequisite.*

This lab assumes you have:
* An Oracle Cloud account
* All previous labs successfully completed


*This is the "fold" - below items are collapsed by default*

## Task 1: Load Gen AI Prompt Responses into table

1. Create staging, edge and vertice tables

      Paste the PL/SQL:

      ```text
          <copy>
            DROP TABLE IF EXISTS GRAPH_RELATIONS_STG; 
            CREATE TABLE GRAPH_RELATIONS_STG (
                    id RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
                    chunk_id NUMBER,
                    head VARCHAR(256) NOT NULL,
                    head_type VARCHAR(256),
                    relation VARCHAR(256) NOT NULL,
                    tail VARCHAR(256) NOT NULL,
                    tail_type VARCHAR(256),
                    text VARCHAR(512)
                    );
              DROP TABLE IF EXISTS GRAPH_ENTITIES; 
              CREATE TABLE GRAPH_ENTITIES
              ( 
              ID          NUMBER GENERATED ALWAYS AS IDENTITY 
                  ( START WITH 1 CACHE 20 )  NOT NULL , 
              ENTITY_NAME VARCHAR2 (250) , 
              ENTITY_TYPE VARCHAR2 (250) 
              );
              DROP TABLE IF EXISTS GRAPH_RELATIONS;       
              CREATE TABLE  GRAPH_RELATIONS 
              ( 
              ID       NUMBER GENERATED ALWAYS AS IDENTITY 
                  ( START WITH 1 CACHE 20 )  NOT NULL , 
              CHUNK_ID NUMBER , 
              HEAD_ID  NUMBER , 
              TAIL_ID  NUMBER , 
              RELATION VARCHAR2 (256)  NOT NULL , 
              TEXT     VARCHAR2 (512) 
              );
          </copy>
      ```
2. Load Staging table

      Paste the PL/SQL:

      ```text
          <copy>
               INSERT INTO GRAPH_RELATIONS_STG (chunk_id, head, head_type, relation, tail, tail_type, text)
              SELECT mt.chunk_id, jt.head, jt.head_type, jt.relation, jt.tail, jt.tail_type, jt.head_type || ': ' || jt.head ||
              ' -[' || jt.relation || ']-> ' || jt.tail_type || ': ' || jt.tail
              FROM GRAPH_EXTRACTION_STAGING mt,
              JSON_TABLE (
              mt.RESPONSE,
              '$[*]'
              COLUMNS (
              head VARCHAR2(256) PATH '$.head',
              head_type VARCHAR2(256) PATH '$.head_type',
              relation VARCHAR2(256) PATH '$.relation',
              tail VARCHAR2(256) PATH '$.tail',
              tail_type VARCHAR2(256) PATH '$.tail_type'
              )
              ) jt WHERE
              mt.response is json and
              jt.head IS NOT NULL and
              jt.relation IS NOT NULL and
              jt.tail IS NOT NULL;
          </copy>
      ```

## Task 2: Clean Data

## Task 3: Process Staging tables Data

## Task 4: Create Graph




## Learn More

*(optional - include links to docs, white papers, blogs, etc)*

* [URL text 1](http://docs.oracle.com)
* [URL text 2](http://docs.oracle.com)

## Acknowledgements
* **Author** - <Name, Title, Group>
* **Contributors** -  <Name, Group> -- optional
* **Last Updated By/Date** - <Name, Month Year>
