# Workshop Details

Estimated Time: 60 minutes

## Short Description

Build an Oracle Database assistant that extracts F1 rule facts from PDFs, represents them as ontology-aligned RDF, retrieves relevant graph entities with vectors, and answers questions from grounded graph facts.

## Long Description

This 60-minute workshop demonstrates one end-to-end converged database pattern. Learners load and chunk Formula 1 documents, use generative AI to extract structured facts, and retain source-document provenance for every triple. They then load RDF-formatted triples into a semantic graph and explore the graph with SPARQL.

The workshop adds AI Vector Search by creating vector embeddings for entity-focused RDF fact cards. One PL/SQL function uses vectors to choose graph entities, expands those entities to connected RDF triples, provides the F1 ontology as schema context, and asks a chat model to return an evidence-grounded answer.

## Workshop Outline

1. Introduction
2. Lab 1 - Ingest and Chunk Formula 1 Documents
3. Lab 2 - Extract Ontology-Aligned RDF Facts
4. Lab 3 - Load and Explore the RDF Graph
5. Lab 4 - Vectorize Graph Entities
6. Lab 5 - Ask Ontology-Grounded Questions

## Workshop Prerequisites

- Oracle AI Database with AI Vector Search, RDF Semantic Graph, and Select AI privileges.
- Two F1 PDF documents available through read-only PAR URLs.
- A chat AI profile and a separate embedding-capable AI profile.
- Permission to create tables and load data into the target RDF model and semantic network.

## Notes

- Use the same embedding model for stored entity cards and user questions.
- Replace placeholder namespace, graph, network, profile, and PAR URL values before running the workshop.

## Acknowledgements

* **Last Updated** - August 4, 2026
