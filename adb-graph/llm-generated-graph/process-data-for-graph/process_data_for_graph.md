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

## Task 1: Load ONNX Models for Graph user


1. Open the service detail page for your Autonomous Database instance in the OCI console.  

   Then click on **Database Actions** and select **SQL**. 

   ![Autonomous Database home page pointing to the Database Actions button](images/click-database-actions-updated.png "Autonomous Database home page pointing to the Database Actions button")

2. Make sure to be logged in as Admin and execute the 7 SQL statements below to grant the necessary roles for the user created in Lab 1 and be sure the correct user name is referenced in SQL.
 
    Paste the PL/SQL:

    ```text
        <copy>
            GRANT CREATE ANY MINING MODEL TO <USERNAME HERE>;
            GRANT SELECT ANY MINING MODEL TO <USERNAME HERE>;
            GRANT CREATE ANY DIRECTORY TO <USERNAME HERE>;
            GRANT DROP ANY DIRECTORY TO <USERNAME HERE>;
            GRANT EXECUTE ON DBMS_CLOUD TO <USERNAME HERE>;
            GRANT EXECUTE ON DBMS_CLOUD_PIPELINE TO <USERNAME HERE>;
            GRANT EXECUTE ON DBMS_CLOUD_AI TO <USERNAME HERE>;
        </copy>
    ```

3. Sign out of SQL Developer and sign back in as the graph user (use created in Lab 1)

4. Execute the SQL below to create a directory, download an onnx embedding model, load in the schema and download text sample data
  
    Paste the PL/SQL:
    
      ```text
      <copy>
            /**Create directory to hold onnx model and text later on**/
            CREATE OR REPLACE DIRECTORY GRAPHDIR as 'scratch/';

            BEGIN
            /** download onnx model from object storage bucket**/    
            DBMS_CLOUD.GET_OBJECT(
            object_uri => 'https://objectstorage.us-chicago-1.oraclecloud.com/n/idb6enfdcxbl/b/Livelabs/o/onnx-embedding-models/tinybert.onnx',
            directory_name => 'GRAPHDIR');

            /** load onnx model into schema**/    
            DBMS_VECTOR.LOAD_ONNX_MODEL(
                'GRAPHDIR',
                'tinybert.onnx',
                'TINYBERT_MODEL',
                json('{"function":"embedding","embeddingOutput":"embedding","input":{"input":["DATA"]}}')
              );

            /** load sample data **/
            DBMS_CLOUD.GET_OBJECT(
            object_uri => 'https://objectstorage.us-chicago-1.oraclecloud.com/n/idb6enfdcxbl/b/Livelabs/o/sample-data/blue.txt',
            directory_name => 'GRAPHDIR');
     
            END;
            /
    </copy>
    ```

  5. Optional, run SQL query to make sure the appropriate files exist (tinybert.onnx, blue.txt)

        Paste the PL/SQL:
    
      ```text
      <copy>
        SELECT * FROM DBMS_CLOUD.LIST_FILES('GRAPHDIR');
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
