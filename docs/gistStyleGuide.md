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
  - [Conventions](#conventions)
  - [Rationale](#rationale)
  - [Annotation Format](#annotation-format)
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

gist is an OWL 2 DL ontology.

-----

Serialization
-----

- gist OWL files are serialized in RDF Turtle.
- They are serialized using the [EDM Council's RDF serialization tool, `rdf-toolkit.jar`,](https://github.com/edmcouncil/rdf-toolkit) in order to standardize formatting and eliminate noise in git diffs.
- After cloning the repository, run `/tools/setup.cmd`, as described in [Contributing.md](Contributing.md), which, among other things, installs a pre-commit hook that runs the serializer. This guarantees that committed files have been serialized.

-----

Logical Consistency
-----

Every version of gist committed to the repository must be logically consistent. You can ensure this by loading the ontology into Protégé and running a reasoner.

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

Some of the examples resulted in changes to gist `10.0.0`, others are hypothetical. Some of the cited properties have been removed since this document was written, but they are still useful as examples.

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

- Leading underscore
- An infix consisting of the name of the class that is the *most specific rigid* class the instance belongs to (but see caveats below)
- A single underscore
- The name of the instance, with spaces and hyphens replaced by underscores (no camelcasing) and only alphanumeric characters and underscores allowed
- Leave case as it is

A "rigid" class is one that the instance inherently belongs; it is part of the essence of the object, which would not be the same object if it did not belong to this class. A non-rigid class may be temporary and/or express a role or relationship; for example, `Child`, `Patient`, `Employee`. The notion of rigid classes originates in [OntoClean](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.99.7618&rep=rep1&type=pdf).

The "most specific rigid" class is the rigid class that the instance most directly belongs to.

For example, given the class hierarchy `Living Thing` > `Person` > `Student`, where the first two classes are rigid and the third is not, the name for Sir Tim Berners-Lee is `_Person_Sir_Tim_Berners_Lee`.

Caveat: During data conversion it may be difficult or impossible to determine the *most specific* rigid class. In such cases it is acceptable to use a higher-level rigid class, such as `_UnitOfMeasure_` rather than, for example, `_DurationUnit_`. 

Labels
-----

The following conventions apply to `skos:prefLabel` but not `skos:altLabel`.

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

### Conventions

gist uses SKOS annotations rather than `rdfs:label` and `rdfs:comment`. The accepted annotations, intended use, and previous usage are shown in the following tables. Refer to the [SKOS ontology](http://www.w3.org/2004/02/skos/core) for formal definitions.

*Required SKOS annotations*

| Annotation | Use | Instead Of |
| ---------: | --- |:---------|
| `skos:prefLabel` | Preferred label | `rdfs:label` |
| `skos:definition` | Definition | `rdfs:comment` |

*Preferred SKOS annotations*

| Annotation | Use | Instead Of |
| ---------: | --- |:---------|
| `skos:altLabel`  | Alternative label, where relevant | n/a |
| `skos:scopeNote` | Additional clarifying comments about the meaning or usage of a term | `rdfs:comment` |
| `skos:example`   | One or more examples  | `rdfs:comment` |
| `skos:editorialNote` | Notes for editors | `rdfs:comment` |

*RDFS annotations*

Certain RDFS annotations are recommended where there is no SKOS equivalent.

| Annotation | Use |
| ---------: | --- |
| `rdfs:seeAlso` | Indicates a resource that may provide additional information about the subject. Preferably points to a web page or RDF resource rather than text. This annotation should be used instead of adding references to a definition or scope note. |
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

### Annotation Format

| Annotation | Format |
| ---------: | ------- |
| `skos:prefLabel` - classes| Title case |
| `skos:prefLabel` - properties| Lowercase, aside from words that are normally written with uppercase, such as proper names, abbreviations, and acronyms |
| `skos:altLabel` | Follow format for `skos:prefLabel` unless different in normal usage. |
| `skos:definition` and the various SKOS notes listed above | Sentence case, ending in a period. Include Oxford commas.|
| `skos:example` | For full sentences, follow the format for notes. No final comma for words or phrases. |

You may find the SHACL shapes defined in `/vaidation/shapes/ontologyShapes.ttl` a useful reference.

-----

Inverses
-----

We adopt a best practice that ontologies should not define inverse properties, and have removed all inverses from gist 12.0.0. No inverses should be added to future versions of gist.

Determining which of a pair of inverses to keep was a balancing act involving several considerations; as you can see, some of the criteria contradict one another and had to be weighed carefully.

| Consideration | Example |
| ---------: | ------- |
| In hierarchies, prefer child-to-parent over parent-to-child | `hasSuperCategory`, not `hasSubCategory`,  |
| Expected cardinality of query results (related to above)| `hasNavigationalParent`, not `hasNavigationalChild`.
| gist usage: the number of times a property is reference in definitions of other terms | `hasPart` vs `isPartOf` |
| Naturalness in the way we think about the concepts | `isIdentifiedBy`, not `identifies`|
| Clarity and lack of ambiguity | `isRecognizedBy`, not `recognizes` |
| Simplicity | `isAbout` vs `isDescribedIn` |

These guidelines should be followed when defining new properties.

There are several rationales behind this best practice:

- Inverses increase cognitive load in building the ontology, converting data to RDF, and querying data, by providing two different ways to assert the same relationship and thus requiring two query paths to get complete result sets.
- Inverses increase inferencing time by an order of magnitude.

Inverses are not strictly necessary, given the availability of inverse paths in OWL, SPARQL, and SHACL. Sample use of `owl:inverseOf` to express a property restriction:

```markdown
[
    a owl:Restriction ;
    owl:onProperty [
      owl:inverseOf gist:isGovernedBy ;
    ] ;
    owl:someValuesFrom gist:GeoRegion ;
]
```

An exception to this best practice is in the context of Linked Open Data, where they are sometimes necessary to assert and publish relationships between two instances in different namespaces. Users of gist in this context can define inverses to gist proeprties within their own namespaces.
  
Documentation
-----

Documentation is generally written in Markdown, and a Markdown linter should be applied to flag and fix [Markdown rule](https://github.com/DavidAnson/markdownlint/blob/v0.20.3/doc/Rules.md) violations. The Markdown config file [markdownlint.json](.markdownlint.json) configures the Markdown delinter. If using VS Code as an editor, [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) is a helpful extension that provides code hints and can be configured to automatically correct errors.
