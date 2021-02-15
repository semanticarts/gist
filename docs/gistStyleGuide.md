gist Style Guide [ IN PROGRESS ]
=====

Purpose of this document
-----

The purpose of this document is two-fold:

- Define and implement conventions in order to standardize gist.
- Articulate what we consider best or "better" practices for ontology design and implementation.

OWL Version
-----

gist uses OWL 2 DL.

Serialization
-----

- gist OWL files are serialized in RDF Turtle
- The [EDM Council's RDF serialization tool, rdf-toolkit.jar,](https://github.com/edmcouncil/rdf-toolkit) should be run before every commit in order to standardize formatting and eliminate noise in git diffs.
- It is recommended to run this as a [pre-commit hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) in your git repository to ensure that it is done every time.
  In order to use the standard settings, copy the provided `pre-commit` script from the `tools/` directory in the repository to `.git/hooks/` after the repository is cloned,
  and ensure that `JAVA_HOME` is set in your environment. This script will only format RDF files, ignoring all others.

Naming
-----

### Local names

#### Classes

- Camelcase with initial uppercase
- Acronyms are also camelcased so that word boundaries are unambiguous.
  - Examples: `AmaGuideline`, not `AMAGuideline`; `UriScheme`, not `URIScheme`
  - `ID` is an exception, because Merriam-Webster spells it in all-caps.
- Alphanumeric characters only.
  - Example: `Isbn10`, not `Isbn-10` or `ISBN-10`.
  
#### Properties

- Camelcase with initial lowercase
- Acronyms as above

#### All

- No non-standard abbreviations. E.g., `hasUoM` should be `hasUnitOfMeasure`.

### Labels

The following conventions apply to `skos:prefLabel`. Application to `skos:altLabel` TBD.

#### Classes

- Title case (see definition of title case below)
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, etc.
  - Examples: _AMA Guideline_, _ISBN-10_
  
#### Properties

- Lower case
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, proper nouns capitalized, etc.
- Examples: _has unit of measure_, _has SSN_, _unit symbol Unicode_

#### gist Definition of Title Case

The rules of title case are not universally standardized; standardization is only at the level of house styles and individual style guides. Most English style guides agree that the first and last words should always be capitalized, while articles, short prepositions, and some conjunctions should not be. Other rules about the capitalization vary.

gist style guide for title case:

- Capitalize:
  - First and last words
  - Words of four or more letters (e.g., _Between_, _With_)
  - Second part of hyphenated word (e.g., _Data-Centric_ not _Data-centric_)
- Lowercase:
  - Articles: *a*, *an*, *the*
  - Conjunctions: *and*, *but*, *if*, *for*, *or*, *nor*, *so*, *yet*
  - Prepositions: *as*, *at*, *by*, *cum*, *ere*, *for*, *in*, *of*, *off*, *on*, *out*, *per*, *pre*, *pro*, *qua*, *re*, *sub*, *to*, *up*, *via*
- Acronyms in all caps (e.g., _SSN_, _ISBN_)
- Capitalize everything else

### Annotations

gist uses SKOS annotations rather than `rdfs:label` and `rdfs:comment`. The accepted annotations, intended use, and previous usage are shown in the following tables. Refer to the [SKOS ontology](http://www.w3.org/2004/02/skos/core) for formal definitions.

*Preferred SKOS annotations*

| Annotation | Use | Instead Of |
| ---------: | --- |:---------|
| `skos:prefLabel` | Preferred label | `rdfs:label` |
| `skos:altLabel`  | Alternative label, where relevant | n/a |
| `skos:definition` | Definition | `rdfs:comment` |
| `skos:scopeNote` | Additional clarifying comments about the meaning or usage of a term | `rdfs:comment` |
| `skos:example`   | One or more examples  | `rdfs:comment` |
| `skos:editorialNote` | Notes for editors | `rdfs:comment` |

*RDFS annotations*

Certain RDFS annotations are recommended where there is no SKOS equivalent.

| Annotation | Use |
| ---------: | --- |
| `rdfs:seeAlso` | Indicates a resource that may provide additional information about the subject. Preferably points to a web page or RDF resource rather than text. |
| `rdfs:isDefinedBy` | Identifies the ontology module the term is defined in. Added automatically during gist release bundling and does not needed to be added by hand. |

*Use only rarely*

| Annotation | Comment |
| ---------: | ------- |
| `skos:changeNote` | Normally change notes are provided by the git history or version comparison. |
| `skos:historyNote` | Normally change notes are provided by the git history or version comparison. |
| `skos:note` | A more specific annotation is preferred. |

*Do not use*
| Annotation | Instead Use |
| ---------: | ----------- |
| `rdfs:label` | `skos:prefLabel` |
| `rdfs:comment` | All other annotations, especially `skos:scopeNote` and `skos:example` |

#### Rationale

SKOS annotations allow a more fine-grained approach to human-readable documentation. This change also aligns with emerging common practice.

Documentation
-----

Documentation is generally written in Markdown, and a Markdown linter should be applied to flag and fix [Markdown rule](https://github.com/DavidAnson/markdownlint/blob/v0.20.3/doc/Rules.md) violations. The Markdown config file [markdownlint.json](.markdownlint.json) configures the Markdown delinter. If using VS Code as an editor, [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) is a helpful extension that provides code hints and can be configured to automatically correct errors.
