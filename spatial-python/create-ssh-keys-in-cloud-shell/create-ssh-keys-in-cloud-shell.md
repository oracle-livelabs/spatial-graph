# Create SSH keys in Cloud Shell


## Introduction

...

Estimated Lab Time: xx minutes

### Objectives

* 

### Prerequisites

* 

## Task 1: ... 
   
1. Open cloud shell
  ![Open Cloud Shell](images/sshkeys-01.png)

2.  When prompted to run tutorial, type N and enter.
    ![Open Cloud Shell](images/sshkeys-02.png)
   
3. At the command line, run each of following to create your SSK keys.
   
     ```
    <copy>
     mkdir ~/.ssh
    </copy>
    ```
         ```
    <copy>
    cd ~/.ssh
    </copy>
    ```

    ```
    <copy>
    ssh-keygen -b 2048 -t rsa -f my-ssh-key
    </copy>
    ```
    When prompted for passphrase, you may click enter for no passphrase and repeat to confirm.  
  ![Create keys](images/sshkeys-03.png)

4. At the command line, run the following to view your public key. You will use this in a subsequent step.

     ```
    <copy>
     cat ~/.ssh/my-ssh-key.pub
    </copy>
    ```
   ![View public key](images/sshkeys-04.png)

5. Click the collapse icon to minimize Cloud Shell.

   ![Collapse Cloud Shell](images/sshkeys-05.png)

6. Observe the Restore button to reopen Cloud Shell. You will reopen Cloud Shell in a subsequent step

   ![Restore Cloud Shell](images/sshkeys-06.png)