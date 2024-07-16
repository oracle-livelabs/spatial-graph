# Import notebooks

## Introduction

The Oracle Machine Learning User Interface (OML UI) is the entry point for OML, with links to OML features and artifacts. A central feature of OML is OML Notebooks, an Apache Zeppelin-based web interface for machine learning workflows using any combination of Markdown, Python, SQL, and R. In this lab you log into the OML UI, create a simple notebook, and import a set of pre-built Python notebooks used for the remainder of this workshop.

Estimated Lab Time: 5 minutes

### Objectives

* Log into OML UI
* Get familiar with OML Notebooks
* Load pre-built notebooks

### Prerequisites

* Access to the OML UI

## Task 1: Log into OML UI

1. Clink View Login Info to access your reservation information. 

   ![View login info](images/view-login-info.png)

2. Note the database user and password at the bottom. Then click the link for the OML UI. 

  ![Reservation info](images/reservation-information.png)

3. Sign into the OML UI using the database user and password in your reservation information.

  ![OML UI sign in](images/omluser-signin.png)

## Task 2: Work with OML Notebooks

1. From OML user interface home page, click the link for Notebooks. 

  ![OML UI sign in](images/oml-homepage.png)

2. Click the **Create** link to create a new notebook.

     ![Create notebook](images/create-notebook-a.png)

   When prompted, enter the name **Testing** and click OK.

      ![Create notebook](images/create-notebook-b.png)

3. Hover your mouse above or below the empty paragraph to display buttons for creating a new paragraph. Click on the markdown icon to add a markdown paragraph.

      ![Markdown paragraph](images/md-paragraph-a.png)

4. In the markdown paragraph add a new line and enter 
   
      ```
       <copy>
         ##### Hello World!
       </copy>
      ```
   
   Then click the play button to run the paragraph.

      ![Markdown paragraph](images/md-paragraph-b.png)    

5. Hover your mouse below the markdown paragraph to display buttons for creating a new paragraph. Click on the Python icon to add a Python paragraph.

      ![Markdown paragraph](images/py-paragraph-a.png)

6. In the Python paragraph add a new line and enter 
   
      ```
      <copy>
      import oml
      oml.isconnected()
      </copy>
      ``` 

  Then click the play button to run the paragraph.

     ![Markdown paragraph](images/py-paragraph-b.png)

1. Hover your mouse below the Python paragraph to display buttons for creating a new paragraph. Click on the SQL icon to add a SQL paragraph.

      ![Markdown paragraph](images/sql-paragraph-a.png)

2. In the SQL paragraph, enter 
   
      ```
       <copy>
         select count(*) from user_objects;
       </copy>
      ``` 

  Then click the play button to run the paragraph.

       ![Markdown paragraph](images/sql-paragraph-b.png)

1. You can clear all results and run all paragraphs using the erasure and play buttons in the top button bars.

       ![Markdown paragraph](images/clear-run-all-paragraphs.png)

2. To navigate back to the Notebooks page, Click the icon to open the main navigation panel and then click **Notebooks**.

       ![Markdown paragraph](images/nav-to-notebooks.png)


3. You can now delete the test notebook. Select the notebook with the checkbox and click **Delete**.

       ![Markdown paragraph](images/del-test-notebook-a.png)

  When prompted click OK.

       ![Markdown paragraph](images/del-test-notebook-b.png)


## Task 2: Download pre-built notebooks

1. Download zip file containing pre-built notebooks [**here**](files/notebooks.zip)

   ...pic...

2. Unzip the file

    ...pic...

## Task 3: Import pre-built notebooks

1. Click Import and select all the notebooks unzipped in the previous step.
    
    ...pic...

2. Click Open to import the notebooks
    
    ...pic...

3. Verify all notebooks are imported.
    
    ...pic...


## Task 4: Review OML Notebook toolbar options

1. Opening a notebook in edit mode provides the following toolbar options:

	![OML Notebook toolbar options](images/data-studio-notebook-icons.png)

    You will work with notebooks for the remainder of this workshop, so refer back to this diagram as needed.

## Learn More

* ...

## Acknowledgements

* **Author** - David Lapp, Product Manager
* **Last Updated By/Date**  - David Lapp, June 2024
