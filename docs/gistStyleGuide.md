# gist Style Guide <!-- omit in toc -->

- [Purpose of This Style Guide](#purpose-of-this-style-guide)
- [OWL Version](#owl-version)
- [Serialization](#serialization)
- [Logical Consistency](#logical-consistency)
- [Namespaces](#namespaces)
- [gist Stylistic Conventions](#gist-stylistic-conventions)
  - [Local Names](#local-names)
    - [Orthographic Conventions for Class and Property Local Names](#orthographic-conventions-for-class-and-property-local-names)
    - [Textual Standards for Property Local Names](#textual-standards-for-property-local-names)
    - [Instance Local Names](#instance-local-names)
  - [Labels](#labels)
    - [Class Labels](#class-labels)
    - [Property Labels](#property-labels)
    - [Valid Exceptions to Label Conventions](#valid-exceptions-to-label-conventions)
    - [Non-Conforming Labels](#non-conforming-labels)
    - [gist Definition of Title Case](#gist-definition-of-title-case)
  - [Annotations](#annotations)
    - [Conventions for Annotation Use](#conventions-for-annotation-use)
    - [Formatting Conventions for Annotations](#formatting-conventions-for-annotations)
    - [Annotation Cardinality](#annotation-cardinality)
    - [Use of Ontology Terms in Annotations](#use-of-ontology-terms-in-annotations)
  - [Literals](#literals)
  - [Documentation](#documentation)
- [Ontology Best Practices](#ontology-best-practices)
  - [Inverses](#inverses)
  - [OWL Restrictions](#owl-restrictions)

## Purpose of This Style Guide

The purpose of this document is twofold:

- Define and implement conventions in order to standardize gist and make it as clear, coherent, and precise as possible. Although gist is the product of many minds, years, and experiences, the goal is to give it the feel of having a single author writing with a uniform style.
- Articulate what we consider best or "better" practices for ontology design and implementation.

## OWL Version

gist is an OWL 2 DL ontology. This means that it cannot import non-OWL ontologies or use terms from RDF ontologies (i.e., classes and properties defined only as `rdf:Property` and `rdfs:Class`, as in Dublin Core) while remaining OWL 2 DL-compliant.

## Serialization

- gist OWL files are serialized in RDF Turtle.
- The [EDM Council's RDF serialization tool, `rdf-toolkit.jar`,](https://github.com/edmcouncil/rdf-toolkit) must be run before every commit in order to standardize formatting and eliminate noise in git diffs.
  - When you set up your local repository, you will run `tools/setup.cmd` which, among other things, installs a pre-commit hook that runs the serializer in `tools/serializer`. See [*Contributing*](Contributing.md) for further instructions on setting up your repository.
  - To ensure consistent output, only the version of `rdf-toolkit.jar` file found in `tools/serializer` should be used.

## Logical Consistency

Every version of gist committed to the git repository must be logically consistent. See [*Contributing*](Contributing.md#commits-pushes-and-merges).

## Namespaces

gist defines three namespaces:

* Ontology namespace: `gist: <https://w3id.org/semanticarts/ns/ontology/gist/>`
* Taxonomy namespace: `gistx: <https://w3id.org/semanticarts/ns/taxonomy/gist/>`
* Instance data namespace: `gistd: <https://w3id.org/semanticarts/ns/data/gist/>`

## gist Stylistic Conventions

### Local Names

#### Orthographic Conventions for Class and Property Local Names

- Camelcase
  - Classes initial uppercase
  - Properties initial lowercase
- Alphanumeric characters only.
  - Example: `Isbn10`, not `Isbn-10` or `ISBN-10`.
- Acronyms are also camelcased so that word boundaries are unambiguous.
  - Examples: `AmaGuideline`, not `AMAGuideline`; `UriScheme`, not `URIScheme`
  - `ID` is an exception, because Merriam-Webster spells it in all-caps.
- No non-standard abbreviations. E.g., `hasUoM` should be `hasUnitOfMeasure`.

#### Textual Standards for Property Local Names

These standards involve wording choices, which are often more difficult to define and reach consensus on than simple orthographic conventions. The goal of defining standards are to improve the ontology along the following metrics:

- Consistency: The ontology could have been written by a single person.
- Objectivity: Two ontologists following these standards should agree on the name for a new property in most cases.
- Clarity
- Explicitness
- Idiomaticity: Follows English natural language insofar as possible. This includes "reading well", as in `Mary isConnectedTo John` rather than `Mary connectedTo John`.
- Accuracy: Expresses intended meaning.
- Alignment with textual definitions. In some cases this requires a re-analysis of the intended meaning, and then perhaps a change in definition rather than local name. However, within the current scope of work, the local name was changed to match the definition, and the re-analysis will be done at a later time.

Some of the examples resulted in changes in gist `10.0.0`, others are hypothetical.

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
| Prefer an ordinary verb to "hasX" or "isX" | `precedes`, not `isFollowedBy` |
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

#### Instance Local Names

These conventions apply to both data and taxonomy terms.

- A leading underscore.
- An infix indicating the type of the instance. As a rule of thumb, this is the *most specific rigid* class the instance belongs to, but there are exceptions where this is not viable (see below).
- A single underscore.
- The name of the instance, with spaces and hyphens replaced by underscores (no camelcasing) and only alphanumeric characters and underscores allowed.
- Leave case as it is,

A *rigid* class is one that the instance inherently belongs; it is part of the essence of the object, which would not be the same object if it did not belong to this class. A non-rigid class may be temporary and/or express a role or relationship; for example, `Patient`, `Employee`, `Spouse`. The notion of rigid classes originates in [OntoClean](https://www.researchgate.net/publication/226934944_An_Overview_of_OntoClean).

The *most specific rigid* class is the rigid class that the instance most directly belongs to.

For example, given the class hierarchy `Living Thing` > `Person` > `Professor`, where the first two classes are rigid and the third is not, the name for Sir Tim Berners-Lee is `_Person_Sir_Tim_Berners_Lee`.

Exceptions to this guideline arise may arise in IRI minting during data mapping. Based on how the data is presented, it is often difficult or cumbersome to know the most specific type of an instance, so one can fall back on a higher-level class. E.g., when processing a table of organizations, it may not be possible to know which are governmental organizations, which corporations, and which non-profits, so the infix `_Organization_` can be used throughout.


### Labels

The following conventions apply to `skos:prefLabel` but *not* `skos:altLabel`, which by nature may be idiosyncratic.

#### Class Labels

- Title case (see [definition of title case](#gist-definition-of-title-case)) below
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, etc.
  - Examples: *AMA Guideline*, *ISBN-10*

#### Property Labels

- Lower case
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, proper nouns capitalized, etc.
- Examples: *has unit of measure*, *has SSN*, *Unicode symbol*, *W2*

#### Valid Exceptions to Label Conventions

There may occasionally be valid reasons to deviate from the conventions stated here:

- Deviation from wording of the local name. For example, the predicate `gist:isGeoContainedIn` uses a shortened form of "geographically" for conciseness. The `skos:prefLabel` uses the fully spelled out word: "is geographically contained in."

#### Non-Conforming Labels

The general label conventions have been captured in SHACL shapes which are run during the ontology build and release process and the repository continuous integration script. These shapes do not allow for special cases like capitalized proper names. To prevent validation failures, add the annotation `gist:nonConformingLabel true` to the term in the `gistValidationAnnotations` ontology so that label validation will be skipped.

#### gist Definition of Title Case

The rules of title case are not universally standardized; standardization is only at the level of house styles and individual style guides. Most English style guides agree that the first and last words should always be capitalized, while articles, short prepositions, and some conjunctions should not be. Other rules about capitalization vary.

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

### Annotations

#### Conventions for Annotation Use

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

Negative examples should be prefaced by the text "Negative example:" or "Negative examples:". For example, the definition of `gist:LivingThing` includes `skos:example "Negative examples: fictional life forms such as unicorns or Mickey Mouse."`

Occasionally a definition can hardly be understood at all without an example or two, in which case they can be included in the `skos:definition`. For example, the term `ResearchProduct` might be defined as "An output of a research project, such as a document or spreadsheet."

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

#### Formatting Conventions for Annotations

| Annotation | Format |
| ---------: | ----------- |
| `skos:prefLabel`, `skos:altLabel` | See section [Labels](#labels) above. |
| `skos:definition`, `skos:scopeNote`, `skos:note`, `skos:editorialNote` | Full sentence(s) ending in period. It is acceptable to omit the subject at the beginning of the definition in order to avoid the vacuous "This predicate..." or "This class is..." E.g., "Relates a person to his or her spouse." or "A series of steps in a workflow." There should nevertheless be a final period. Use Oxford commas.|
| `skos:example` | May be either a full sentence or a list. Use a final period only in the former case. E.g., "SSN, driver's license number, employee ID" or "NIH sponsors a research project." Lists with short items, such as the first example, can be delimited by either commas (include Oxford commas) or semi-colons; full-sentence examples should be semi-colon-delimited. |

#### Annotation Cardinality

| Annotation | Cardinality |
| ---------: | ----------- |
| `skos:prefLabel` | Exactly 1 |
| `skos:definition` | Exactly 1 |
| `skos:scopeNote`, `skos:editorialNote`, `skos:note` | At the implementer's discretion, multiple unrelated notes can be included in either a single annotation or multiple annotations. |
| `skos:example` | Recommended practice is to combine all examples into a single annotation, especially if there is a list of short items. |

#### Use of Ontology Terms in Annotations

In general it is preferred to use natural language rather than ontology terms in annotations. For example, the definition of `gist:GovernedGeoRegion` reads "A defined geographical area (or areas) governed by exactly one country government." rather than using the ontology class names `GeoRegion` and `CountryGovernment`.

The exception is when a note needs to make specific reference to an ontology term rather than to a concept. For example, the scope note on `gist:birthDate` reads "This is a subproperty of `gist:startDateTime` rather than `gist:actualStartDate` because some living things have yet to be born."

Caution: gist is not yet fully aligned with this best practice, which is aspirational.

### Literals

- Literal values should be typed with one of the  datatypes included in the [OWL 2 Datatype Maps](https://www.w3.org/TR/owl2-syntax/#Datatype_Maps). It is not necessary to explicitly type strings as `xsd:string` because the [serializer](#serialization) will add this to all untyped literals.

### Documentation

Documentation is generally written in Markdown, and a Markdown linter should be applied to flag and fix [Markdown rule](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md) violations. The Markdown config file [markdownlint.json](.markdownlint.json) configures the Markdown delinter. If using VS Code as an editor, [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) is a helpful extension that provides code hints and can be configured to automatically correct errors.

## Ontology Best Practices

### Inverses

All inverses were removed from gist as of version `12.0.0`, with minor modifications in version `13.0.0`. We consider it a best practice not to define inverses, for several reasons:

- Reduce cognitive load for developers and implementers of the ontology.
- Promote uniformity in the graph.
- Eliminate the need for duplicate query paths in queries.
- Reduce memory load during inferencing.
- Simplify validation and writing and maintaining SHACL shapes.

In selecting which of a potential pair of inverses to define, we apply the child-to-parent or cardinality principle: select the direction which will generally produce the fewest query results. Examples:

| Child to Parent | Parent to Child |
| ---------: | --- |
| `isMemberOf` | `hasMember` |
| `isPartOf` | `hasPart` |
| `hasBiologicalParent` | `hasBiologicalChild` |
| `hasSuperCategory` | `hasSubCategory` |

This principle will determine most but not all cases; e.g., `precedes` vs `follows`; in these cases an arbitrary decision is made.

### OWL Restrictions

We have defined an in-depth set of best practices governing the use of OWL restrictions (forthcoming). A summary without detailed rationale is provided here.

1. Do not use equivalence to an `owl:allValuesFrom` restriction or an exact or maximum cardinality restriction if you want to be able to infer instances into the defined class. Because these restrictions describe what does *not* exist, in combination with the Open World Assumption they prevent inference into the defined class.
2. Use equivalence to an `owl:allValuesFrom` restriction or an exact or maximum cardinality restriction if you want to be able to infer instances into the *complement* of the defined class.
3. Use equivalence to an `owl:allValuesFrom` restriction to infer into the *object* of `owl:allValuesFrom`. For example, if a `:ProductId` class is the intersection of `gist:ID` with the restriction class that identifies only instances of `:Product`, then if something is identified by a product ID, we can infer that it is a product.
4. Choose between 1, 2, and 3 according to the type of inference that you care about.
5. *Subclassing* to an `owl:allValuesFrom` restriction or an exact or maximum cardinality restriction will provide additional information about the defined class without inferring into it.
6. Use equivalence with minimum cardinality, `owl:someValuesFrom`, `owl:hasValue` restrictions to infer an instance into the class.
7. Use `owl:someValuesFrom` rather than minimum cardinality 1 restrictions.
8. Use minimum cardinality with values greater than 1.
9. Do not use minimum cardinality 0 restrictions. Use annotations to provide usage hints instead.
10. Be sure that your restrictions express meaning rather than data integrity constraints. Consider the question "If an instance of X did not conform to Y, would it still be an X?"
11. Express data constraints on particular data sets with SHACL.
