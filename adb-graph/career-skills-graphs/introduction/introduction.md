# Find Roles Hidden in Your Skills using Graphs

## Introduction

Your job title describes where you work today. It does not show every role your experience can support. This workshop uses a career skills graph to connect skills, occupations, and open positions.

You will use Oracle Autonomous AI Database, Database Actions, and an APEX Career Explorer. You will follow multi-hop paths, compare related skills with vector search, and review an AI explanation.

## Get into LiveLabs

1. Open the [workshop page](https://livelabs.oracle.com/ords/r/dbpm/livelabs/preview-sandbox-instructions?p202_voucher_id=&p202_workshop_id=3978&session=1078126563429).
2. Select **Sign In** or **Create Account**. Verify your email, then return to the workshop page.
3. Select **Start**, choose **Run on LiveLabs Sandbox**, select **Start Workshop Now**, accept the consent prompt, and submit the reservation.
4. When the sandbox becomes available, select **Launch Workshop**, open **View Login Info**, and use **Launch OCI** or the provided Database Actions link.

The sandbox provides the temporary OCI environment. You do not need to create an OCI tenancy before this workshop.

### Prerequisites

- An instructor-provided Oracle Autonomous AI Database 26ai environment with Database Actions, APEX, and the career data.
- Access to the `GHC_USER` database user and the enabled APEX workspace.
- A configured career AI profile for the optional AI call in Lab 3.
- Basic SQL familiarity. No graph experience is required.

### Objectives

In this workshop, you will:

- Verify `GHC_DEV` and import the Career Explorer application.
- Use a one-to-three-hop graph path to find connected roles.
- Compare semantic neighbors with Oracle AI Vector Search.
- Ask an AI profile to explain fit and identify a skill gap.

Estimated Workshop Time: 45 minutes

## Workshop Flow

1. **Lab 1: Prepare the Career Graph Environment** (10 minutes): Verify the user, APEX app, and support objects.
2. **Lab 2: Traverse Skills to Discover Roles** (15 minutes): Submit a profile and inspect the graph query.
3. **Lab 3: Add Semantic Similarity and AI Explanations** (15 minutes): Compare vectors and explain one role.

## Acknowledgements

- **Oracle LiveLabs source** - [Explore Operational Property Graphs in Oracle AI Database](https://livelabs.oracle.com/ords/r/dbpm/livelabs/view-workshop?P0_REDIRECT=Y&wid=3978).
- **Last Updated By/Date** - Denise Myrick, Oracle AI Database Product Management, September 2026
