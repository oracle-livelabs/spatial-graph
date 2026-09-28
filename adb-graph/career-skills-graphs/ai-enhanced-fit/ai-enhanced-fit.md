# Add Semantic Similarity and AI Explanations

## Introduction

Graph traversal follows explicit relationships. Vector search adds a second signal when two skills use different words. An AI profile can explain the evidence and name a gap.

This lab uses Database Actions. FreeSQL does not generate the embeddings or call the configured AI provider required here.

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Compare a profile vector with skill vectors using cosine distance.
- Check the AI profile available to `GHC_DEV`.
- Request an evidence-based explanation for one candidate role.

## Task 1: Compare semantically related skills

1. Open [ai-fit-query.sql](files/ai-fit-query.sql) in Database Actions and run the first query. It uses small illustrative vectors.

2. Read the results from the smallest distance to the largest. A smaller cosine distance means a closer match in this example.

3. Compare the signals:

    - The graph follows explicit relationships.
    - Vector search finds related meaning even when labels differ.
    - A useful recommendation combines both signals with role and position filters.

4. Ask the instructor which table and vector column hold the production embeddings. Then adapt this pattern:

    ```sql
    SELECT skill_name,
           VECTOR_DISTANCE(skill_embedding, :profile_embedding, COSINE) AS distance
    FROM   career_skills
    ORDER BY distance
    FETCH FIRST 5 ROWS ONLY;
    ```

## Task 2: Check the AI profile

1. Run the profile query in [ai-fit-query.sql](files/ai-fit-query.sql). Confirm that `GHC_CAREER_AI` is enabled for the workshop.

2. If the profile is missing, finish with the graph and vector results. Ask the instructor to configure the credential, profile, and outbound access. Do not paste a personal API key into the worksheet.

3. Use `DBMS_CLOUD_AI.GENERATE` for the programmatic call. The SQL command-line `SELECT AI` form is not the path for Database Actions or APEX.

## Task 3: Explain one role with evidence

1. Copy the role from Lab 2 and the top related skills from Task 1. Replace the sample text in [ai-fit-query.sql](files/ai-fit-query.sql), then run the explanation example.

2. Check for three parts:

    - Two evidence-based reasons for fit.
    - Two skills to strengthen.
    - One concrete next action.

3. Compare the answer with the graph. Treat the explanation as interpretation, not proof. Keep the graph paths and vector distances visible.

4. Write down one role to investigate, one skill to strengthen, and one data point you still need.

## Learn More

- [AI Vector Search in Oracle Database](https://docs.oracle.com/en/database/oracle/oracle-database/26/vecse/overview-ai-vector-search.html)
- [Use Retrieval-Augmented Generation and Vectors](https://docs.oracle.com/en/database/oracle/oracle-database/26/selai/use-retrieval-augmented-generation-and-vectors.html)
- [Manage AI Profiles](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/select-ai-manage-profiles.html)

## Acknowledgements

* **Oracle documentation** - [Use Retrieval-Augmented Generation and Vectors](https://docs.oracle.com/en/database/oracle/oracle-database/26/selai/use-retrieval-augmented-generation-and-vectors.html).
* **Last Updated By/Date** - September 23, 2026
