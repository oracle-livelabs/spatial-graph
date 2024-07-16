# Deploy the Graph Server & Client Marketplace Image

## Introduction

This lab walks you through the steps to deploy and configure the Graph Server and Client kit on a compute instance via an Oracle Cloud Marketplace stack. You will need to provide the SSH key, VCN and Subnet information, and the JDBC URL for the ADB instance during the deployment process.

Estimated time: 7 minutes

### Objectives

- Learn how to deploy the Graph Server and Client OCI Marketplace image.

### Prerequisites

- SSH Keys to use for connecting to a compute instance
- An ADB instance with the downloaded wallet

## Task 1: Create Network for Graph Server

1. Go to Oracle Cloud console > Networking > Virtual Cloud Networks

    ![networking-vcn](https://oracle-livelabs.github.io/common/images/console/networking-vcn.png)

2. Start VCN Wizard > Create VCN with Internet Connectivity > Start VCN Wizard

    - VCN NAME: e.g. **vcn1**
    - The rest of the items: Do not need to be changed

3. You need to open port 7007. Go to Virtual Cloud Networks > vcn1 > public subnet-vcn1 > Default Security List for vcn1 > Add Ingress Rules and create the rule below:

    - Source Type: **CIDR**
    - Source CIDR: **0.0.0.0/0** (This setting is for testing only. Please replace to the IP address of the client machines for actual use.)
    - IP Protocol: **TCP**
    - Source Port Range: **(All)**
    - Destination Port Range: **7007**
    - Description: e.g. **For Graph Server**

    ![ingress-rule](images/ingress-rule.png)

## Task 2: Locate the Graph Server and Client in the Marketplace

The Oracle Cloud Marketplace is an online platform which offers Oracle and partner software as click-to-deploy solutions that are built to extend Oracle Cloud products and services.

Oracle Cloud Marketplace stacks are sets of Terraform templates that provide a fully automated end-to-end solution deployment on the Oracle Cloud Infrastructure.

1. Go to your Cloud Console. Navigate to the **Marketplace** tab and enter "Graph Server and Client" in the search bar. Click on the Oracle Graph Server and Client stack.

    ![marketplace](images/marketplace.png)

2. Review the System Requirements and Usage Instructions. Then select the latest version of the stack. Choose a compartment and click on **Launch Stack**.

    ![launch-stack](images/launch-stack_2.png)

3. **Stack Information**: You do not need to change. Proceed with **Next**.

    ![create-stack](images/create-stack.png)

4. **Configure Variables**: You will need to choose or provide the following:

    - Oracle Graph Server Shape: an always free eligible shape is **VM.Standard.E2.1.Micro**
    - SSH Public Key: This is used when you ssh into the provisioned instance later.

    ![configure-variables-1](images/configure-variables-1.png)

    - Existing Virtual cloud network: The one created above, **vcn1**
    - Existing Subnet: The one created above, **Public Subnet-vcn1**
    - JDBC URL for authentication: **`jdbc:oracle:thin:@adb1_low?TNS_ADMIN=/etc/oracle/graph/wallets`**

    ![configure-variables-2](images/configure-variables-2.png)

    About the JDBC URL above:

    - This is the TNS_ADMIN entry point to the directory on the compute instance created in this process where you **will** upload and unzip the Autonomous Database wallet
    - If you named your Autonomous Database differently, e.g. **adb2** then replace **`@adb1_low`** with **`@adb2_low`** in the JDBC URL
    - The JDBC URL is stored in **/etc/oracle/graph/pgx.conf** which can be updated later if necessary

5. Click **Next** and **Create** to initiate the **Run apply** for the stack. The job takes approximately 2-3 minutes to complete.

    ![rmj-1](images/rmj-1.png)

    Check the job progress in the **Logs** section.

    ![rmj-2](images/rmj-2.png)

    Once the job has successfully completed the status will change from "In Progess" to "Succeeded". If you get **"Shape VM.Standard.E2.1.Micro not found"** error, the selected Availability Domain lacks resources for the compute shape. Please edit the job and change the availability domain and retry. (An always-free compute VM can only be created in your home region. If you have previously created an always-free compute VM then this new VM.Standard.E2.1.Micro instance can only be created in the same availability domain as the previous one.)

    ![rmj-3](images/rmj-3.png)

    ***NOTE:*** *On completion please make a note of **`public_ip`** and **`graphviz_public_url`**, so that you can SSH into the running instance and access the Graph clients later in this lab.*

## Task 3: Download ADB Wallet

1. Go to your Cloud console, under **Oracle Database**, select **Autonomous Transaction Processing**. If you don't see your instance, make sure the **Workload Type** is **Transaction Processing** or **All**.

    ![database-atp](https://oracle-livelabs.github.io/common/images/console/database-atp.png)

2. Click on your Autonomous Database instance. In your Autonomous Database Details page, click **Database Connection**.

    ![wallet-1](images/wallet-1.png)

3. In Database Connection window, select **Instance Wallet** as your Wallet Type, click **Download Wallet**.

    ![wallet-2](images/wallet-2.png)

4. In the Download Wallet dialog, enter a (new) wallet password in the Password fields. This password protects the downloaded client credentials wallet.

    Click **Download** to save the client security credentials zip file.
    ![wallet-3](images/wallet-3.png)

    By default, the filename is: **Wallet_adb1.zip**

Content in this section is adapted from [Download Client Credentials (Wallets)](https://docs.oracle.com/en/cloud/paas/autonomous-data-warehouse-cloud/user/connect-download-wallet.html#GUID-B06202D2-0597-41AA-9481-3B174F75D4B1)

## Task 4: Upload ADB Wallet

In this step, you need the shell tool to run **scp** and **ssh** commands, e.g. Oracle Cloud Shell, Terminal if you are using MAC, or Git Bash if you are using Windows.

Copy the wallet from your local machine to the Graph Server compute instance on OCI.

```sh
<copy>
scp -i <private_key> <Wallet_database_name>.zip opc@<public_ip_for_compute>:/etc/oracle/graph/wallets
</copy>
```

Example:

```sh
<copy>
scp -i key.pem ~/Downloads/Wallet_adb1.zip opc@203.0.113.14:/etc/oracle/graph/wallets
</copy>
```

## Task 5: Unzip ADB Wallet

1. Connect to the compute instance via SSH as **opc** user, using the private key you created earlier.

    ```sh
    <copy>
    ssh -i <private_key> opc@<public_ip_for_compute>
    </copy>
    ```

    Example:

    ```sh
    <copy>
    ssh -i key.pem opc@203.0.113.14
    </copy>
    ```

2. Unzip the ADB wallet to the **/etc/oracle/graph/wallets/** directory and change the group permission.

    ```sh
    <copy>
    cd /etc/oracle/graph/wallets/
    unzip Wallet_adb1.zip
    chgrp oraclegraph *
    </copy>
    ```

3. Optionally, check that you used the right service name in the JDBC URL you entered when configuring the OCI stack.

    ```sh
    <copy>
    cat /etc/oracle/graph/wallets/tnsnames.ora
    </copy>
    ```

    You will see an entry for `adb1_low` similar to:

    ```text
    <copy>
    adb1_low = (description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.region.oraclecloud.com))(connect_data=(service_name=ij1tzxav3wpwnpa_adb1_low.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))
    </copy>
    ```

You may now proceed to the next lab.

## Acknowledgements

- **Author** - Jayant Sharma
- **Contributors** - Arabella Yao, Jenny Tsai
- **Last Updated By/Date** - Karin Patenge, Oracle Database Product Management Spatial and Graph, July 2024
