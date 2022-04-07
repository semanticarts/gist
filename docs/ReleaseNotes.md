gist Release Notes
=====

Release 11.0.0
-----

### Major Updates

- Implemented new time model based on datatype properties rather than `TimeInstant`. Issues [#499](https://github.com/semanticarts/gist/issues/499), [#388](https://github.com/semanticarts/gist/issues/388). Sample triples are provided in the release package.
    - Deleted class `TimeInstant` and its subclasses. This class was previously used to materialize a point in time with different precisions (day, minute, system time), a time zone, a local and UTC value, and so on. Object properties were used to connect something to an instance of `TimeInstant`, specifying different relationships such as start and end, planned vs actual.
    - Defined a top-level datatype property `atDateTime`, neutral as to start/end, planned/actual, and precision (year, day, minute, microsecond).
    - Replaced existing object properties with a hierarchy of subproperties of `atDateTime`, retaining distinctions between start and end, planned vs actual, and precisions.
    - Added new predicates with year precision alongside the existing day, minute, and milli-/microsecond precisions.
- Renamed `ContemporaneousEvent` to `ContemporaryEvent`.
- Removed property  `gist:hasOrderedMember`. `gist:hasMember` should be used instead. Issue [#540](https://github.com/semanticarts/gist/issues/540).
- Distinguished governments from governed geo-regions, as per issue [#215](https://github.com/semanticarts/gist/issues/215). Changes include:
    - Added classes `SubCountryGovernment`, `IntergovernmentalOrganization`, and `TreatyOrganization` as subclasses of `Organization`.
    - Added classes `GovernedGeoRegion`, `CountryGeoRegion` as subclasses of `GeoRegion`.
    - Removed restriction on `CountryGovernment` requiring it to be recognized by some other country government, and stipulate its sovereignty.
    - Removed `GeoPoliticalRegion` (roughly replaced by `GovernedGeoRegion`).
- Removed domain and range constraints from `gist:requires`. Issue [#183](https://github.com/semanticarts/gist/issues/183).
- Removed domain and range constraints from `gist:hasNumerator`, `gist:hasDenominator`, `gist:hasMultiplier`, and `gist:hasMultiplicand`. Issue [#160](https://github.com/semanticarts/gist/issues/160).
- Removed predicate `hasBiologicalOffspring`, added domain and range to `hasBiologicalParent`, and modified related restrictions on class `LivingThing`. Issue [#638](https://github.com/semanticarts/gist/issues/638).
- Combined `standardConversionFactor` and `baseConversionFactor` into `conversionFactor`. Issue [#624](https://github.com/semanticarts/gist/issues/624).

### Minor Updates

- Added unit symbols for unit instances instances per issue [#579](https://github.com/semanticarts/gist/issues/579).

### Patch Updates

- Added labels to gist instances, per issue [#370](https://github.com/semanticarts/gist/issues/370).
- Added definitions for unit of measure instances per issue [#526](https://github.com/semanticarts/gist/issues/526).
- Deprecated property `gist:hasOrderedMember`. `gist:hasMember` should be used instead. Issue [#540](https://github.com/semanticarts/gist/issues/540).
- Improved definitions of 'navigational' predicates, per issue [#523](https://github.com/semanticarts/gist/issues/523).
- Modified `skos:definition` of `gist:Message` to match formal definitions, per issue [#194](https://github.com/semanticarts/gist/issues/194).
- Removed min cardinality of zero restriction on `ProductUnit`, per issue [#582](https://github.com/semanticarts/gist/issues/582).
- Improved definition of `gist:Task`, per issue [#625](https://github.com/semanticarts/gist/issues/625).
- Change predicate `hasJurisdictionOver` to `isUnderJurisdictionOf` (bug fix). Issue [#637](https://github.com/semanticarts/gist/issues/637).
- Clarified restrictions on `gist:OrderedMember`. Issue [#574](https://github.com/semanticarts/gist/issues/574).
  
Import URL: <https://ontologies.semanticarts.com/o/gistCore11.0.0>.

Release 10.0.0
-----

This is a major release, which includes several changes which break compatibility with previous versions
of `gist`. See the [migration guide](./MajorVersionMigration.md) for documentation on updating existing
`gist`-based ontologies and instance data.

### Major Updates

- Renamed 62 object and datatype properties to reflect newly-established conventions. Includes corresponding updates to the [gist style guide](https://github.com/semanticarts/gist/blob/master/docs/gistStyleGuide.md). Issues [188](https://github.com/semanticarts/gist/issues/188), [507](https://github.com/semanticarts/gist/issues/507).
- Renamed `MimeType` to `MediaType` to be consistent with [IANA guidelines](https://www.iana.org/assignments/media-types/media-types.xhtml).
  and [RFC6838](https://tools.ietf.org/html/rfc6838). Issue [#434](https://github.com/semanticarts/gist/issues/434).
- Renamed `gist:decimalValue` to `gist:numericValue` and expanded property range to include all numeric data types.
  supported by OWL.  Issue [#171](https://github.com/semanticarts/gist/issues/171).
- Refactored ordered collection model. Issues [#112](https://github.com/semanticarts/gist/issues/112), [#540](https://github.com/semanticarts/gist/issues/540).
    - Added predicate `gist:providesOrderFor`.
    - Deleted classes `gist:OrdinalCollection` and `gist:OrdinalMember`.
- Changes to and affecting `gist:Person`, as per issue [#136](https://github.com/semanticarts/gist/issues/136):
    - Removed `owl:someValuesFrom gist:name` restriction from `gist:Person`.
    - Made `gist:hasBirthDate` a subproperty of `gist:hasStart` rather than `gist:hasActualStart`.
- Refactored the way network connections are modeled per issue [#126](https://github.com/semanticarts/gist/issues/126):
    - `networkConnection`, `hasFromNode` and `hasToNode` have been renamed to `links`, `linksFrom` and `linksTo`, respectively.
    - Added a restriction on `NetworkLink` that it must have exactly 2 links.
    - Added restrictions on `NetworkLink` and `NetworkNode` that they must be `isMemberOf` a `Network`.
- Extended the range of `comesFromPlace`/`goesToPlace` to include `gist:Address` in addition to `gist:Place`.
  Issue [#392](https://github.com/semanticarts/gist/issues/392).
- Modified classes and properties related to street addresses as per issue [#483](https://github.com/semanticarts/gist/issues/483):
    - Removed `BuildingAddress`.
    - Added `StreetAddress` as subclass of `PostalAddress`.
    - Replaced `hasStreetAddress` with the more general `hasAddress`. Removed `streetAddressOf`.
    - Removed `communicationAddressOf` in a general effort to trim unused inverse properties.
    - Clarified the definition of `hasCommunicationAddress` (now a subproperty of `hasAddress`),
      added domain (`Person U Organization`).

### Minor Updates

- Added annotation properties which provide usage guidance for properties without the constraints imposed by `rdfs:range` and `rdfs:domain`: Issue [#389](https://github.com/semanticarts/gist/issues/389).
    - `domainIncludes`
    - `rangeIncludes`
- Created a `gistMediaTypes` ontology to declare `MediaType` instances relevant to semantic applications.
  Issue [#463](https://github.com/semanticarts/gist/issues/463).

### Patch Updates

- Updated annotations for `isBasedOn` and `isBasisFor` properties. Issue [#139](https://github.com/semanticarts/gist/issues/139)
- `hasDirectSubCategory` is now a subproperty of `hasSubCategory`, as it was always supposed to be.  Issue [#481](https://github.com/semanticarts/gist/issues/481).
- Clarified the definition of `ContemporaneousEvent`. Issue [#174](https://github.com/semanticarts/gist/issues/174).

Import URL: <https://ontologies.semanticarts.com/o/gistCore10.0.0>.

Release 9.7.0
-----

### Minor Updates

- Deprecated `gist:Room`. Issue [#102](https://github.com/semanticarts/gist/issues/102).

### Patch Updates

- Updated annotations for the following properties regarding the hasDirectX/hasX pattern. Issue [#115](https://github.com/semanticarts/gist/issues/115)
    - `geoContains`, `geoContainedIn`
    - `directPartOf`,`hasDirectPart`
    - `directlyPrecededBy`, `directlyPrecedes`
- Declare `gist:identifies` as `owl:FunctionalProperty` rather than `owl:InverseFunctionalProperty` (bug fix). Issue [#180](https://github.com/semanticarts/gist/issues/180).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.7.0>.

Release 9.6.0
-----

### Minor Updates

- Added datatype property `gist:description` for describing instance data. Issue [#425](https://github.com/semanticarts/gist/issues/425).
- Refactored `hasParty`, `giver` and `getter`. Issue [#133](https://github.com/semanticarts/gist/issues/133).
    - `giver` and `getter`
        - Renamed to `hasGiver` and `hasGetter`
        - The newly named versions are no longer sub-properties of `hasParty`
        - Deprecated `giver` and `getter`
    - New property: `hasParticipant`
        - No domain or range
        - Has sub-properties: `hasGiver`, `hasGetter`, `hasParty`, `fromAgent` and `toAgent`
    - Added a `skos:scopeNote` to `fromAgent`
    - Added a `skos:example` to `hasParty`
    - Updated `skos:definition`s for `toAgent` and `fromAgent`

### Patch Updates

- Updated all `skos:prefLabel` values based on a newly-adopted convention. See the convention specification in
  the section on Labels in the [gist style guide](https://github.com/semanticarts/gist/blob/v9.5.0/docs/gistStyleGuide.md#Labels).
  Added `skos:prefLabel` validation to build process for classes and properties.
  Issues [#227](https://github.com/semanticarts/gist/issues/227) and
  [#421](https://github.com/semanticarts/gist/issues/421).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.6.0>.

Release 9.5.0
-----

### Minor Updates

- Converted RDFS annotations to SKOS annotations. See [gist style guide](https://github.com/semanticarts/gist/blob/v9.5.0/docs/gistStyleGuide.md) for usage details. A file containing legacy RDFS annotations is included in the release package for those who wish to continue using them for existing terms. Issues [#351](https://github.com/semanticarts/gist/issues/351), [#379](https://github.com/semanticarts/gist/issues/379).
- Deprecated `gist:geoDirectlyContains` and `gist:geoDirectlyContainedIn`. Issue [#328](https://github.com/semanticarts/gist/issues/328).
- Removed `gist:Address` from range of `gist:toAgent` and `gist:fromAgent`. Issue [#391](https://github.com/semanticarts/gist/issues/391).
- Added label validation rules for classes and properties. Created `gist:nonCoformingLabel` annotation property to tag exceptions to the rule. Issue [#227](https://github.com/semanticarts/gist/issues/227).

### Patch Updates

- Modified build to create JSON-LD ontology files with `.jsonld` extension. Issue [#365](https://github.com/semanticarts/gist/issues/365).
- Documentation:
    - Documented policy change on submission of PRs by external contributors (PRs from external contributors are now accepted for review if submitted with an issue). Issue [#382](https://github.com/semanticarts/gist/issues/382).
    - Documented new, condensed release notes format (reverted release note format introduced in 9.4.0). Issue [#401](https://github.com/semanticarts/gist/issues/401).
- Added a standard `pre-commit` hook which applies uniform formatting to RDF files using `tools/rdf-toolkit.jar`. Issue [#228](https://github.com/semanticarts/gist/issues/228).
- Conformed definition of `gist:_second` to other `gist:BaseUnit` individuals. Issue [#92](https://github.com/semanticarts/gist/issues/92).
- Fixed label of TaskTemplate. Issue [#407](https://github.com/semanticarts/gist/issues/407).
- Corrected all class and property labels to be compliant with validation rules documented in the [gist style guide](https://github.com/semanticarts/gist/blob/v9.5.0/docs/gistStyleGuide.md). Issue [#227](https://github.com/semanticarts/gist/issues/227).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.5.0>.

Release 9.4.0
-----

### Minor Updates

- Replaced the union class equivalences in the definitions of `gist:Artifact` and `gist:Place` with subclass assertions from each of the union class members. Issues [#110](https://github.com/semanticarts/gist/issues/110), [#343](https://github.com/semanticarts/gist/issues/343).
- Made changes to `Category` predicates: added intransitive properties `gist:hasDirectSubCategory` and `gist:hasDirectSuperCategory` as sub-properties of `gist:hasSubCategory` and `gist:hasSuperCategory`, respectively, and made the latter transitive. Issues [#104](https://github.com/semanticarts/gist/issues/104), [#107](https://github.com/semanticarts/gist/issues/107).
- Replaced `gist:Weight` with `gist:Mass` in all contexts. Issue [#105](https://github.com/semanticarts/gist/issues/105).

### Patch Updates

- Made `gist:hasPhysicalLocation` transitive. Issue [#109](https://github.com/semanticarts/gist/issues/109).
- Deprecated `gist:_unitedNations`. Issue [#207](https://github.com/semanticarts/gist/issues/207).
- Made trivial corrections to axioms in the definition of some geo terms. Issues [#64](https://github.com/semanticarts/gist/issues/64), [#334](https://github.com/semanticarts/gist/issues/334), [#361](https://github.com/semanticarts/gist/issues/361).
- Changed ontology edit format from RDF/XML (.owl) to Turtle (.ttl). Issues [#223](https://github.com/semanticarts/gist/issues/223), [#319](https://github.com/semanticarts/gist/issues/319).
- Added release notes template. Issue [#338](https://github.com/semanticarts/gist/issues/338).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.4.0>.

Release 9.3.0
-----

- Merged into a single module/file all of gist except the gistDeprecated module.  Fixes issue [#292](https://github.com/semanticarts/gist/issues/292).
- Removed import diagram generation and catalog files from bundling. Fixes issue [#309](https://github.com/semanticarts/gist/issues/309).
- Amended bundle.yaml to add rdfs:isDefinedBy to all ontology terms during release bundling process. Fixes issue [#266](https://github.com/semanticarts/gist/issues/266).
- Added gist:EmailAddress as a subclass of gist:ElectronicMessageAddress. Fixes issue [#99](https://github.com/semanticarts/gist/issues/99).
- Changed gist:orderedMemberOf from Inverse Functional to Functional. Fixes issue [#262](https://github.com/semanticarts/gist/issues/262).
- Added gist:Collection as the range, instead of domain, of gist:memberOf. Fixes issue [#142](https://github.com/semanticarts/gist/issues/142).
- Removed redundant disjoints. Fixes issue [#254](https://github.com/semanticarts/gist/issues/254).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.3.0>.

Release 9.2.0
-----

- Replaced all "xs" namespace prefixes for XML Schema with "xsd". Corrects issue [#158](https://github.com/semanticarts/gist/issues/158).
- Corrected gist:convertToBase value for gist:_minute from 1.0 to 60.0. Fixes issue [#82](https://github.com/semanticarts/gist/issues/82).
- Added initial draft of in-progress gist style guide. Fixes issue [#163](https://github.com/semanticarts/gist/issues/163).
- Added documentation of change and release management process. Fixes issue [#233](<https://github.com/semanticarts/gist/issues/233>>.
- Added guidelines for submission of GitHub issues and pull requests. Fixes issue [#190](https://github.com/semanticarts/gist/issues/190).
- Remove defunct tools and documentation. Fixes issue [#193](https://github.com/semanticarts/gist/issues/193).
- Include direct imports of all gist modules in gistCore. Fixes issue [#80](https://github.com/semanticarts/gist/issues/80).
- Corrected all typos and misspellings in annotations. Fixes issue [#210](https://github.com/semanticarts/gist/issues/210).
- Added cardinality restrictions and disjoints to various gist unit classes. Fixes [#69](https://github.com/semanticarts/gist/issues/69).
- Removed defunct owl:versionInfo from all ontology files. Fixes issue [#212](https://github.com/semanticarts/gist/issues/212).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.2.0>.

Release 9.1.0
-----

- Reformatted all files to match uniform serialization.
- Corrected restriction for `gist:Collection`.
- Provided missing labels for classes and properties.
- Corrects issues [#72](https://github.com/semanticarts/gist/issues/72), [#91](https://github.com/semanticarts/gist/issues/91), [#95](https://github.com/semanticarts/gist/issues/95), [#96](https://github.com/semanticarts/gist/issues/96), [#97](https://github.com/semanticarts/gist/issues/97), [#98](https://github.com/semanticarts/gist/issues/98), [#101](https://github.com/semanticarts/gist/issues/101), [#122](https://github.com/semanticarts/gist/issues/122), and [#145](https://github.com/semanticarts/gist/issues/145).
- Removed outdated Visio and PDF files, documentation is now auto-generated as part of the release process.
- gistWiki has been removed.

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.1.0>.

Release 9.0
-----

### Miscellaneous

- The `gist` namespace has been modified from `http:` to `https:`.
- Added comments to ontologies.
- Added labels and comments to many properties and classes.
- `SocialBeing` has been removed.
- The property `gist:party` has been renamed to `gist:hasParty`.

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.0.0>.

### Agreement

- `SocialBeing` has been removed. A few restrictions that used `SocialBeing` as a filter class now use the expression `(Person or Organization)`.
- Added `Contract`.
- The property `gist:party` was renamed to `gist:hasParty`.

### Category

- New property: `hasTag`.
- A `gist:Category` now uses `gist:hasTag` instead of `gist:containedText`.
- The definition of `Taxonomy` was corrected. It used to be a controlled vocabulary that had a super category or a navigational parent. But it is not the taxonomy that is part of a hierarchy, it is the elements of the taxonomy that are part of the hierarchy.  The definition for `gist:Taxonomy` now says it is a controlled vocabulary and has a member that has either  a sub category or super category.  The notion of navigational parent is no longer included in the definition.
- The object property `gist:hasPreferredTerm` that pointed to a `gist:Text` property was removed. Use the annotation `skos:prefLabel` instead.

### Event

- Renamed `occurredAt` to `occursAt`.
- Changed restriction on `gist:Event` to be `(occursAt gist:Place)` rather than `(occuredAt gist:GeoRegion)`.
- Renamed `TemplateTask` to `TaskTemplate` because it is a template related to tasks, not a task related to templates.
- Moved `gist;characterizedAs` to gistTop.
- Removed `TimeInterval`. A number of restrictions with filter class `(TimeInstant or TimeInterval)` changed to be just `TimeInstant`.

### Intention

- A `ServiceSpecifictation` no longer produced a behavior. Rather, it is the basis for an `Event` (replaced a restriction)
- New property: `basisFor`, inverse of `basedOn` which is defined in gistTop.

### IoT

Entirely new ontology for modeling Internet of Things concepts.

### Measure

- Slight clarification of the meaning of OrdinalCollection.  Mathematically, it is more than just a total order, it is a strict total order.
- `directlyPrecedes`      replaces `strictlyPrecedes`.
- `directlyPrecededBy` replaces `strictlyPrecededBy`
- `PhysicalThing` removed, was  a vestige from the past.

### Network

- Entirely new ontology covering concepts for a virtual or actual network.

### Organization

- New Class:  `GeoPoliticalRegion`, a collection of `gist:GeoRegion` administered by a `GovernmentOrganization`.

### Place

- The range of the property `geoOccupies` changed to `gist:Place`. It had been the union of `GeoRegion` and `GeoVolume`.

### TemporalRelation

- `TemporalRelation` no longer a subclass of `TimeInterval` (which has been removed).

### Time

- Just a few new labels and comments.

### Top

- References to `TimeInterval` removed.
- `Event` is no longer a subclass of `TimeInterval`. Instead, it has a start and end time.
- `gist:Content` is no longer disjoint with `Intention`.
- `gist:Magnitude` is no longer `gist:of` something.   We used to think of magnitude of say 180 pounds as necessarily being a value associated with something, e.g. a person.  `gist:of` was the inverse of `gist:hasA` which no longer exists.

### Unit

- `RatioUnit` used to have exactly 1 `UnitOfMeasure` as a numerator, now it can have more than one.

### Deprecated

Added to the list of deprecated things:

1. Renamed
    - `gist:TemplateTask` (renamed to `TaskTemplate`)
    - `gist:party` (use `hasParty` instead)
2. Removed
    - `gist:SocialBeing`  - use `(Person or Organization)` instead
    - `gist:of` (a vestige of the past)
    - `gist:sameOrderAs` (was adding unnecessary mathematical precision)
    - `gist:TimeInterval` (the idea of a time interval is captured by assigning it a start and end time, e.g. an event)
    - `gist:dateTime`
3. Replaced by a variation
    - `gist:strictlyPrecededBy` (using `directlyPrecededBy` instead)
    - `gist:strictlyPrecedes` (using `directlyPrecedes` instead)

Release 8.0
-----

This major version primarily changed all concept URIs to use `/` instead of `#`
Additionally, gistWiki is no longer included by gistCore.

Import URL: <http://ontologies.semanticarts.com/o/gistCore8.0.0>.

Release 7.5
-----

This version focused on making the import structure simpler and flatter, in order to make it easier for people to use subsets of gist if they want to.  Because all of gist is in one name space this was relatively easy to do and will have very little impact on anyone who is using gist 7.* (see the change log there were a few changes that you may want to review).

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.5.owl>.

Release 7.4
-----

Gist 7.4 was an internal release.

Release 7.3
-----

- An additional supplementary ontology was added for Units of Measure which introduces the concept of a Coherent Unit. This allows for conversions between units of the same dimension to be done using just SPARQL, as opposed to relying on rules.
- There are new and/or improved annotations (definitions, notes, examples, negative examples, etc.) on all Classes.
- The Category ontology added properties for true sub/super type relationship, including having a unique superType (parent).
- Other minor changes:
- removal of redundant imports and redundant classes already defined in another ontology
- relaxed the domain on gist:start and gist:end
- expanded the range of gist:fromAgent and gist:toAgent
- added to the Units of Measure ontology and corrected an erroneously named class

See ChangeLog in pdf file for full details of changes.

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.3.owl>.

Release 7.2
-----

- Add wiki and rdfshape capability
- Removed some redundant assertions, and moved some comments to the ontology where the concept was first introduced.
- Removed `currencyValue` in favor of `decimalValue`
- Upgrades domains on some date properties and `hasCommunicationAddress`
- Deprecated a lot of the measurement stuff that wasn't being used (as far as we know)

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.2.owl>.

Release 7.1.1
-----

- Fix an erroneous disjoint statement on the class gist:Magnitude.
If you previously downloaded gist 7.1 you may have experienced an inference error if you attempted to run inference using Hermit.
The gist 7.1.1 release has eliminated the cause of this error.
- In addition to using the OWL files locally, you can import these files via URL directly into your ontology editor of choice(Protegé, Topbraid, etc.) The import will take care of the dependencies.

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.1.1.owl>.

Release 7.1
-----

Primarily fixes minor errors like typos in our gist 7.0 release.

Below is a brief summary of the changes that have semantic import from an inference perspective (axiom added, removed, changed, etc.) or that are backward incompatible.

- Made `gist:uniqueText` a subproperty of `gist:containedText`.
- Added `gist:Agreement` to range of `gist:governs`.
- Changed `gist:prevent`, `gist:allow` and `gist:require` to `gist:prevents`, `gist:allows`, and `gist:requires`.
- Changed restriction on `gist:Offer` to use `gist:hasDirectPart some gist:CatalogItem`.
- Removed property `gist:specifiedIn`, no longer needed.
- Changed property restriction on `gist:Account` from `gist:hasA some gist:Balance` to `gist:hasMagnitude some gist:Balance`.
- Corrected inverse property of `gist:hasDirectSubtask` to `gist:directSubtaskOf`
- Added `gist:IntellectualProperty` and `gist:PhysicalThing` to the range of `gist:governs`.
- In the definition of `gist:Requirement`, removed `gist:Conformance` from the range of `gist:requires`.

In addition to using the OWL files locally, you can import these files via URL directly into your ontology editor of choice(Protegé, Topbraid, etc.) The import will take care of the dependencies.

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.1.owl>.

Release Notes gist 7.0
-----

gist 7.0 is a major upgrade from our last released version (6.7.1). The main differences are:

- gist 7.0 is extremely modular. There are 18 modules that can be used collectively or in subsets if you don't need all the concepts in gist.
- gist 7.0 is more elegant than its predecessors. We have reduced the number of top level concepts that everything else derives from to 12. And these 12 concepts are not philosophical abstractions like endurants and perdurants, or qualia, there are normal terms whose definitions are quite close to what you already believe.
- gist 7.0 has more extensive and more-fine grained disjointness at the highest level. It turns out that in order for an upper ontology to help you avoid making logical errors in your derived enterprise or ontology, it needs to make use of disjointness. Without  disjointness, the reasoner does not find logic errors.

For documentation and OWL files regarding terms that were deprecated when moving from version 6.7.1 to 7.0, please see the sub-folder called "Deprecated terms from gist6.7.1".

In addition to using the OWL files locally, you can import these files via URL directly into your ontology editor of choice(Protegé, Topbraid, etc.) The import will take care of the dependencies.

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.0.owl>.
