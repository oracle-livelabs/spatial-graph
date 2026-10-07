# Find Roles Hidden in Your Skills using Graphs

## Introduction

Your job title describes where you work today. It does not show every role your experience can support. This workshop uses a career skills graph to connect skills, occupations, and open positions.

You will use Oracle Autonomous AI Database, Database Actions, and an APEX Career Explorer. You will follow multi-hop paths, compare related skills with vector search, and review an AI explanation.

## Get into LiveLabs

1. On this workshop's LiveLabs page, select **Start** and choose **Run on LiveLabs Sandbox**.
2. Select **Start Workshop Now**, accept the consent prompt, and submit the reservation.
3. When the sandbox becomes available, select **Launch Workshop**, open **View Login Info**, and use **Launch OCI** or the provided Database Actions link.

### Prerequisites

- An Oracle Autonomous AI Database 26ai environment with the career tables, property graph, and task packages already provisioned in the `GHC_USER` schema.
- Database Actions access as `GHC_USER`, an enabled APEX workspace, and its APEX runtime account.
- For the optional standalone AI explanation in Lab 3, an enabled `GHC_CAREER_AI` profile and provider access.
- Basic SQL familiarity. No graph experience is required.

The supplied APEX export installs application 100 only. It does not create the career data, graph, or task packages; ask the instructor to provision these before starting. The instructor should also confirm which AI profile the preloaded Career Explorer task packages use.

### Objectives

In this workshop, you will:

- Verify `GHC_USER` access and import the Career Explorer application.
- Use a one-to-three-hop graph path to find connected roles.
- Compare semantic neighbors with Oracle AI Vector Search.
- Ask an AI profile to explain fit and identify a skill gap.

Estimated Workshop Time: 45 minutes

## Workshop Flow

1. **Lab 1: Prepare the Career Graph Environment** (15 minutes): Verify the user, APEX app, and support objects.
2. **Lab 2: Traverse Skills to Discover Roles** (15 minutes): Submit a profile and inspect the graph query.
3. **Lab 3: Add Semantic Similarity and AI Explanations** (15 minutes): Compare vectors and explain one role.

## Acknowledgements

- **Last Updated By/Date** - Denise Myrick, Oracle AI Database Product Management, September 2026
