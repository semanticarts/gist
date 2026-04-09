![gist logo](./gist-logo.png)

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Latest Release](https://img.shields.io/github/v/release/semanticarts/gist)](https://github.com/semanticarts/gist/releases)

# About gist

gist is Semantic Arts' minimalist upper ontology for the enterprise. It is designed to provide the maximum coverage of typical business ontology concepts with the fewest number of primitives and the least amount of ambiguity. The gist ontology defines around 100 classes and about the same number of attributes and relationships and serves as a foundation for building more specialized ontologies.

gist represents the fundamental concepts and relationships that exist across most business use cases and is designed to be domain-independent. This flexibility allows gist to be applied to a wide spectrum of domains and facilitates both interoperability and knowledge integration. We have designed gist for clarity and completeness to cover nearly all the concepts that exist in real-world ontology development.

gist is free and open to the public under the [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) license. You can use it as you see fit for any purpose, as long as you give us attribution. In addition to the conditions of this license, we require that any terms used from gist remain in the gist namespace, and that you do not define your own terms in the gist namespace.

gist is an [OWL 2 DL](https://www.w3.org/TR/owl2-overview/) ontology serialized in [Turtle](https://www.w3.org/TR/turtle/) (.ttl) format. The released version also includes RDF/XML and JSON-LD serializations.

For a visual overview of gist's coverage, see [The Periodic Table of gist](https://www.semanticarts.com/gist/).

## gist Community

We maintain an active gist community forum where developers and users of gist come together to discuss the gist model, implementation best practices, and the evolution of gist. Meetings occur virtually on the first Thursdays of January, March, May, July, September, and November. Please send email to [community@semanticarts.com](mailto:community@semanticarts.com) if you would like to become involved.

You can also contribute to gist by adding your comments to [issue discussion threads](https://github.com/semanticarts/gist/issues) and submitting new issues and pull requests (see [guidelines for contributions](https://github.com/semanticarts/gist/blob/master/docs/Contributing.md)). You can view [minutes](https://github.com/semanticarts/gist/wiki/gist-Development-Team-Meeting-Notes) from our bi-monthly review sessions to find out what we've been discussing and get a preview of upcoming changes to gist.

## Design Features

Significant design features of gist include:

gist defines a small number of top-level concepts on which everything else is based, both in gist itself and in enterprise or application ontologies that use gist as a foundation. These concepts are not philosophical abstractions with unfamiliar terms such as endurant, perdurant, or qualia; they are everyday concepts with ordinary names such as person, organization, and agreement, whose meanings are just what you would expect. These high-level concepts provide building blocks for defining more specific domain concepts in a gist-based ontology.

gist has extensive and fine-grained disjointness at the highest level in order to help you avoid making certain types of logical errors in your ontologies or data that are based on gist. Because we explicitly state, for example, that governmental organizations (such as the US federal government) can’t be intergovernmental organizations (such as the UN), a reasoner will complain of logical inconsistency if something has been typed as both. Without disjointness, such inconsistencies will not be surfaced.

gist uses domain and range specifications sparingly in order to make properties more broadly applicable. To eliminate redundancy and reduce cognitive load, inverse properties are not defined. Subclasses are typically defined using a pattern that specifies how they specialize the superclass.

gist uses namespaces in the w3id.org domain so that its term IRIs remain stable and persistent independent of any particular website or hosting arrangement.

## Getting gist

- Download the [latest released version of gist](https://downloads.semanticarts.com/gistCore_Current_Version.zip) or the zip file available on the [GitHub repository releases page](https://github.com/semanticarts/gist/releases); or
- Import into Protégé with the link: <https://w3id.org/semanticarts/ontology/gistCore>.

## The Periodic Table of gist

[The Periodic Table of gist](https://www.semanticarts.com/gist/) is a graphical representation of gist coverage organized into abstract conceptual clusters.

## Namespaces

gist uses three namespaces:

| Namespace | IRI | Prefix |
| --- | --- | --- |
| Ontology | `https://w3id.org/semanticarts/ns/ontology/gist/` | `gist:` |
| Taxonomy | `https://w3id.org/semanticarts/ns/taxonomy/gist/` | `gistx:` |
| Instance data | `https://w3id.org/semanticarts/ns/data/gist/` | `gistd:` |

## Modules

Bundled releases include the following modules:

| Module | Description |
| --- | --- |
| `gistCore` | The main ontology, containing all classes, properties, and restrictions |
| `gistMediaTypes` | Defines instances for common internet media types |
| `gistPrefixDeclarations` | Prefix declarations for use in SPARQL queries |
| `gistValidationAnnotations` | Annotations used by SHACL validation shapes |
| `gistRdfsAnnotations` | `rdfs:label` and `rdfs:comment` annotations generated for backward compatibility with tools that rely on RDFS |
| `gistSubClassAssertions` | Materialized subclass inferences for use in environments without a reasoner |

In a release bundle, each module file name includes the version number (e.g., `gistCore14.1.0.ttl`). Modules are provided in three serializations: Turtle (.ttl), RDF/XML (.rdf), and JSON-LD (.jsonld).

## Versioning and Migration

gist follows [Semantic Versioning](https://semver.org/), adapted for ontology development. Version numbers are of the form `Major.Minor.Patch`:

- **Major** — Non-backward-compatible, breaking changes (approximately annual releases)
- **Minor** — New, backward-compatible functionality such as new classes or properties (1-2 per major release)
- **Patch** — Bug fixes, documentation, and infrastructure changes

A minor or patch upgrade should require only updating the version number in your import statement.

For major version upgrades, migration guides with SPARQL queries are provided in the [`migration/`](migration/) directory. See also [Major Version Migration](docs/MajorVersionMigration.md) for guidance on the upgrade process.

For full details, see [Change and Release Management](docs/ChangeAndReleaseManagement.md) and [Release Notes](docs/ReleaseNotes.md).

## gist Documentation

We provide a number of resources for learning more about gist.

### The gist-doc Repository

Extensive documentation of gist is available in the [gist-doc repository](https://github.com/semanticarts/gist-doc). This repository contains documentation of the [Semantic Arts gist minimalist upper ontology](https://github.com/semanticarts/gist/tree/master) in three formats: narrative, graphical, and Widoco-style.

- **gist Constellations (eBook)**
  - The organization of the eBook is based around the idea of 'constellations' of classes and predicates that deal with related concepts.
  - epub and mobi formats
- **gist Constellations (visualizations)**
  - A collection of PNG images built using the [Turtle Editor Viewer](http://semantechs.co.uk/turtle-editor-viewer/).  Each image is made up of a single 'constellation' of classes as described above and shows the classes and their relationships, the literal annotations, and any anonymous classes used in class definitions.
- **WIDOCO documentation**
  - The gist documentation produced using the [WIDOCO](https://github.com/dgarijo/Widoco) tool is a compact, easily-searched presentation of gist in HTML format.

### Additional Documentation

- **Videos:** We maintain a library of videos containing gist tutorials and recordings of our monthly gist Council meetings. You can find links to these videos on the [Semantic Arts website](https://www.semanticarts.com/gist/videos/), or directly access the entire catalog on [our YouTube channel](https://www.youtube.com/playlist?list=PLk2kJrehubb4dc3e5Db5Lvv9WMaOhV3V7).
- The [Semantic Arts gist web page](https://www.semanticarts.com/gist/).
- [Deprecation and Deletion Policy](docs/DeprecationAndDeletionPolicy.md)
- [A Brief Introduction to the gist Semantic Model](https://www.semanticarts.com/a-brief-introduction-to-the-gist-semantic-model/) (2020 blog post)
- [Introduction to Gist](https://iaoa.org/isc2014/uploads/Whitepaper-Uschold-IntroductionToGist.pdf) (2013 IAOA whitepaper by Michael Uschold & Dave McComb, PDF)

## Frequently-Asked Questions

**What does "gist" stand for?**

gist is not an acronym. It is the common English word meaning "the essence or general meaning of something," reflecting the ontology's goal of capturing the essential concepts of the enterprise.

**How does gist compare to other upper ontologies?**

Unlike ontologies such as BFO, SUMO, or DOLCE, gist is deliberately minimalist and uses everyday language rather than philosophical abstractions. This makes it more accessible and practical for enterprise use.

**Can I extend gist?**

Yes. gist is designed as a foundation for building domain-specific ontologies. Define your extensions in your own namespace; gist terms must remain in the gist namespace.

## Citing gist

If you use gist in academic work or publications, please cite it as follows:

> Semantic Arts, Inc. *gist: A Minimalist Upper Ontology for the Enterprise.* Available at: <https://github.com/semanticarts/gist>

## Contributing to gist Development

If you plan to contribute to gist development, please refer to the following documents:

- [Contributor Quick Reference](docs/ContributorQuickReference.md)
- [Contributing to gist](docs/Contributing.md)
- [Reviewer Guidelines](docs/ReviewerGuidelines.md)
- [gist Style Guide](docs/gistStyleGuide.md)

### Prerequisites and Technology

To work with gist, you can use an OWL-compatible tool such as [Protégé](https://protege.stanford.edu/), or edit the Turtle files directly in a text editor or IDE such as [VSCode](https://code.visualstudio.com/) (with a Turtle language extension for syntax highlighting).

Contributors building and validating gist locally will need:

- **Python** 3.10+
- **Java** 11+ (required by the RDF serializer)
- **[onto-tool](https://pypi.org/project/onto-tool/)** >= 1.8.0

The repository includes a pre-commit hook that runs the RDF serializer on all commits to enforce a consistent Turtle format. This is installed automatically by `./tools/setup.cmd`.

### Setting up a Local gist Repository

- Clone the [gist GitHub repository](https://github.com/semanticarts/gist.git).
- Run the script `./tools/setup.cmd`.

### Repository Structure

| Path | Description |
| --- | --- |
| `ontologies/` | Core ontology files in Turtle format (`gistCore.ttl`, `gistMediaTypes.ttl`, `gistPrefixDeclarations.ttl`, `gistValidationAnnotations.ttl`) |
| `validation/` | SHACL shapes and SPARQL queries used to validate the ontology |
| `migration/` | SPARQL queries and documentation for upgrading between major versions of gist |
| `tools/` | Build and development tooling, including the RDF serializer and pre-commit hooks |
| `docs/` | Contributing guidelines, style guide, release notes, and other documentation |
| `bundle.yaml` | Build configuration for [onto-tool](https://pypi.org/project/onto-tool/), which produces multi-format release artifacts |

### Build and Validation

The gist build pipeline is defined in [`bundle.yaml`](bundle.yaml) and run using [onto-tool](https://pypi.org/project/onto-tool/). The build validates the ontology, generates additional modules (`gistRdfsAnnotations` and `gistSubClassAssertions`), serializes all modules in multiple formats, and packages the result into a versioned release bundle.

To run the build locally:

```bash
onto_tool bundle bundle.yaml
```

Validation includes [SHACL](https://www.w3.org/TR/shacl/) shape checking (defined in [`validation/shapes/`](validation/shapes/)) and [SPARQL](https://www.w3.org/TR/sparql11-query/) construct queries (in [`validation/queries/`](validation/queries/)).

## Acknowledgments

gist is developed and maintained by [Semantic Arts](https://www.semanticarts.com/) with contributions from the gist community. See the [full list of contributors](https://github.com/semanticarts/gist/graphs/contributors).
