# Ask Generative AI for a movie recommendation

## Introduction

In this lab, you will use the Generative AI service in OCI to ask for recommendations of adventure movies released in the past 2 years.

Estimated Time: 15 minutes.

### Objectives

Learn how to

- use OCI Generative AI.

### Prerequisites

- The following lab requires access to an OCI account.

## Task 1: Access the OCI Generative AI service

1. Click the **Navigation Menu** in the upper left, navigate to **Analytics and AI**, and select **Generative AI**.

    ![Navigating to Generative AI.](images/access-genai.png " ")

2. A welcome message will pop up in the screen.  You can start introduction or exit. Click on **Go to playground**.

    ![Go to Generative AI playground.](images/go-to-playground.png " ")

## Task 2: Ask Generative AI for a movie recommendation

1. There's 3 models to choose from. Select **meta.llama-3-70b-instruct**.

    ![Select Llama model.](images/select-llama.png " ")

    Read and accept the terms in the Llama 3 License Agreement and Acceptable Use Policy and click Submit.

    ![Accept the terms in the llama license agreement.](images/accept-terms.png " ")

2. Ask Generative AI to recommend an adventure movie released in the past 2 years. Copy the following question and **Submit** it.

     ```
     <copy>What are the top 10 adventure movies released in the past 2 years?</copy>
     ```

    ![Submit question to Generative AI.](images/submit-question.png " ")  

    The Generative AI model returns a list of adventure movies released between 2020-2022.
    
    ![List movies recommended.](images/list-of-movies.png " ")  

    As we can see in here, the LLM is not trained for movies released this year. Since we are looking to recommend an adventure movie released this year, we will rely on our database to identify the right movie to watch in our watch party.

    This concludes this lab. **You may now proceed to the next lab.**

## Acknowledgements
* **Author** - Ramu Murakami Gutierrez, Product Management
* **Contributors** -  Melliyal Annamalai, Denise Myrick, Rahul Tasker, and Ramu Murakami Gutierrez Product Management
* **Last Updated By/Date** - Ramu Murakami Gutierrez, Product Manager, July 2024

