gist Style Guide <!-- omit in toc -->
=====

- [Purpose of This Style Guide](#purpose-of-this-style-guide)
- [OWL Version](#owl-version)
- [Serialization](#serialization)
- [Local Names](#local-names)
  - [Orthographic Conventions for Class and Property Local Names](#orthographic-conventions-for-class-and-property-local-names)
  - [Textual Standards for Property Local Names](#textual-standards-for-property-local-names)
  - [Instance Local Names](#instance-local-names)
- [Labels](#labels)
  - [Classes](#classes)
  - [Properties](#properties)
  - [gist Definition of Title Case](#gist-definition-of-title-case)
- [Annotations](#annotations)
  - [Conventions](#conventions)
  - [Rationale](#rationale)
- [Inverses](#inverses)
- [Documentation](#documentation)

Purpose of This Style Guide
-----

The purpose of this evolving document is twofold:

- Define and implement conventions in order to standardize gist.
- Articulate what we consider best or "better" practices for ontology design and implementation.

-----

OWL Version
-----

gist uses OWL 2 DL.

-----

Serialization
-----

- gist OWL files are serialized in RDF Turtle
- The [EDM Council's RDF serialization tool, rdf-toolkit.jar,](https://github.com/edmcouncil/rdf-toolkit) should be run before every commit in order to standardize formatting and eliminate noise in git diffs.
- It is recommended to run this as a [pre-commit hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) in your git repository to ensure that it is done every time.
  In order to use the standard settings, copy the provided `pre-commit` script from the `tools/` directory in the repository to `.git/hooks/` after the repository is cloned,
  and ensure that `JAVA_HOME` is set in your environment. This script will only format RDF files, ignoring all others.

-----

Local Names
-----

### Orthographic Conventions for Class and Property Local Names

-----

- Camelcase
  - Classes initial uppercase
  - Properties initial lowercase
- Alphanumeric characters only.
  - Example: `Isbn10`, not `Isbn-10` or `ISBN-10`.
- Acronyms are also camelcased so that word boundaries are unambiguous.
  - Examples: `AmaGuideline`, not `AMAGuideline`; `UriScheme`, not `URIScheme`
  - `ID` is an exception, because Merriam-Webster spells it in all-caps.
- No non-standard abbreviations. E.g., `hasUoM` should be `hasUnitOfMeasure`.
  
### Textual Standards for Property Local Names

-----

These standards involve choice of wording, which are generally more difficult to define and reach consensus on than the orthographic conventions above. The goals of defining standards are to improve the ontology along the following metrics:

- Consistency: The ontology could have been written by a single person.
- Objectivity: Two ontologists following these standards should agree on the name for a new property in most cases.
- Clarity
- Explicitness
- Idiomaticity: Follows English natural language insofar as possible. This includes "reading well", as in `Mary isConnectedTo John` rather than `Mary connectedTo John`.
- Accuracy: Expresses intended meaning.
- Alignment with textual definitions. In some cases this requires a re-analysis of the intended meaning, and then perhaps a change in definition rather than local name. However, within the current scope of work, the local name was changed to match the definition, and the re-analysis will be done at a later time.
- Loose coupling and future-proofing.

Some of the examples results in changes to gist `10.0.0`, others are hypothetical.

| Standard | Examples |
| ---------: | ------- |
| Datatype properties nominal | `baseConversionFactor`, not `convertToBase` |
| Object properties verb-initial | `isAbout`, not `about` |
||`comesFromAgent`, not `fromAgent`|
|| `isMemberOf`, not `memberOf` |
|| `precedesDirectly`, not `directlyPrecedes` |
|| `usesTimeZoneStandard`, not `timeZoneStandardUsed` |
| Prefix "is" to "-ed" forms, both past participles and adjectives | `isGovernedBy`, not `governedBy` |
|| `isCharacterizedBy`, not `characterizedBy` |
| Prefer an ordinary verb to "hasX" or "isX", even in a pair of inverses | `follows`, not `isPrecededBy`, even when inverse `precedes` exists |
| "At" rather than "on" for datetimes | `isRecordedAt`, not `isRecordedOn`. |
| Present tense only with minimal exceptions when the meaning is inherently in the past | `isRenderedOn`, not `wasRenderedOn`, but `wasLastModifiedBy` rather than `isLastModifiedBy` |
|| `precedes`, not `preceded` |
|| but `wasLastModifiedAt`, not `isLastModifiedAt` |
| General idiomaticity | `hasRecipient`, not `hasGetter`
| No non-standard abbreviations | `hasUnitOfMeasure`, not `hasUoM`
| Final prepositions where appropriate | `hasJurisdictionOver`, not `hasJurisdiction` |
| Alignment with textual definition |  `hasBiologicalParent`, not `hasParent`, where the `skos:definition` precludes non-biological relationships |
| Loose coupling of ontology term names | `hasStart`, not `hasStartTimeInstant` |
| Unambiguously indicate directionality | `hasBroader`, not `broader` (as in SKOS) |
| Direction: go up rather than down a tree if a hierarchy exists | `hasParent`, not `hasChild`|||| `hasSuperCategory`, not `hasSubCategory` |
| Word boundaries consisent across ontology rather than following natural language (exception to idiomaticity) |  `hasSubTask`,`hasSubCategory`, `hasSuperCategory`, although "subtask" and "subcategory" are words |

### Instance Local Names

These conventions apply to both data and taxonomy terms.

- Leading underscore
- An infix consisting of the name of the class that is the _most specific rigid_ class the instance belongs to
- A single underscore
- The name of the instance, with spaces and hyphens replaced by underscores (no camelcasing) and only alphanumeric characters and underscores allowed
- Leave case as it is

A "rigid" class is one that the instance inherently belongs; it is part of the essence of the object, which would not be the same object if it did not belong to this class. A non-rigid class may be temporary and/or express a role or relationship; for example, `Child`, `Patient`, `Employee`. The notion of rigid classes originates in [OntoClean](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.99.7618&rep=rep1&type=pdf).

The "most specific rigid" class is the rigid class that the instance most directly belongs to.

For example, given the class hierarchy `Living Thing` > `Person` > `Student`, where the first two classes are rigid and the third is not, the name for Sir Tim Berners-Lee is `_Person_Sir_Tim_Berners_Lee`.

Labels
-----

The following conventions apply to `skos:prefLabel` but not `skos:altLabel`.

### Classes

- Title case (see definition of title case below)
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, etc.
  - Examples: _AMA Guideline_, _ISBN-10_
  
### Properties

- Lower case
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, proper nouns capitalized, etc.
- Examples: _has unit of measure_, _has SSN_, _unit symbol Unicode_

### gist Definition of Title Case

The rules of title case are not universally standardized; standardization is only at the level of house styles and individual style guides. Most English style guides agree that the first and last words should always be capitalized, while articles, short prepositions, and some conjunctions should not be. Other rules about the capitalization vary.

This style guide defines the rules for title case as follows:

- Capitalize:
  - First and last words
  - Words of four or more letters (e.g., _Between_, _With_, _This_)
  - Second part of hyphenated word (e.g., _Data-Centric_, not _Data-centric_)
- Lowercase:
  - Articles: *a*, *an*, *the*
  - Conjunctions: *and*, *but*, *if*, *for*, *or*, *nor*, *so*, *yet*
  - Prepositions: *as*, *at*, *by*, *cum*, *ere*, *for*, *in*, *of*, *off*, *on*, *out*, *per*, *pre*, *pro*, *qua*, *re*, *sub*, *to*, *up*, *via*
- Acronyms in all caps (e.g., _SSN_, _ISBN_)
- Capitalize everything else

-----

Annotations
-----

### Conventions

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
| `skos:note` | Use a more specific annotation whenever possible. |

*Do not use*
| Annotation | Instead Use |
| ---------: | ----------- |
| `rdfs:label` | `skos:prefLabel` |
| `rdfs:comment` | All other annotations, especially `skos:scopeNote` and `skos:example` |

### Rationale

SKOS annotations allow a more fine-grained approach to human-readable documentation. This change also aligns with emerging common practice.

-----

Inverses
-----

Inverses should not be defined without a compelling reason. They can be referenced in SPARQL using an inverse property path, and in OWL restrictions using the construction

```
  owl:onProperty [ owl:inverseOf :someProperty ] 
```

Documentation
-----

Documentation is generally written in Markdown, and a Markdown linter should be applied to flag and fix [Markdown rule](https://github.com/DavidAnson/markdownlint/blob/v0.20.3/doc/Rules.md) violations. The Markdown config file [markdownlint.json](.markdownlint.json) configures the Markdown delinter. If using VS Code as an editor, [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) is a helpful extension that provides code hints and can be configured to automatically correct errors.
