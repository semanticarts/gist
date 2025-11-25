![gist logo](./gist-logo.png)

# About gist

gist is Semantic Arts' minimalist upper ontology for the enterprise. It is designed to provide the maximum coverage of typical business ontology concepts with the fewest number of primitives and the least amount of ambiguity. The gist ontology defines around 100 classes and about the same number of attributes and relationships and serves as a foundation for building more specialized ontologies.

gist represents the fundamental concepts and relationships that exist across most business use cases and is designed to be domain-independent. This flexibility allows gist to be applied to a wide spectrum of domains and facilitates both interoperability and knowledge integration. We have designed gist for clarity and completeness to cover nearly all the concepts that exist in real-world ontology development.

gist is free and open to the public under the [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) license. You can use it as you see fit for any purpose, as long as you give us attribution. In addition to the conditions of this license, we require that any terms used from gist remain in the gist namespace, and that you do not define your own terms in the gist namespace.

To get gist:

- Download the [latest released version of gist](https://downloads.semanticarts.com/gistCore_Current_Version.zip) or the zip file available on the [GitHub repository releases page](https://github.com/semanticarts/gist/releases).
- Import into Protégé with the link: <https://w3id.org/semanticarts/ontology/gistCore>.
- Clone or download gist from the [GitHub repository](https://github.com/semanticarts/gist/).

For more information on gist and to download previous versions, see the [Semantic Arts website](https://www.semanticarts.com/gist).

## gist Community

We maintain an active gist community forum where developers and users of gist come together to discuss the gist model, implementation best practices, and the evolution of gist. Meetings occur virtually on the first Thursday of every other month, starting in January. Please send email to [GistForum@semanticarts.com](mailto:GistForum@semanticarts.com) if you would like to become involved.

You can also contribute to gist by adding your comments to [issue discussion threads](https://github.com/semanticarts/gist/issues) and submitting new issues and pull requests (see [guidelines for contributions](https://github.com/semanticarts/gist/blob/master/docs/Contributing.md)). You can view [minutes](https://github.com/semanticarts/gist/wiki/gist-Development-Team-Meeting-Notes) from our bi-monthly review sessions to find out what we've been discussing and get a preview of upcoming changes to gist.

## Design Features

Significant design features of gist include:

gist defines a small number of top-level concepts on which everything else is based, both in gist itself and in enterprise or application ontologies that use gist as a foundation. These concepts are not philosophical abstractions with unfamiliar terms such as endurant, perdurant, or qualia; they are everyday concepts with ordinary names such as person, organization, and agreement, whose meanings are just what you would expect. These high-level concepts provide building blocks for defining more specific domain concepts in a gist-based ontology.

gist has extensive and fine-grained disjointness at the highest level in order to help you avoid making certain types of logical errors in your ontologies or data that are based on gist. Because we explicity state, for example, that governmental organizations (such as the US federal government) can’t be intergovernmental organizations (such as the UN), a reasoner will complain of logical inconsistency if something has been typed as both. Without disjointness, such inconsistencies will not be surfaced.

gist uses domain and range specifications sparingly in order to make properties more broadly applicable. To eliminate redundancy and reduce cognitive load, inverse properties are not defined. Subclasses are typically defined using a pattern that specifies how they specialize the superclass.

## Setting up a Local gist Repository

- Clone the [gist GitHub repository](https://github.com/semanticarts/gist.git).
- Run the script `./tools/setup.cmd`.
- To work on gist, refer to the following documents:
  - [Contributing to gist](docs/Contributing.md)
  - [gist Style Guide](docs/gistStyleGuide.md)
  - [Contributor Quick Reference](docs/ContributorQuickReference.md)

## gist Documentation

We provide a number of resources for learning more about gist.

### The gist Periodic Table

The gist periodic table is a graphical representation of gist coverage organized into abstract conceptual clusters.

### The gist-doc Repository

Extensive documentation of gist is available in the [gist-doc repository](https://github.com/semanticarts/gist-doc). This repository contains documentation of the [Semantic Arts gist minimalist upper ontology](https://github.com/semanticarts/gist/tree/master) in three formats: narrative, graphical, and Widoco-style.

- **gist Constellations (eBook)**
  - The organization of the eBook is based around the idea of 'constellations' of classes and predicates that deal with related concepts.
  - epub and mobi formats
- **gist Constellations (visualizations)**
  - A collection of PNG images built using the [Turtle Editor Viewer](http://semantechs.co.uk/turtle-editor-viewer/).  Each image is made up of a single 'constellation' of classes as described above and shows the classes and their relationships, the literal annotations, and any anonymous classes used in class definitions.
- **[Widoco](https://github.com/dgarijo/Widoco) documentation**

### Additional Documentation

- **Videos:** We maintain a library of videos containing gist tutorials and recordings of our monthly gist Council meetings. You can find links to these videos on the [Semantic Arts website](https://www.semanticarts.com/gist/videos/), or directly access the entire catalog on [our YouTube channel](https://www.youtube.com/playlist?list=PLk2kJrehubb4dc3e5Db5Lvv9WMaOhV3V7).
- The [Semantic Arts gist web page](https://www.semanticarts.com/gist/).
