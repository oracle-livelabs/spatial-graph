# Traverse Skills to Discover Roles

## Introduction

Now turn your experience into graph evidence. The Career Explorer submits your profile, returns candidate occupations, and shows the path behind each result.

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Submit a personal or sample skills profile.
- Read the role results and graph visualization.
- Inspect the stored query and its one-to-three-hop pattern.

## Task 1: Submit a skills profile

1. In **Career Explorer**, enter your experience or use this sample:

    ```text
    I build SQL data models and Python data pipelines, create dashboards, work with REST APIs, and explain technical results to business stakeholders. I mentor teammates and turn ambiguous questions into practical solutions.
    ```

2. Select **Explore career options**. Wait for the results to refresh.

3. In **Career Exploration Results**, record one role that interests or surprises you.

## Task 2: Explore the graph result

1. In **Visualization Result**, move the network and select a vertex. Identify the starting skills, intermediate relationships, and target roles.

2. Find an indirect path. A two-hop or three-hop path shows how a skill reaches a role through an intermediate relationship.

3. Select **Career Fit Details**. Note the **Good fit**, **Needs improvement**, and **Suggestions** sections.

## Task 3: Inspect the query behind the visualization

1. Open Database Actions in a second tab as `GHC_DEV`. Open **SQL Worksheet** and run [graph-lab-queries.sql](files/graph-lab-queries.sql).

2. Find the latest successful row for task order 3. Compare its SQL preview with the graph you explored.

3. Review the variable-length pattern below. Replace the graph name, labels, and property names with the values from the instructor-provided graph definition before you execute it.

    ```sql
    SELECT DISTINCT starting_skill, target_role
    FROM GRAPH_TABLE (
      career_skills_graph
      MATCH
        (s IS skill)
          ((x) -[e IS connects_to]-> (y)){1,3}
        (r IS role)
      COLUMNS (
        s.skill_name AS starting_skill,
        r.role_name  AS target_role
      )
    );
    ```

4. Return to APEX and answer: **Which role became visible because the graph followed an intermediate connection?**

## Learn More

- [Graph Pattern in Oracle Database 26ai](https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/graph-pattern.html)
- [Explore Operational Property Graphs in Oracle AI Database](https://livelabs.oracle.com/ords/r/dbpm/livelabs/view-workshop?P0_REDIRECT=Y&wid=3978)

## Acknowledgements

* **Oracle LiveLabs source** - [Explore Operational Property Graphs in Oracle AI Database](https://livelabs.oracle.com/ords/r/dbpm/livelabs/view-workshop?P0_REDIRECT=Y&wid=3978).
* **Last Updated By/Date** - September 23, 2026
