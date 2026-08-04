# Build an Ontology-Grounded Vector and RDF F1 Assistant

## Introduction

Formula 1 technical rules are rich in relationships: a system can replace another system, a feature can have a measurement, and two terms can be aliases. In this workshop, you will turn two F1 PDF documents into an ontology-aligned RDF graph, add vector retrieval over graph entities, and ask grounded questions in natural language.

The demo deliberately combines relational storage, AI extraction, RDF graph technology, vector search, and generative AI in one Oracle Database workflow. A single question-answering function uses vectors to identify a graph neighbourhood. RDF facts and the ontology provide the evidence and meaning used to answer the question.

### Prerequisites

- An Oracle AI Database environment with access to `DBMS_CLOUD`, `DBMS_CLOUD_AI`, `DBMS_VECTOR_CHAIN`, AI Vector Search, and RDF Semantic Graph.
- A chat profile named `GENAI_PROFILE` and an embedding-capable profile named `F1_EMBED_PROFILE`. Replace these names if your profiles differ.
- Read-only PAR URLs for two F1 PDF source documents.
- Privileges to create tables, call the listed packages, and load RDF data into the semantic model and network used in your environment.

### Objectives

- Load and chunk two F1 PDF documents.
- Extract RDF triples that use a constrained F1 ontology.
- Load and query an RDF semantic graph.
- Create vector embeddings for RDF entity cards.
- Answer questions using the ontology and the relevant RDF graph facts.

Estimated Workshop Time: 60 minutes

## Acknowledgements

* **Source** - [Oracle AI Vector Search documentation](https://docs.oracle.com/en/database/oracle/oracle-database/26/vecse/ai-vector-search-users-guide.pdf).
* **Source** - [Oracle RDF Graph Developer's Guide](https://docs.oracle.com/en/database/oracle/oracle-database/26/rdfrm/graph-developers-guide-rdf-graph.pdf).
* **Last Updated** - August 4, 2026
