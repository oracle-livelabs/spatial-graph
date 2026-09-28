# Workshop Details

## Short Description

Use a career skills graph to uncover roles connected to what you already know. Add vector similarity and AI explanations to test fit and skill gaps.

Estimated Time: 45 minutes

### Objectives

In this workshop, you will:

- Connect skills, occupations, and open positions with a property graph.
- Compare related skills with Oracle AI Vector Search.
- Use an AI profile to explain role fit and identify a skill gap.

## Long Description

Your job title describes where you work today. It does not show every role your experience can support. This workshop uses Oracle Autonomous AI Database to connect skills, occupations, and open positions.

You will enter a short profile in an APEX Career Explorer, follow one-to-three-hop graph paths, compare related skills with vector search, and ask an AI profile to explain one possible move. You will leave with a graph query, evidence for a candidate role, and one next skill experiment.

## Workshop Outline

1. Introduction: Create or sign in to an Oracle Account, enter LiveLabs, and frame the career question. (5 minutes)
2. Lab 1: Prepare the Career Graph Environment. Verify `GHC_DEV`, import the APEX app, and check the support objects. (10 minutes)
3. Lab 2: Traverse Skills to Discover Roles. Submit a profile, inspect the graph, and read the `GRAPH_TABLE` query. (15 minutes)
4. Lab 3: Add Semantic Similarity and AI Explanations. Compare vectors, check the AI profile, and explain one role. (15 minutes)

## Workshop Prerequisites

- Oracle Autonomous AI Database 26ai with Database Actions and APEX, or the supplied Terraform foundation.
- An enabled APEX workspace and an APEX account for application 100.
- The career tables, property graph, embeddings, and support packages used by the application.
- A configured AI provider credential and profile for the optional explanation task.
- Basic SQL familiarity. No graph experience is required.

## Notes

- Mode: `fastlab`, with publish-ready QA.
- MongoDB API: intentionally disabled; the workshop does not use it.
- The supplied APEX export is copied into `setup/files/f100.sql`.
- The export does not include the career schema, graph DDL, embeddings, or support packages. The instructor must install those objects before the application runs.
- The Terraform directory provides the database foundation and bundled data loaders. It does not include the missing career bootstrap sources.

## Acknowledgements

* **Oracle LiveLabs source** - [Explore Operational Property Graphs in Oracle AI Database](https://livelabs.oracle.com/ords/r/dbpm/livelabs/view-workshop?P0_REDIRECT=Y&wid=3978).
* **Last Updated By/Date** - September 23, 2026
