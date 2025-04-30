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

## Task 1: Create Prompt Table

(optional) Task 1 opening paragraph.

1. Navigate to SQL Developer, either from Database Actions or from your Autonomous Database instance in the OCI console.  


   ![SQL from Database Actions](images/click_sql_from_db_actions.png "SQL from Database Actions")

   ![Autonomous Database home page pointing to the Database Actions button](images/click-database-actions-updated.png "Autonomous Database home page pointing to the Database Actions button")


2. Run the PL/SQL to create stored procedure for making prompt requests
   
    Paste the PL/SQL:

    ```text
        <copy>
         CREATE OR REPLACE PROCEDURE verticeTwentyFiveEdge (
            entityname       IN  VARCHAR2,
            promptBegin     IN VARCHAR2,
            resp     OUT VARCHAR2,
            PropertyGraphRag  OUT VARCHAR2
          )  
          IS
            query VARCHAR2(4000);
          BEGIN
            query := '
          With cteGraphData
          AS
          (   SELECT ROWNUM as row_n,  entity_name || ''('' || entity_type || '') '' || relation || '' '' || entity_name_dest  || ''('' || entity_type_dest || '') ''  as INFORMATION
            FROM GRAPH_TABLE(PG_RAG_PGQL
                  MATCH (n IS Entity)-[e is Relation]->(n2 is Entity)
                  WHERE n.entity_name =:a
                  COLUMNS(n.entity_name as entity_name,n.entity_type as entity_type,e.relation,n2.entity_name as entity_name_dest,n2.entity_type as entity_type_dest))
              UNION
              

          ),
          ctePivotGraphData AS
          (
          SELECT 
                  graphfact_1,  
                  graphfact_2,   
                  graphfact_3,  
                  graphfact_4,  
                  graphfact_5, 
                  graphfact_6,  
                  graphfact_7,  
                  graphfact_8,  
                  graphfact_9,  
                  graphfact_10,
                  graphfact_11,  
                  graphfact_12,   
                  graphfact_13,  
                  graphfact_14,  
                  graphfact_15, 
                  graphfact_16,  
                  graphfact_17,  
                  graphfact_18,  
                  graphfact_19,  
                  graphfact_20,
                  graphfact_21, 
                  graphfact_22,  
                  graphfact_23,  
                  graphfact_24,  
                  graphfact_25 
          FROM
          (SELECT 
                  row_n,
                  INFORMATION 
          FROM cteGraphData)
          PIVOT
          (max(INFORMATION) 
          FOR row_n IN (''1'' AS graphfact_1,''2'' AS graphfact_2, ''3'' AS graphfact_3, ''4'' AS graphfact_4,      ''5'' AS graphfact_5, ''6'' AS graphfact_6, ''7'' AS graphfact_7, ''8'' AS graphfact_8, ''9'' AS graphfact_9, ''10'' AS graphfact_10,
                      ''11'' AS graphfact_11,''12'' AS graphfact_12, ''13'' AS graphfact_13, ''14'' AS graphfact_14, ''15'' AS graphfact_15
                      , ''16'' AS graphfact_16, ''17'' AS graphfact_17, ''18'' AS graphfact_18, ''19'' AS graphfact_19, ''20'' AS graphfact_20, ''21'' AS graphfact_21, ''22'' AS graphfact_22, ''23'' AS graphfact_23, ''24'' AS graphfact_24, ''25'' AS graphfact_25
                      ) 
          )
          )

          SELECT
                     REPLACE(JSON_OBJECT (

                                  graphfact_1, 
                                  graphfact_2, 
                                  graphfact_3, 
                                  graphfact_4,                         
                                  graphfact_5, 
                                  graphfact_6,
                                  graphfact_7, 
                                  graphfact_8,                         
                                  graphfact_9, 
                                  graphfact_10,
                                  graphfact_11, 
                                  graphfact_12, 
                                  graphfact_13, 
                                  graphfact_14,                         
                                  graphfact_15, 
                                  graphfact_16,
                                  graphfact_17, 
                                  graphfact_18,                         
                                  graphfact_19, 
                                  graphfact_20, 
                                  graphfact_21,
                                  graphfact_22, 
                                  graphfact_23,                         
                                  graphfact_24, 
                                  graphfact_25
                              ),''graphfact_'','''') as result
      from ctePivotGraphData';
          
            EXECUTE IMMEDIATE query INTO PropertyGraphRag USING entityname;

          SELECT DBMS_CLOUD_AI.GENERATE(prompt       => promptBegin || '  with the following INFORMATION  ' || PropertyGraphRag ,
                                        profile_name => 'GENAI_GRAPH',
                                        action       => 'chat')
          INTO resp
          FROM dual;

            DBMS_OUTPUT.PUT_LINE('Response: ' || resp);
          END;

        </copy>
    ```


## Task 2: Execute examples of using property graph for Retrieval Augmented Generation

1. Create Evidence report using property graph query on Blue Carbuncle Vertice, run PL/SQL to 

    Paste the PL/SQL:

    ```text
        <copy>
            DECLARE
              L_ENTITYNAME       VARCHAR2(200) := 'Blue Carbuncle';
              L_PROMPTBEGIN      VARCHAR2(200) := 'Write an official report on';
              L_RESP             VARCHAR2(8000);
              L_PROPERTYGRAPHRAG VARCHAR2(4000);
          BEGIN
                VERTICETWENTYFIVEEDGE(
                  ENTITYNAME       => L_ENTITYNAME,
                  PROMPTBEGIN      => L_PROMPTBEGIN,
                  RESP             => L_RESP,
                  PROPERTYGRAPHRAG => L_PROPERTYGRAPHRAG
              );
          END;
        </copy>
    ```
    

2. Write a prosecution argument on James Ryder

    Paste the PL/SQL:

    ```text
        <copy>
          DECLARE
              L_ENTITYNAME       VARCHAR2(200) := 'James Ryder';
              L_PROMPTBEGIN      VARCHAR2(200) := 'write a bulleted outline of a prosecution argument';
              L_RESP             VARCHAR2(8000);
              L_PROPERTYGRAPHRAG VARCHAR2(4000);
          BEGIN
                  VERTICETWENTYFIVEEDGE(
                  ENTITYNAME       => L_ENTITYNAME,
                  PROMPTBEGIN      => L_PROMPTBEGIN,
                  RESP             => L_RESP,
                  PROPERTYGRAPHRAG => L_PROPERTYGRAPHRAG
              );
          END;
        </copy>
    ```

3. Write poem using property graph query on Hat

    Paste the PL/SQL:

    ```text
        <copy>
          DECLARE
              L_ENTITYNAME       VARCHAR2(200) := 'Hat';
              L_PROMPTBEGIN      VARCHAR2(200) := 'write a poem about';
              L_RESP             VARCHAR2(8000);
              L_PROPERTYGRAPHRAG VARCHAR2(4000);
          BEGIN
                  VERTICETWENTYFIVEEDGE(
                  ENTITYNAME       => L_ENTITYNAME,
                  PROMPTBEGIN      => L_PROMPTBEGIN,
                  RESP             => L_RESP,
                  PROPERTYGRAPHRAG => L_PROPERTYGRAPHRAG
              );
          END;
        </copy>
    ```

## Learn More

*(optional - include links to docs, white papers, blogs, etc)*

* [URL text 1](http://docs.oracle.com)
* [URL text 2](http://docs.oracle.com)

## Acknowledgements
* **Author** - <Name, Title, Group>
* **Contributors** -  <Name, Group> -- optional
* **Last Updated By/Date** - <Name, Month Year>
