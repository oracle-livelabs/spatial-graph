# Start JupyterLab


## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Task 1: ... 
   
1. Expand Cloud Shell.
    ![Expand Cloud Shell](images/start-jupyter-01.png) 

2. Create SSH connection to your compute instance.
    ![Expand Cloud Shell](images/start-jupyter-02.png) 

3. Your compute instance has a virtual environment with Python libraries loaded. Activate the virtual environment with the following command.

      ```
      <copy>
       source my-virtual-env/bin/activate
      </copy>
      ```

      ![Expand Cloud Shell](images/start-jupyter-03.png) 


4. Start JupyterLab with the following command.

      ```
      <copy>
       jupyter-lab --ip=0.0.0.0 --port=8001 --no-browser
      </copy>
      ```
    ![Start JupyterLab](images/start-jupyter-04.png) 

5. Observe the JupyterLab URL including authentication token. Copy this URL and paste into a text editor.
    ![Start JupyterLab](images/start-jupyter-05.png) 


6. In Cloud Shell, scroll up to your SSH command and copy your compute IP address. Then paste it into the URL in your text editor, replacing 127.0.0. 
    ![Start JupyterLab](images/start-jupyter-06.png) 

7. Open a new browser tab. Then copy the URL from your text editor and paste into the new tab and run. This will open JupyterLab where you will be creating and running Python notebooks in the following Labs.
    ![Start JupyterLab](images/start-jupyter-07.png) 