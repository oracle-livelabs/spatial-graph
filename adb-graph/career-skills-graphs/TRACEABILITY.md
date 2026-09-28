# Traceability Summary

Estimated Time: 5 minutes

### Objectives

This document records the sources, embedded assets, and approval notes used to build the workshop.

- Identify the source owner and evidence for each workshop area.
- Record asset reuse, attribution, and rights decisions.
- Track open implementation and validation gaps.

## Source Classification

- Oracle-owned/internal sources: Oracle LiveLabs workshop 3978 and Oracle product documentation for Autonomous AI Database, Graph, ORDS/API access, AI Vector Search, and Select AI.
- External/non-Oracle sources: None used.
- User-supplied reference sources: `adb23ai-PropertyGraphs (2).zip` supplied the Terraform/ADB baseline; `livestack_finance (1).zip` supplied the GenAI API-key, wallet, SQLcl, and profile pattern.
- User-supplied presentation source: `GHC - Skills Graph.pptx` supplied the Grace Hopper narrative, LiveLabs access flow, and workshop sequencing. Its embedded images and diagrams were not reused in the workshop files.
- Unclear or mixed-ownership sources: The user-supplied `f100.sql` APEX export, including its embedded Graph Visualization plugin and application assets, was treated as unclear until permission was confirmed.
- Current-build source-owner approval confirmed for external or unclear sources and embedded assets: Yes. The current build request authorizes adaptation of the supplied workshop materials; no embedded presentation assets were reused.
- Attribution or rights review needed: No third-party rights review identified. Retain the supplied export's own ownership review before redistribution outside the authorized Grace Hopper delivery.

## Embedded Asset Review

| Asset | Parent Source | Asset Type | Owner / Source Class | Used As | Approval / Attribution / Rights Notes |
| --- | --- | --- | --- | --- | --- |
| Graph Visualization plugin files embedded in `f100.sql` | User-supplied APEX export | JavaScript/CSS/code | Unclear, permission confirmed | Reused through the copied APEX export | Permission confirmed for this build; no files were extracted or republished. |
| `icons/app-icon-*.png` entries embedded in `f100.sql` | User-supplied APEX export | App icon images | Unclear, permission confirmed | Reused through the copied APEX export | Permission confirmed; no standalone image files were created. |
| Screenshots, diagrams, logos, charts, and copied datasets | No source bundle supplied | Visual/data assets | Not used | None | No learner-facing visual assets were created or copied. |

## Source Traceability

| Workshop Area | Source | Owner / Source Class | Evidence Type | Used As | Approval / Attribution / Rights Notes |
| --- | --- | --- | --- | --- | --- |
| Introduction | Oracle LiveLabs workshop 3978 | Oracle-owned/internal | Graph workflow and terminology | Summarized | Public Oracle source; linked in learner-facing acknowledgements. |
| Lab 1 | `f100.sql` | Unclear, permission confirmed | APEX application metadata and plugin code | Reused/adapted | The export defines application 100, the Career Explorer page, `P2_PROMPT`, the Graph Visualization region, and Oracle APEX Accounts authentication. |
| Lab 1 | Oracle Graph-user and Autonomous AI Database user documentation | Oracle-owned/internal | User creation and capability setup | Adapted into UI steps | Public Oracle documentation; links appear in `Learn More`. |
| Lab 2 | `f100.sql` | Unclear, permission confirmed | APEX page processes, report SQL, and graph callback | Adapted into learner checkpoints | The app calls `CAREER_PROFILE_AGENT_TOOLS.RUN_PROFILE_TASKS`, `CAREER_PROFILE_TASK4_RUNNER.RUN`, and reads `CAREER_PROFILE_TASK_HISTORY`. |
| Lab 2 | Oracle SQL Property Graph reference | Oracle-owned/internal | `GRAPH_TABLE`, `MATCH`, and quantified paths | Adapted query pattern | Public Oracle documentation; the instructor must provide the graph name and labels because the export omits them. |
| Lab 3 | Oracle AI Vector Search and Select AI references | Oracle-owned/internal | `TO_VECTOR`, `VECTOR_DISTANCE`, `DBMS_CLOUD_AI.GENERATE` | Adapted runnable examples | The vector example uses illustrative vectors. The AI call requires the instructor's profile and provider access. |
| Terraform | `adb23ai-PropertyGraphs (2).zip` | User-supplied reference | ADB resource, wallet, SQLcl, and output pattern | Adapted as the infrastructure baseline | Used as implementation reference; no finance-specific data or code was copied. |
| Terraform | `livestack_finance (1).zip` | User-supplied reference | GenAI API key, rendered SQL, and profile setup | Adapted into `terraform/genai.tf` and SQL templates | Used as implementation reference; no finance-specific data or code was copied. |

## Attribution Notes

- The public Oracle LiveLabs and Oracle documentation links are listed in the learner-facing `## Acknowledgements` and `## Learn More` sections.
- The local APEX export is not linked in learner-facing acknowledgements; it is provided as `setup/files/f100.sql` for the authorized workshop build.
- UI labels for REST, GraphQL, Web Access, and the AI package can vary by release. The workshop uses `DBMS_CLOUD_AI` and intentionally does not enable MongoDB API.

## Open Gaps

- The APEX export omits career tables, seed data, property graph DDL, vector embeddings, AI profile/credential, and package bodies. The instructor must supply and test them.
- The export references `CAREER_PROFILE_TASK_HISTORY`, `CAREER_PROFILE_AGENT_TOOLS`, and `CAREER_PROFILE_TASK4_RUNNER`. Support scripts and graph name/labels remain open items.
- The Terraform foundation does not include the career-table DDL, O*NET loader, property-graph DDL, embeddings loader, or `CAREER_PROFILE_*` package sources because they were not present in the supplied bundles. An optional `career_bootstrap_sql` hook is provided.
- Terraform provider initialization was not completed in this environment because registry.terraform.io timed out. HCL formatting passed; run `terraform init` and `terraform validate` in a network-enabled OCI/LiveLabs build environment.
- No Terraform apply was run. SQL execution and APEX launch were not runtime-tested by Terraform. Local markdown, manifest, path, loader, and Terraform formatting QA is complete.

## Acknowledgements

* **Traceability Compiled By** - Codex
* **Last Updated By/Date** - September 23, 2026
