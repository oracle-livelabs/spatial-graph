# Create compute instance from custom image


## Introduction

A compute image has been pre-created with Python configured. In this lab you create an compute instance from that image. 

Estimated Lab Time: xx minutes

### Objectives

* Create a compute instance from a custom image with Python pre-configured.

### Prerequisites

* Completion of the previous lab (Create SSH Keys in Cloud Shell)

## Task 1: Create compute instance

1. Navigate to Compute > Instances
   ![Compute instances](images/compute-01.png) 

2. Click **Create Instance**
   ![Create instances](images/compute-02.png) 

3. Enter a name such as **my-compute**, or you may leave the default. Select a compartment if you have created one, or leave the default (root). Then in the placement section click **Edit**.
   ![Create instances](images/compute-03.png) 

4. If you plan to use Always Free resources, then select the availability domain that offers the **VM.Standard.E2.1.Micro** shape.
   ![Create instances](images/compute-04.png) 

5. Scroll down to the **Image and shape** section and click **Edit**.
   ![Create instances](images/compute-05.png) 

6. Click **Change image**.
   ![Create instances](images/compute-06.png) 

7. Select **My images** and **Image OCID**
   ![Create instances](images/compute-07.png) 

8. Copy the OCID below and paste into the Image OCID field and click **Select image**.

      ```
      <copy>
       ocid1.image.oc1..aaaaaaaan727cclmzfl2evanaacnganaeobmv6hvakjzqdsk4gncmcklcxha
      </copy>
      ```

      ![Create instances](images/compute-08.png) 

8. Scroll down to the Networking section and click **Edit**.
   ![Create instances](images/compute-09.png) 

9. if you have an existing network you may use it. Otherwise select **Create new virtual cloud network**. For names enter **my-vcn** and **my-subnet**, or you may leave the defaults. Select a compartment if you have created one, or leave the default (root). Under Public IPv4 address, Confirm that that **Assign a public IPv4 address** is selected.
   ![Create instances](images/compute-10.png) 

10. Scroll down to the **Add SSH keys section**, select **Paste public key**, and then click **Restore** to expand your Cloud Shell.
   ![Create instances](images/compute-11.png) 


11. The last command you ran in Cloud Shell printed your public key. Copy your public key from Cloud Shell and paste into the SSH keys field in the Create compute instance dialog. Then collapse the Cloud Shell.
    ![Create instances](images/compute-12.png) 

12. Click **Create**.
    ![Create instances](images/compute-13.png) 


13. When provisioning is complete, copy the compute instance's public IP address and restore Cloud Shell.
    ![Create instances](images/compute-14.png) 

14. Enter the following command in Cloud Shell to connect to your compute instance, where you may paste in "[IP address]" which was copied in the previous step. 

      ```
      <copy>
       ssh -i ~/.ssh/my-ssh-key opc@[IP address]
      </copy>
      ```
      When prompted to add to the list of known hosts, reply with **yes**.
    ![Create instances](images/compute-15.png) 

Your compute instance is created and you have verified SSH access.

## Task 2: Open network port 8001

1. From the main navigation panel, select **Networking**. Then select **Virtual cloud networks**.
    ![Create instances](images/compute-16.png) 

2. Click on the VCN created in the previous task.
    ![Create instances](images/compute-17.png) 

3. Scroll down and click on **Security lists** on the left, then click on **Default Security List for my-vcn**.
    ![Create instances](images/compute-18.png) 

4. Click on **Add Ingress Rules**.
 ![Create instances](images/compute-19.png) 

5. For Source CIDR, enter **0.0.0.0/0**. For Destination Port Range enter **8001**. Then click **Add Ingress Rule**.
 ![Create instances](images/compute-20.png) 

6. Scroll down and observe the new Ingress Rule allowing inbound access to port 8001.
 ![Create instances](images/compute-21.png) 


 You may now **proceed to the next lab**.

## Acknowledgements

- **Author** - David Lapp, Database Product Management, Oracle
- **Last Updated By/Date** - David Lapp, Database Product Management, June, 2023
