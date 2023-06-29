# Start JupyterLab

## Introduction

Notebooks are interactive documents for code, descriptive text, and visualizations. In this workshop you use open source JupyterLab which provides a web-based notebook environment with many user-friendly features such as file uploading.

Estimated Lab Time: xx minutes

### Objectives

* Start JupyterLab
* Verify access to JupyterLab

### Prerequisites

* Completion of previous lab 

## Task 1: Start JupyterLab 
   
1. Expand Cloud Shell.
    ![Expand Cloud Shell](images/start-jupyter-01.png) 

2. You should still be connected with SSH to your compute instance. If not, then enter the following command to connect to your compute instance. 

<if type="freetier">
      ```
      <copy>
       ssh -i ~/.ssh/my-ssh-key opc@[IP address]
      </copy>
      ```
</if>
<if type="ocw23-sandbox">
      ```
      <copy>
       ssh -i ~/.ssh/ocw23-rsa opc@[IP address]
      </copy>
      ```
</if>

    ![Expand Cloud Shell](images/start-jupyter-02.png) 

3. Your compute instance has a virtual environment with Python libraries loaded. Activate the virtual environment with the following command.

      ```
      <copy>
       source my-virtual-env/bin/activate
      </copy>
      ```

      ![Expand Cloud Shell](images/start-jupyter-03.png) 


4. Enter the following command to start JupyterLab. 

      ```
      <copy>
       jupyter-lab --ip=0.0.0.0 --port=8001 --no-browser
      </copy>
      ```
    ![Start JupyterLab](images/start-jupyter-04.png) 

    The startup process is complete when you see "To access the server ..." followed by a file path and  URL.

## Task 2: Verify access to JupyterLab 

1. Observe the JupyterLab URL including authentication token. Copy this URL and paste into a text editor.
    ![Start JupyterLab](images/start-jupyter-05.png) 


6. In Cloud Shell, scroll up to your SSH command and copy your compute IP address. Then paste it into the URL in your text editor, replacing 127.0.0. 
    ![Start JupyterLab](images/start-jupyter-06.png) 

7. Open a new browser tab. Then copy the URL from your text editor and paste into the new tab and run. This will open JupyterLab where you will be creating and running Python notebooks in the following Labs.
    ![Start JupyterLab](images/start-jupyter-07.png) 

 You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - David Lapp, Database Product Management, Oracle
- **Last Updated By/Date** - David Lapp, Database Product Management, June, 2023