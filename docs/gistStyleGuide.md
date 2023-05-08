gist Style Guide <!-- omit in toc -->
=====

- [Purpose of This Style Guide](#purpose-of-this-style-guide)
- [OWL Version](#owl-version)
- [Serialization](#serialization)
- [Logical Consistency](#logical-consistency)
- [Local Names](#local-names)
  - [Orthographic Conventions for Class and Property Local Names](#orthographic-conventions-for-class-and-property-local-names)
  - [Textual Standards for Property Local Names](#textual-standards-for-property-local-names)
  - [Instance Local Names](#instance-local-names)
- [Labels](#labels)
  - [Classes](#classes)
  - [Properties](#properties)
  - [gist Definition of Title Case](#gist-definition-of-title-case)
- [Annotations](#annotations)
  - [Conventions for Use](#conventions-for-use)
  - [Formatting Conventions](#formatting-conventions)
  - [Cardinality](#cardinality)
- [Literals](#literals)
- [Documentation](#documentation)

Purpose of This Style Guide
-----

The purpose of this evolving document is twofold:

- Define and implement conventions in order to standardize gist.
- Articulate what we consider best or "better" practices for ontology design and implementation.

-----

OWL Version
-----

gist is an OWL 2 DL ontology.

-----

Serialization
-----

- gist OWL files are serialized in RDF Turtle.
- The [EDM Council's RDF serialization tool, `rdf-toolkit.jar`,](https://github.com/edmcouncil/rdf-toolkit) should be run before every commit in order to standardize formatting and eliminate noise in git diffs.
- It is recommended to run this as a [pre-commit hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) in your git repository to ensure that it is done before every commit. See [*Contributing*](Contributing.md#pre-commit-hook) for instructions on setting up your repository with a pre-commit hook.
- **Only** the `rdf-toolkit.jar` file found in `tools/` should be used, since mixing versions may result in bogus diffs.

-----

Logical Consistency
-----

Every version of gist committed to the git repository must be logically consistent. See [*Contributing*](Contributing.md#commits-pushes-and-merges).

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

Some of the examples resulted in changes to gist `10.0.0`, others are hypothetical.

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
| Direction: go up rather than down a tree if a hierarchy exists | `hasParent`, not `hasChild`|
|| `hasSuperCategory`, not `hasSubCategory` |
| Word boundaries consisent across ontology rather than following natural language (exception to idiomaticity) |  `hasSubTask`, `hasSubCategory`, `hasSuperCategory`, although "subtask" and "subcategory" are words |
||`hasBirthDate` and `hasDeathDate`, although "birthdate" is a word |

### Instance Local Names

These conventions apply to both data and taxonomy terms.

- A leading underscore.
- An infix indicating the type of the instance. As a rule of thumb, this is the *most specific rigid* class the instance belongs to, but there are exceptions where this is not viable (see below).
- A single underscore.
- The name of the instance, with spaces and hyphens replaced by underscores (no camelcasing) and only alphanumeric characters and underscores allowed.
- Leave case as it is,

A *rigid* class is one that the instance inherently belongs; it is part of the essence of the object, which would not be the same object if it did not belong to this class. A non-rigid class may be temporary and/or express a role or relationship; for example, `Patient`, `Employee`, `Spouse`. The notion of rigid classes originates in [OntoClean](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.99.7618&rep=rep1&type=pdf).

The *most specific rigid* class is the rigid class that the instance most directly belongs to.

For example, given the class hierarchy `Living Thing` > `Person` > `Professor`, where the first two classes are rigid and the third is not, the name for Sir Tim Berners-Lee is `_Person_Sir_Tim_Berners_Lee`.

Exceptions to this guideline arise may arise in IRI minting during data transformation. Based on how the data is presented, it is often difficult or cumbersome to know the most specific type of an instance, so one can fall back on a higher-level class. E.g., `_Magnitude_` rather than `_Duration_`.

Note: As of version 12.0.0, gist itself does not itself follow the infix convention, though it does use the leading underscore. This is under consideration for a future update.

Labels
-----

*The* following conventions apply to `skos:prefLabel` but *not* `skos:altLabel`.

### Classes

- Title case (see definition of title case below)
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, etc.
  - Examples: *AMA Guideline*, *ISBN-10*
  
### Properties

- Lower case
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, proper nouns capitalized, etc.
- Examples: *has unit of measure*, *has SSN*, *unit symbol Unicode*

### gist Definition of Title Case

The rules of title case are not universally standardized; standardization is only at the level of house styles and individual style guides. Most English style guides agree that the first and last words should always be capitalized, while articles, short prepositions, and some conjunctions should not be. Other rules about the capitalization vary.

This style guide defines the rules for title case as follows:

- Capitalize:
  - First and last words
  - Words of four or more letters (e.g., *Between*, *With*, *This*)
  - Second part of hyphenated word (e.g., *Data-Centric*, not *Data-centric*)
- Lowercase:
  - Articles: *a*, *an*, *the*
  - Conjunctions: *and*, *but*, *if*, *for*, *or*, *nor*, *so*, *yet*
  - Prepositions: *as*, *at*, *by*, *cum*, *ere*, *for*, *in*, *of*, *off*, *on*, *out*, *per*, *pre*, *pro*, *qua*, *re*, *sub*, *to*, *up*, *via*
- Acronyms in all caps (e.g., *SSN*, *ISBN*)
- Capitalize everything else

-----

Annotations
-----

### Conventions for Use

gist uses SKOS annotations rather than `rdfs:label` and `rdfs:comment`. The accepted annotations, intended use, and previous usage are shown in the following tables. Refer to the [SKOS ontology](http://www.w3.org/2004/02/skos/core) for formal definitions. SKOS annotations allow a more fine-grained approach to human-readable documentation. This change also aligns with emerging common practice.

*Required Annotations for Classes, Properties, and Taxonomic Terms*

| Annotation | Use | Instead Of |
| ---------: | --- |:---------|
| `skos:prefLabel` | Preferred label | `rdfs:label` |
| `skos:definition` | Definition | `rdfs:comment` |

*Highly recommended*

| Annotation | Use | Instead Of |
| ---------: | --- |:---------|
| `skos:scopeNote` | Additional clarifying comments about the meaning or usage of a term | `rdfs:comment` |
| `skos:example`   | One or more examples  | `rdfs:comment` |

These annotations help the user understand the use and meaning of the term, and prevent definitions from becoming lengthy and unstructured. `skos:definition` is expected to provide a definition, not lengthy usage notes or examples. These should instead be included in a `skos:scopeNote` or `skos:example`, respectively.

Occasionally a definition can hardly be understood at all without an example or two, in which case they can be included. For example, the term `ResearchProduct` might be defined as "An output of a research project, such as a document or spreadsheet."

*Use where relevant*

| Annotation | Use | Instead Of |
| ---------: | --- |:---------|
| `skos:altLabel`  | Alternative label, where relevant | n/a |
| `skos:editorialNote` | Notes for editors | `rdfs:comment` |

*RDFS annotations*

Certain RDFS annotations are recommended where there is no SKOS equivalent.

| Annotation | Use |
| ---------: | --- |
| `rdfs:seeAlso` | Indicates a resource that may provide additional information about the subject. Should be a link to a web page or RDF resource rather than text. See examples of its use in gist to get an idea of where it would be helpful. |
| `rdfs:isDefinedBy` | Identifies the ontology module the term is defined in. Added automatically during gist release bundling and does not needed to be added by hand. |

*Use only rarely*

| Annotation | Comment |
| ---------: | ------- |
| `skos:changeNote`, `skos:historyNote` | Normally these are obtained from the version control repository or version comparison. There is no further discussion of these annotations in this document. |
| `skos:note` | Use a more specific annotation whenever possible. |

*Do not use*
| Annotation | Instead Use |
| ---------: | ----------- |
| `rdfs:label` | `skos:prefLabel` |
| `rdfs:comment` | All other annotations, especially `skos:scopeNote` and `skos:example` |

### Formatting Conventions

| Annotation | Format |
| ---------: | ----------- |
| `skos:prefLabel`, `skos:altLabel` | See section [Labels](#labels) above. |
| `skos:definition`, `skos:scopeNote`, `skos:note`, `skos:editorialNote` | Full sentence(s) ending in period. It is acceptable to omit the subject at the beginning of the definition in order to avoid the vacuous "This predicate..." or "This class is..." E.g., "Relates a person to his or her spouse." or "A series of steps in a workflow." There should nevertheless be a final period. Use Oxford commas.|
| `skos:example` | May be either a full sentence or a list. Use a final period only in the former case. E.g., "SSN, driver's license number, employee ID" or "NIH sponsors a research project." Lists with short items, such as the first example, can be delimited by either commas (include Oxford commas) or semi-colons; full-sentence examples should be semi-colon-delimited. |

### Cardinality

| Annotation | Cardinality |
| ---------: | ----------- |
| `skos:prefLabel` | Exactly 1 |
| `skos:definition` | Exactly 1 |
| `skos:scopeNote`, `skos:editorialNote`, `skos:note` | At the implementer's discretion, multiple unrelated notes can be included in either a single annotation or multiple annotations. |
| `skos:example` | Recommended practice is to combine all examples into a single annotation, especially if there is a list of short items. |

-----

Literals
-----

- Literal values should be typed with one of the  datatypes included in the [OWL 2 Datatype Maps](https://www.w3.org/TR/owl2-syntax/#Datatype_Maps). It is not necessary to explicitly type strings as `xsd:string` because the [serializer](serialization) will add this to all untyped literals.

Documentation
-----

Documentation is generally written in Markdown, and a Markdown linter should be applied to flag and fix [Markdown rule](https://github.com/DavidAnson/markdownlint/blob/v0.20.3/doc/Rules.md) violations. The Markdown config file [markdownlint.json](.markdownlint.json) configures the Markdown delinter. If using VS Code as an editor, [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) is a helpful extension that provides code hints and can be configured to automatically correct errors.
