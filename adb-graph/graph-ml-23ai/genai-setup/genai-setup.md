<!--
    {
        "name":"GenAI Setup to integrate with Graph Studio",
        "description":"Prerequisites for this workshop."
    }
-->

# GenAI Setup to integrate with Graph Studio

## Introduction

In this lab, you will set up the GenerativeAI service in OCI to work with Graph Studio.

Estimated Time: 10 minutes.

### Objectives

Learn how to

- Access SQL Worksheet
- Create a DBMS Cloud Credential
- Create a Gen AI profile

### Prerequisites

- The following lab requires access to an OCI account.

## Task 1: Access the Autonomous Database and Open a SQL worksheet

1. Click the **Navigation Menu** in the upper left, navigate to **Oracle Database**, and select **Autonomous Database**.

    ![Navigating to Autonomous Database.](images/navigation-menu.png " ")

2. Select the compartment provided on **View Login Info**, and click on the **Display Name** for the **Autonomous Database**.

    ![Selecting Autonomous Database in the Navigation Menu.](images/select-autonomous-database.png " ")

3. In your Autonomous Database details page, click the **Database Actions** button.

    ![Click Database Actions button.](./images/database-action-sql-v2.png " ")

    Logging in from the OCI service console expects you are the ADMIN user. Log in as ADMIN if you are not automatically logged in.

4. The Database Actions page opens. In the **Development** box, click **SQL**.

    ![Click SQL.](./images/adb-dbactions-click-sql.png " ")

5. The first time you open SQL Worksheet, a series of pop-up informational boxes may appear, providing you a tour that introduces the main features. If not, you may click the Tour button (labeled with binoculars symbol) in the upper right corner. Click **Next** to take a tour through the informational boxes.

    ![SQL Worksheet.](./images/adb-sql-worksheet-opening-tour.png " ")

6. Sign out of the worksheet and log back in. Then, open SQL again and run the analytics as **MOVIESTREAM**.
    
    ![Log out.](./images/log-out-dbactions.png " ")

    login using the following credentials:
    
    **Username:** MOVIESTREAM    
    **Password:** watchS0meMovies#

## Task 2: Setup GenAI Connection

1. Download and unzip the zip file under the GenAI Key lab. This contains the connection information needed for GenAI to be used in the Graph Studio notebook.

    ![Selecting Autonomous Database in the Navigation Menu.](images/genai-key.png " ") 

2. Create a DBMS Cloud Credential to call the Gen AI service from SQL in Graph Studio. You will need this information: 

    ```
    <user> can be found in the text file as 'user'
    <tenancy> can be found in the text file as 'tenancy'
    <private_key> can be found as the contents .pem file that does not have the '_public' extension.
    <fingerprint> can be found in the text file as 'fingerprint' 

    ```

    Copy and paste the following code, and make the necessary changes: 

    ```
    <copy>
    BEGIN
        DBMS_CLOUD.CREATE_CREDENTIAL (
        credential_name => 'GRAPH_OCW_CREDENTIAL',
        user_ocid       => '<user>',
        tenancy_ocid    => '<tenancy>',
        private_key     => '<private_key>',
        fingerprint     => '<fingerprint>'
        );
    END;
    /</copy>
    ```

    Here is an example of how it should look:

    ```
    BEGIN
    DBMS_CLOUD.CREATE_CREDENTIAL (
        credential_name => 'GRAPH_OCW_CREDENTIAL',
        user_ocid       => 'ocid1.user.oc1..aaaaaaaa3k363plccg...ymfnqkplbxv6rb33wygq',
        tenancy_ocid    => 'ocid1.tenancy.oc1..aaaaaaaaj4c...24mb6utvkymyo4xwxyv3gfa',
        private_key     => 'b3BlbnNzaC1rZXktdjEAAAAABG5v...Cb29rLVByby5sb2NhbAE=',
    fingerprint     => '5d:cf:...35:98');
    END;
    /
    ```

    Run the the script using the **Run Statement** button to create the DBMS Cloud Credential. 

    ![Create the DBMS Cloud Credential.](images/dbms-credentials.png " ") 

3. Then, create a Gen AI profile using the default llama model. Copy and run this script using the **Run Script** button. 

    ```
    <copy>begin    

        -- drops the profile if it already exists
        DBMS_CLOUD_AI.drop_profile(profile_name => 'genai', force => true);

        -- Create an AI profile that uses the default LLAMA model on OCI
        dbms_cloud_ai.create_profile(
            profile_name => 'genai',
            attributes =>       
                '{"provider": "oci",
                "credential_name": "GRAPH_OCW_CREDENTIAL",
                "comments":"true",            
                "object_list": [
                    {"owner": "MOVIESTREAM", "name": "MOVIE"},
                    {"owner": "MOVIESTREAM", "name": "CUSTOMER"},
                    {"owner": "MOVIESTREAM", "name": "WATCHED"},
                    {"owner": "MOVIESTREAM", "name": "WATCHED_WITH"}
                ]
                }'
            );

    end;
    /</copy>
    ```
    ![Create a GenAI profile using thte default llama model.](images/genai-profile.png " ") 

    This concludes this lab. **You may now proceed to the next lab.**

## Acknowledgements
* **Author** - Ramu Murakami Gutierrez, Product Management
* **Contributors** -  Melliyal Annamalai, Denise Myrick, Rahul Tasker, and Ramu Murakami Gutierrez Product Management
* **Last Updated By/Date** - Ramu Murakami Gutierrez, Product Manager, July 2024

