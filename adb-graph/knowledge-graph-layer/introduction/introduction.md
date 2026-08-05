# Build a Knowledge Graph Layer for an Electronics Store

## Introduction

An electronics store records products, brands, categories, customers, and orders in relational tables. That structure is efficient for transactions, but answering a question across related business concepts can require knowledge of table names, keys, and encoded product types. In this workshop, you add a semantic layer that describes product concepts in an ontology and exposes the relational data as an RDF knowledge graph.

You will work in an Oracle Database environment that has semantic technologies enabled. The workshop uses the `KGLAYER` schema, the `RDF_NETWORK` RDF network, and a small, intentionally simple store dataset.

### Prerequisites

- An account with the semantic technologies privileges listed in [Workshop Details](../WORKSHOP-DETAILS.md).
- A SQL client that can execute SQL, PL/SQL, and `EXECUTE` commands.
- A clean lab schema, or approval to drop and recreate the named RDF graph and view model.

### Objectives

- Create and inspect a relational electronics-store dataset.
- Create an RDF network and an electronics product ontology.
- Map relational tables to RDF resources with R2RML.
- Query ontology and relational graph data with `SEM_MATCH`.

Estimated Workshop Time: 90 Minutes

## Acknowledgements

* **Source** - User-provided Electronics Store knowledge-graph script. Built with permission from the author(s).
* **Last Updated By/Date** - Codex / August 2026
