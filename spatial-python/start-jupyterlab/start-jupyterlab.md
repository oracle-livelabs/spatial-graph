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

5. Observe the JupyterLab URL including authentication token. Copy this URL and paste to browser.

6. In the URL, replace localhost with your compute instance IP address and enter. 

7. 