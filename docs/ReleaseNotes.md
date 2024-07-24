# gist Release Notes

## Release 13.0.0

This is a major release that includes several changes which break compatibility with previous versions of gist, most notably an entirely rearchitected model of units of measure and magnitudes and a new address model. See the [migration guide](./MajorVersionMigration.md) for documentation on updating existing gist-based ontologies and instance data. [Migration scripts and documentation](../migration/v13.0) are provided to facilitate the upgrade process.

### New Model of Units and Magnitudes

Issue [#1033](https://github.com/semanticarts/gist/issues/1033).

- Deleted all subclasses of `gist:Magnitude` except `gist:ReferenceValue`:
  - `gist:Area`
  - `gist:Balance`
  - `gist:Count`
  - `gist:Duration`
  - `gist:ElectricCurrent`
  - `gist:Extent`
  - `gist:InformationQuantity`
  - `gist:LuminousIntensity`
  - `gist:Mass`
  - `gist:MolarQuantity`
  - `gist:Monetary`
  - `gist:MonetaryPerDuration`
  - `gist:ProductMagnitude`
  - `gist:RatioMagnitude`
  - `gist:Temperature`
  - `gist:Volume`
- Deleted all subclasses of `gist:UnitOfMeasure`:
  - `gist:AreaUnit`
  - `gist:BaseUnit`
  - `gist:CoherentRatioUnit`
  - `gist:CoherentProductUnit`
  - `gist:CountingUnit`
  - `gist:CurrencyPerDurationUnit`
  - `gist:CurrencyUnit`
  - `gist:DataSizeUnit`
  - `gist:DistanceUnit`
  - `gist:ElectricalCurrentUnit`
  - `gist:LuminousIntensityUnit`
  - `gist:MassUnit`
  - `gist:MoleUnit`
  - `gist:ProductUnit`
  - `gist:RatioUnit`
  - `gist:SimpleUnitOfMeasure`
  - `gist:TemperatureUnit`
  - `gist:VolumeUnit`
- Deleted the following predicates:
  - `gist:hasAltitude`
  - `gist:hasDenominator`
  - `gist:hasMultiplicand`
  - `gist:hasNumerator`
  - `gist:hasPrecision`
  - `gist:hasStandardUnit`
  - `gist:isAspectOf`
  - `gist:unitSymbol`
  - `gist:unitSymbolHtml`
  - `gist:unitSymbolUnicode`
- Deleted all unit of measure instances:
  - `gist:_ampere`
  - `gist:_bit`
  - `gist:_candela`
  - `gist:_day`
  - `gist:_each`
  - `gist:_kelvin`
  - `gist:_kilogram`
  - `gist:_meter`
  - `gist:_millisecond`
  - `gist:_minute`
  - `gist:_mole`
  - `gist:_percent`
  - `gist:_second`
  - `gist:_USDollar`
- Added classes and predicates:
  - `gist:Discipline`
  - `gist:UnitGroup`
  - `gist:hasAccuracy`
  - `gist:hasAddend`
  - `gist:hasAspect`
  - `gist:hasBroader`
  - `gist:hasDivisor`
  - `gist:hasSubtrahend`
  - `gist:hasUnitGroup`
  - `gist:exponentOfAmpere`
  - `gist:exponentOfBit`
  - `gist:exponentOfCandela`
  - `gist:exponentOfKelvin`
  - `gist:exponentOfKilogram`
  - `gist:exponentOfMeter`
  - `gist:exponentOfMole`
  - `gist:exponentOfNumber`
  - `gist:exponentOfOther`
  - `gist:exponentOfRadian`
  - `gist:exponentOfSecond`
  - `gist:exponentOfSteradian`
  - `gist:exponentOfUSDollar`
  - `gist:symbol`
- Added aspect instances. Note the new `gistd:` namespace `<https://w3id.org/semanticarts/ns/data/gist/>`.
  - `gistd:_Aspect_altitude`
  - `gistd:_Aspect_area`
  - `gistd:_Aspect_balance`
  - `gistd:_Aspect_mass`
  - `gistd:_Aspect_probability`
  - `gistd:_Aspect_volume`
- Modified the class expression restrictions of:
  - `gist:Account`
  - `gist:ContingentEvent`
  - `gist:GeoPoint`
  - `gist:GeoRegion`
  - `gist:Offer`
  - `gist:PhysicalIdentifiableItem`
  - `gist:PhysicalSubstance`
- Modified the following classes and predicates:
  - `gist:Aspect`
  - `gist:Magnitude`
  - `gist:UnitOfMeasure`
  - `gist:hasMagnitude`
  - `gist:hasMultiplier`
  - `gist:hasPrecision`
  - `gist:conversionFactor`
  - `gist:conversionOffset`
- Added [scripts](../migration/v13.0/queries/uom_queries) for the migration of existing client ontologies and instance data.
- Added [complete documentation](../docs/models/UnitOfMeasureModel.md) on understanding and implementing the new model.

### New Address Model

Issue [#1060](https://github.com/semanticarts/gist/issues/1060).

- Removed classes and properties:
  - `gist:ElectronicMessageAddress`
  - `gist:EmailAddress`
  - `gist:PostalAddress`
  - `gist:StreetAddress`
  - `gist:TelephoneNumber`
  - `gist:hasCommunicationAddress`
- Added subclasses of `gist:Address`:
  - `gist:ElectronicAddress`
  - `gist:PhysicalAddress`
- Added subclasses of `gist:Category` for characterizing new addresses:
  - `gist:AddressUsageType`
  - `gist:ElectronicAddressType`
  - `gist:PhysicalAddressType`
- Added the object property `gist:refersTo`.

### Other Major Updates

- `gist:hasSuperCategory` and subproperties. Issue [#1115](https://github.com/semanticarts/gist/issues/1115).
  - Removed `gist:hasSuperCategory`, `gist:hasDirectSuperCategory` and `gist:hasUniqueSuperCategory`.
  - `gist:hasSuperCategory` is replaced by `gist:hasBroader`.
  - `gist:hasDirectSuperCategory` is replaced by `gist:hasDirectBroader`.
  - `gist:hasUniqueSuperCategory` is replaced by `gist:hasUniqueBroader`.
- Replaced the following predicates with their semantic inverses. Issue [#1070](https://github.com/semanticarts/gist/issues/1070).

    | gist 12 | gist 13 |
    | --------- | ------- |
    |`hasDirectPart` | `isDirectPartOf`|
    |`hasFirstMember` | `isFirstMemberOf`|
    |`hasMember` | `isMemberOf`|
    |`hasPart` | `isPartOf`|
- Removed `gist:endDateTime` restriction from the formal definition of `gist:TemporalRelation`. Issue [#878](https://github.com/semanticarts/gist/issues/878).
- Added `gist:startDateTime`, `gist:endDateTime`, and duration restrictions to the formal definition of `gist:TimeInterval`. Modified annotations for `gist:startDateTime` and `gist:endDateTime` to clarify usage. Issues [#925](https://github.com/semanticarts/gist/issues/925) and [#1112](https://github.com/semanticarts/gist/issues/1112).
- Removed sensor-related classes and properties. Issue [#462](https://github.com/semanticarts/gist/issues/462).
  - Classes removed:
    - `gist:Actuator`
    - `gist:Controller`
    - `gist:ControllerType`
    - `gist:MessageDefinition`
    - `gist:PhenomenaType`
    - `gist:Sensor`
  - Predicates removed:
    - `gist:directs`
    - `gist:hasViableRange`
    - `gist:respondsTo`
- Updated `gist:MediaType` and `gist:uniqueText`. Issue [633](https://github.com/semanticarts/gist/issues/633).
  - Added `gist:uniqueText` restriction to `gist:MediaType`.
  - Added example and scope note annotations to `gist:MediaType`.
  - Added `gist:MediaType` to `gist:domainIncludes` for `gist:uniqueText`.
- Made `gist:Specification` a direct subclass of `gist:Intention`. Issue [#831](https://github.com/semanticarts/gist/issues/831).
- Removed domain and range from `gist:isGovernedBy`. Issue [#899](https://github.com/semanticarts/gist/issues/899).
- Ordered collections and ordered members:
  - Added `gist:providesOrderFor` restriction to `gist:OrderedMember`. Issue [#944](https://github.com/semanticarts/gist/issues/944).
  - Changed filter class for `gist:isFirstMemberOf` (formerly `gist:hasFirstMember`) restriction on `gist:OrderedCollection` from `owl:Thing` to `gist:OrderedMember`. Issue [#944](https://github.com/semanticarts/gist/issues/944).
  - Updated `skos:scopeNote` on `gist:isFirstMemberOf` (formerly `gist:hasFirstMember`) to reflect that strict orderings *are* allowed.  Issue [#944](https://github.com/semanticarts/gist/issues/944).
- Upgraded gist license to Creative Commons 4.0 International License. Issue [244](https://github.com/semanticarts/gist/issues/244).
- Made changes to `gist:Offer`. Issue [#528](https://github.com/semanticarts/gist/issues/528).
  - Added `gist:offers` predicate.
  - Modified restriction on `gist:Offer` to refer to `gist:offers`.
- Removed `gist:occupiesGeographically` and `gist:occupiesGeographicallyPermanently` and replaced with `gist:hasPhysicalLocation` in class restriction. Issue [#809](https://github.com/semanticarts/gist/issues/809).
- Shortened local name of `gist:isGeographicallyContainedin` to `isGeoContainedin`. Issue [#812](https://github.com/semanticarts/gist/issues/812).
- Removed classes and properties deprecated since the last major release and made corresponding updates to axioms referencing those terms. Issue [#947](https://github.com/semanticarts/gist/issues/947).
  - Removed `gist:isCharacterizedAs` and associated axiom on `gist:Event`. (Original issue: [#820](https://github.com/semanticarts/gist/issues/820).)
  - Removed `gist:isRecognizedDirectlyBy`.
  - Changes to contained text properties. (Original issue: [#372](https://github.com/semanticarts/gist/issues/372).)
    - Removed property `gist:tagText`.
    - Changed restriction on `gist:Tag` to reference `gist:containedText` rather than `gist:tagText`.
    - Made `gist:uniqueText` a subproperty of `gist:containedText`.
  - Removed `gist:unitSymbol`, `gist:unitSymbolHtml`, and `gist:UnitSymbolUnicode`. The first is replaced with `gist:symbol` and the latter two are removed with no replacement. (Original issue: [#531](https://github.com/semanticarts/gist/issues/531).)
- Removed domain and range constraints from `gist:allows`. Issue [#1063](https://github.com/semanticarts/gist/issues/1063).

### Minor Updates

- Added `gist:Determination` as a subclass of `gist:Event`. Issue [317](https://github.com/semanticarts/gist/issues/317).
- Requirements and Specifications:
  - Updated definition of `gist:Requirement`. Issue [#831](https://github.com/semanticarts/gist/issues/831).
  - Added class `gist:EventSpecification`. Issue [#831](https://github.com/semanticarts/gist/issues/831).
  - Added and updated annotations for `gist:Specification`. Issue [#831](https://github.com/semanticarts/gist/issues/831).
- Added a `skos:historyNote` to document the dates of the most recent gist releases. Issue [#1017](https://github.com/semanticarts/gist/issues/1017).

### Documentation Updates

- Added section to [gist Style Guide](./gistStyleGuide.html) on use of `gist:nonConformingLabel` annotation.
- Updated [gist Style Guide](./gistStyleGuide.html) to define best practices for:
  - Negative examples in `skos:example`. Issue [#511](https://github.com/semanticarts/gist/issues/511).
  - Use of ontology terms in annotations. Issue [#966](https://github.com/semanticarts/gist/issues/966)
  - Inverse properties. Issue [#1086](https://github.com/semanticarts/gist/issues/1086).
- Modified definition of a patch release to fully comply with [Semver](https://semver.org/spec/v2.0.0.html). Issue [#973](https://github.com/semanticarts/gist/issues/973).
- Changed name of documentation directory in release package from `Documentation` to `docs`. Added `models` subdirectory for documentation of specific models.

### Infrastructure Updates

- Updated build configuration to materialize subclass inferences during bundling. Issue [#1051](https://github.com/semanticarts/gist/issues/1051).
- Combined two bundle actions into one. Issue [#1058](https://github.com/semanticarts/gist/issues/1058).
- Updated to latest version of EDM Council serializer (version 2.0 of rdf-toolkit.jar). Issue [#1082](https://github.com/semanticarts/gist/issues/1082).
- Changed filename of generated RDFS annotations from `rdfsAnnotations` to `gistRdfsAnnotations`. Issue [#1041](https://github.com/semanticarts/gist/issues/1041).

Import URL: <https://w3id.org/semanticarts/ontology/gistCore13.0.0>.

## Release 12.1.0

### Minor Updates

- Deprecated the following properties:
  - `gist:isCharacterizedAs`. Issue [#820](https://github.com/semanticarts/gist/issues/820).
  - `gist:isRecognizedDirectlyBy`. Issue [#607](https://github.com/semanticarts/gist/issues/607).
  - `gist:occupiesGeographically` and `gist:occupiesGeographicallyPermanently`. Issue [#809](https://github.com/semanticarts/gist/issues/809).
  - `gist:tagText` (to be replaced by the existing `gist:containedText`). Issue [#372](https://github.com/semanticarts/gist/issues/372).
- Extended the utility of symbol predicates. Issue [#531](https://github.com/semanticarts/gist/issues/531).
  - Deprecated `gist:unitSymbol`, `gist:unitSymbolHtml`, and `gist:unitSymbolUnicode`.
  - Added predicate `gist:symbol`.
  - Added `gist:symbol` triples for existing units, anticipating the removal of `gist:unitSymbol`.
- Added datatype property `gist:idText`. Issue [#874](https://github.com/semanticarts/gist/issues/874).
- Changed `gistCore` import in `gistSubClassAssertions` to use a versioned IRI, and added its version IRI. Issue [#897](https://github.com/semanticarts/gist/issues/897).
- Added skeletal definitions for SKOS terms. Issue [#934](https://github.com/semanticarts/gist/issues/934).
- Updated annotations (`skos:definition`, `skos:scopeNote`, and `skos:example`) of the following terms:
  - `gist:Event`. Issue [#950](https://github.com/semanticarts/gist/issues/950).
  - `gist:Category`. Issue [#968](https://github.com/semanticarts/gist/issues/968).
  - `gist:Magnitude`. Issue [#965](https://github.com/semanticarts/gist/issues/965).
  - `gist:Message`. Issue [#396](https://github.com/semanticarts/gist/issues/396).
  - `gist:MonetaryPerDuration`. Issue [#912](https://github.com/semanticarts/gist/issues/912).
  - `gist:Specification`. Issue [#431](https://github.com/semanticarts/gist/issues/431).
  - `gist:Transaction`. Issue [#521](https://github.com/semanticarts/gist/issues/521).
  - `gist:containedText`, `gist:Tag`, and `gist:Text`. Issue [#372](https://github.com/semanticarts/gist/issues/372).
  - `gist:description`. Issue [#1015](https://github.com/semanticarts/gist/issues/1015).
  - `gist:hasMember`. Issue [#439](https://github.com/semanticarts/gist/issues/439).
  - `gist:hasNumerator`, `gist:hasDenominator`, `gist:hasMultiplier`, and `gist:hasMultiplicand`. Issue [#821](https://github.com/semanticarts/gist/issues/821).
  - `gist:hasParticipant`. Issue [#787](https://github.com/semanticarts/gist/issues/787).
  - `gist:hasPhysicalLocation`. Issue [#809](https://github.com/semanticarts/gist/issues/809).
  - `gist:isRecognizedBy`. Issue [#607](https://github.com/semanticarts/gist/issues/607).
  - `gist:uniqueText`. Issue [#1004](https://github.com/semanticarts/gist/issues/1004).
- Moved SHACL prefix declarations from `gistCore` to `gistPrefixDeclarations`. Issue [#1001](https://github.com/semanticarts/gist/issues/1001).
- Changed the `owl:minCardinality 1` restriction on `gist:LivingThing` to the logically equivalent `owl:someValuesFrom`. Issue [#806](https://github.com/semanticarts/gist/issues/806).

### Patch Updates

- Fixed typo in the `skos:scopeNote` of `gist:_percent`. Issue [#961](https://github.com/semanticarts/gist/issues/961).
- Documentation updates:
  - Minor updates to documentation of [gist change and release management](https://github.com/semanticarts/gist/blob/main/docs/ChangeAndReleaseManagement.md) and [contributing to gist](https://github.com/semanticarts/gist/blob/main/docs/Contributing.md). Issues [#918](https://github.com/semanticarts/gist/issues/918), [#993](https://github.com/semanticarts/gist/issues/918).
  - Added detail to the [gist deprecation and deletion policy](https://github.com/semanticarts/gist/blob/main/docs/DeprecationAndDeletionPolicy.md).
  - Updated all Markdown files in the repository to use `ATX` rather than `SETEXT` header style. Issue [#901](https://github.com/semanticarts/gist/issues/901).
- Infrastructure updates:
  - Renamed branch `master` to `main`. Issue [#865](https://github.com/semanticarts/gist/issues/865).
  - Updated `bundle.yaml` to use `onto_tool excludes` option. [Issue #962](https://github.com/semanticarts/gist/issues/962).
  - Updated `tools/setup.cmd` to configure git to ignore changes to executable flags on files.
  - Moved ontology files into a root-level `ontologies` folder. [Issue #904](https://github.com/semanticarts/gist/issues/904).
  - Serializer `pre-commit` hook:
    - Fixed permissions problem on MacOS. Issue [#1007](https://github.com/semanticarts/gist/issues/1007).
    - Prevent corruption of binary files. Issue [#1010](<https://github.com/semanticarts/gist/issues/1010>). Also related to issue [#934](https://github.com/semanticarts/gist/issues/934).

Import URL: <https://w3id.org/semanticarts/ontology/gistCore12.1.0>.

## Release 12.0.1

### Patch Updates

- Added missing `owl:Thing` assertions to gist instances to ensure that `rdfs:isDefinedBy` assertions are generated during the release bundling process. Issue [#775](https://github.com/semanticarts/gist/issues/775).
- Updated description of gist Forum in README. Issue [#917](https://github.com/semanticarts/gist/issues/917).
- Changed smart single quotes to straight quotes for the apostrophes in `docs/Namespace.md`. Issue [#919](https://github.com/semanticarts/gist/issues/919).
- Updated `bundle.yaml` to exclude the `gistValidationAnnotations` ontology from the release package. Issue [#922](https://github.com/semanticarts/gist/issues/922).
- Updated the Python HTML renderer to fix errors in display of gist documentation in the browser. Issue [#923](https://github.com/semanticarts/gist/issues/923).

Import URL: <https://w3id.org/semanticarts/ontology/gistCore12.0.1>.

## Release 12.0.0

This is a major release which includes several changes which break compatibility with previous versions of gist. See the [migration guide](./MajorVersionMigration.html) for documentation on updating existing gist-based ontologies and instance data. Migration scripts are included to facilitate the upgrade process.

### Major Updates

- Changed the gist ontology IRIs and namespace IRI to the `w3id` domain. Issues [#683](https://github.com/semanticarts/gist/issues/683), [#853](https://github.com/semanticarts/gist/issues/853), [#859](https://github.com/semanticarts/gist/issues/859).
  - The gist ontology IRIs have changed from `https://ontologies.semanticarts.com/o/<ontology-name>` to `https://w3id.org/semanticarts/ontology/<ontology-name>`. For example, `https://ontologies.semanticarts.com/o/gistCore` is now `https://w3id.org/semanticarts/ontology/gistCore`.
  - The gist namespace has changed from `https://ontologies.semanticarts.com/gist/` to `https://w3id.org/semanticarts/ns/ontology/gist/`.
- Deleted all inverse properties. Issue [#506](<https://github.com/semanticarts/gist/issues/506>).
  - For each pair of inverses, the property deemed clearest, simplest, and/or most useful was retained.
  - Axioms referring to the deleted properties were reformulated using `owl:inverseOf`.
  - Breakdown:

      | Properties retained in gist | Inverse properties removed from gist |
      | ----------- | ----------- |
      `hasDirectPart` | `isDirectPartOf`
      `hasDirectSubTask` | `isDirectSubTaskOf`
      `hasDirectSuperCategory` | `hasDirectSubCategory`
      `hasMember` | `isMemberOf`
      `hasNavigationalParent` | `hasNavigationalChild`
      `hasPart` | `isPartOf`
      `hasSubTask` | `isSubTaskOf`
      `hasSuperCategory` | `hasSubCategory`
      `isAbout` | `isDescribedIn`
      `isAffectedBy` | `affects`
      `isBasedOn` | `isBasisFor`
      `isGeographicallyContainedIn` | `containsGeographically`
      `isGovernedBy` | `governs`
      `isIdentifiedBy` | `identifies`
      `isRecognizedBy` | `recognizes`
      `occupiesGeographically` | `isGeographicallyOccupiedBy`
      `occupiesGeographicallyPermanently` | `isGeographicallyPermanentlyOccupiedBy`
      `precedes` | `follows`
      `precedesDirectly` | `followsDirectly`
- Changes related to tasks, projects, and events. Issue [#760](https://github.com/semanticarts/gist/issues/760).
  - Renamed `gist:TaskExecution`, `gist:ScheduledTaskExecution`, and `gist:ProjectExecution` to `gist:Task`, `gist:ScheduledTask`, and `gist:Project`, respectively.
  - These classes are no longer limited to the execution of a task or project, but include proposed and planned events as well.
  - Removed datetime restrictions on `gist:Event`.
  - Replaced `gist:PlannedEvent` with `gist:ScheduledEvent`.
  - Added `skos:scopeNote`s and `skos:example`s to clarify meaning and usage.
  - Added `skos:prefLabel` to `gist:ScheduledEvent`. Issue [#844](https://github.com/semanticarts/gist/issues/844).
  - Updated formal definition of `gist:ContingentEvent`. Issue [#776](https://github.com/semanticarts/gist/issues/776).
  - Removed datetime restrictions from `gist:ContingentEvent` and added a restriction on property `gist:isTriggeredBy`.
- Deleted classes and properties related to time zones. Issue [#650](https://github.com/semanticarts/gist/issues/650). Terms removed:
  - `gist:TimeZone`
  - `gist:TimeZoneStandard`
  - `gist:hasOffsetToUniversal`
  - `gist:usesTimeZoneStandard`
- Deleted properties `gist:hasSubTask` and `gist:hasDirectSubTask`; `gist:hasPart` and `gist:hasDirectPart`, respectively, to be used instead. Issue [#733](https://github.com/semanticarts/gist/issues/733).
- Deleted class `gist:Percentage`. Issue [#785](https://github.com/semanticarts/gist/issues/785).
- Deleted class `gist:TreatyOrganization`. Issue [#766](https://github.com/semanticarts/gist/issues/756).

### Minor Updates

- Added unit of measure for percents. Issue [#785](https://github.com/semanticarts/gist/issues/785).
- Broadened definition of `gist:isAllocatedBy` to include entities other than IDs, and added clarifying annotations. Issue [#530](https://github.com/semanticarts/gist/issues/530).
- Added `gist:TimeInterval` class. Issue [#786](https://github.com/semanticarts/gist/issues/786).
- Added the `gistSubClassAssertions` ontology containing explicit subclass axioms that are logically entailed but not inferred by some reasoners. Issue [#714](https://github.com/semanticarts/gist/issues/714).
  - Added `materialize_subclass_inferences.py` script to generate these assertions. Issue [#819](https://github.com/semanticarts/gist/issues/819).
  - Amended `bundle.yaml` file to include `gistSubClassAssertions` ontology files in the release package. Issue [#714](https://github.com/semanticarts/gist/issues/714).
- Added `MonetaryPerDuration` and `CurrencyPerDurationUnit` classes. Issue [#846](https://github.com/semanticarts/gist/issues/846).
- Updated definition and corrected label of `gist:IntergovernmentalOrganization`. Issues [#756](https://github.com/semanticarts/gist/issues/756), [#766](https://github.com/semanticarts/gist/issues/766).

### Patch Updates

- Deleted the `gistDeprecated` ontology based on [updated deprecation and deletion policy](DeprecationAndDeletionPolicy.md). Issues [#817](https://github.com/semanticarts/gist/issues/817), [#835](https://github.com/semanticarts/gist/issues/835).
  - Moving forward, terms deprecated in minor releases will be retained in `gistCore`.
  - Added annotation property `gist:isSupersededBy` to link a deprecated term to its replacement, if there is one.
- Upgraded to version `1.14.2` of the [EDM RDF serializer](https://github.com/edmcouncil/rdf-toolkit) which is applied in a pre-commit hook during development. Issue [#774](https://github.com/semanticarts/gist/issues/774).
  - The new `-sni` option is used to remove `owl:NamedIndividual` assertions on instances defined by gist, such as `gist:_second`.
- Modifications to pre-commit hook. Issues [#794](https://github.com/semanticarts/gist/issues/794), [#794](https://github.com/semanticarts/gist/issues/794), [#797](https://github.com/semanticarts/gist/issues/797),[#823](https://github.com/semanticarts/gist/issues/823).
  - Modified the serialize pre-commit hook so it:
    - Makes sure the script starts in the root directory of the repository.
    - Adds file to the commit after the sed command.
    - Preserves file permissions during processing steps.
    - Ignores, rather than errors on, files that have been deleted.
  - Added new "root" pre-commit hook which:
    - Prevents commits to these branches: develop, main, master.
    - Then runs the serializer pre-commit hook.
  - Added a `setup.cmd` file to install the pre-commit hook into the `.git/hooks` directory. This script will work on Mac, Linux, and Windows.
  - Updated user documentation to reflect these changes.
- Fixed broken links to gist logo in `docs/README.*`. Issue [#750](https://github.com/semanticarts/gist/issues/750).
- Added scripts to migrate from `11.x.x` versions to version `12.0.0`. Issue [#816](https://github.com/semanticarts/gist/issues/816).
- Documentation updates. Issues [#567](https://github.com/semanticarts/gist/issues/567), [#576](https://github.com/semanticarts/gist/issues/576), [#734](https://github.com/semanticarts/gist/issues/734), [#736](https://github.com/semanticarts/gist/issues/736), [#758](https://github.com/semanticarts/gist/issues/758), [#801](https://github.com/semanticarts/gist/issues/801), [#802](https://github.com/semanticarts/gist/issues/802), [#810](https://github.com/semanticarts/gist/issues/810).
- Miscellaneous non-semantic annotation updates. Issues [#734](https://github.com/semanticarts/gist/issues/734),[#753](https://github.com/semanticarts/gist/issues/753), [#758](https://github.com/semanticarts/gist/issues/758).

Import URL: <https://w3id.org/semanticarts/ontology/gistCore12.0.0>.

## Release 11.1.0

### Minor Updates

- Renamed `gist:Task`, `gist:ScheduledTask` and `gist:Project` to `gist:TaskExecution`, `gist:ScheduledTaskExecution` and  `gist:ProjectExecution`, respectively. Issue [#590](https://github.com/semanticarts/gist/issues/590).
- Updated class `gist:Collection` to allow for empty collections. Issue [#570](https://github.com/semanticarts/gist/issues/570).
- Deprecated `gist:Group`. Issue [#663](https://github.com/semanticarts/gist/issues/663).
- Deprecated `gist:_greenwichTimeZone`, `gist:_one_day`, `gist:_one_millisecond`, and `gist:_one_minute`. Issue [#692](https://github.com/semanticarts/gist/issues/692).
- Fixed bug: `gist:isRecordedAt` is now a subproperty of `gist:atDateTime` instead of `gist:actualEndDateTime`. Issue [#726](https://github.com/semanticarts/gist/issues/726).
- Added new property `gist:hasFirstMember`. Issue [#549](https://github.com/semanticarts/gist/issues/549).
- Updates related to `gist:isConnectedTo`:
  - Made the property symmetric. Issue [#699](https://github.com/semanticarts/gist/issues/699).
  - Replaced it in the restriction on `gist:TemporalRelation` with `gist:hasParticipant`. Issue [#706](https://github.com/semanticarts/gist/issues/706).
- Replaced `rdfs:range` on `gist:conformsTo` with `gist:rangeIncludes`. Issue [#700](https://github.com/semanticarts/gist/issues/700).
- Added the inadvertently omitted predicate `gist:follows`. Issue [#300](https://github.com/semanticarts/gist/issues/300).
- Changed superproperty `gist:startDateTime` to `gist:actualStartDateTime` in formal definition of `gist:ContemporaryEvent`. Issue [#696](https://github.com/semanticarts/gist/issues/696).

### Patch Updates

- Added `gist:domainIncludes gist:Text` to `gist:uniqueText`.
- Improved the clarity and accuracy of annotations on several terms, including definitions, examples, and scope notes:
  - `gist:Building`: Issue [#482](https://github.com/semanticarts/gist/issues/482).
  - `gist:PhysicalSubstance` and `gist:PhysicalIdentifiableItem`: Issue [#644](https://github.com/semanticarts/gist/issues/644).
  - `gist:uniqueText`: Issue[#577](https://github.com/semanticarts/gist/issues/577).
  - `gist:precedes`, `gist:precedesDirectly`, and `gist:followsDirectly` These predicates no longer apply to objects at the same position. Issue [#300](https://github.com/semanticarts/gist/issues/300).
  - `gist:Template` [#408](https://github.com/semanticarts/gist/issues/408).
- Added SHACL `PrefixDeclaration`s for prefixes used in the gist ontology. The declaration for `gist:` is in the gist core ontology, and additional prefixes are included in a separate ontology file. Issue [#684](https://github.com/semanticarts/gist/issues/684).
- Fixed text definition of `gist:actualStartDateTime`. [#689](https://github.com/semanticarts/gist/issues/689).

Import URL: <https://ontologies.semanticarts.com/o/gistCore11.1.0>.

## Release 11.0.0

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
- Improved definitions of 'navigational' predicates, per issue [#523](https://github.com/semanticarts/gist/issues/523).
- Modified `skos:definition` of `gist:Message` to match formal definitions, per issue [#194](https://github.com/semanticarts/gist/issues/194).
- Removed min cardinality of zero restriction on `ProductUnit`, per issue [#582](https://github.com/semanticarts/gist/issues/582).
- Improved textual definition of `gist:Task`, per issue [#625](https://github.com/semanticarts/gist/issues/625).
- Change predicate `hasJurisdictionOver` to `isUnderJurisdictionOf` (bug fix). Issue [#637](https://github.com/semanticarts/gist/issues/637).
- Clarified restrictions on `gist:OrderedMember`. Issue [#574](https://github.com/semanticarts/gist/issues/574).

Import URL: <https://ontologies.semanticarts.com/o/gistCore11.0.0>.

## Release 10.0.0

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

## Release 9.7.0

### Minor Updates

- Deprecated `gist:Room`. Issue [#102](https://github.com/semanticarts/gist/issues/102).

### Patch Updates

- Updated annotations for the following properties regarding the hasDirectX/hasX pattern. Issue [#115](https://github.com/semanticarts/gist/issues/115)
    - `geoContains`, `geoContainedIn`
    - `directPartOf`,`hasDirectPart`
    - `directlyPrecededBy`, `directlyPrecedes`
- Declare `gist:identifies` as `owl:FunctionalProperty` rather than `owl:InverseFunctionalProperty` (bug fix). Issue [#180](https://github.com/semanticarts/gist/issues/180).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.7.0>.

## Release 9.6.0

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

## Release 9.5.0

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

## Release 9.4.0

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

## Release 9.3.0

- Merged into a single module/file all of gist except the gistDeprecated module.  Fixes issue [#292](https://github.com/semanticarts/gist/issues/292).
- Removed import diagram generation and catalog files from bundling. Fixes issue [#309](https://github.com/semanticarts/gist/issues/309).
- Amended bundle.yaml to add rdfs:isDefinedBy to all ontology terms during release bundling process. Fixes issue [#266](https://github.com/semanticarts/gist/issues/266).
- Added gist:EmailAddress as a subclass of gist:ElectronicMessageAddress. Fixes issue [#99](https://github.com/semanticarts/gist/issues/99).
- Changed gist:orderedMemberOf from Inverse Functional to Functional. Fixes issue [#262](https://github.com/semanticarts/gist/issues/262).
- Added gist:Collection as the range, instead of domain, of gist:memberOf. Fixes issue [#142](https://github.com/semanticarts/gist/issues/142).
- Removed redundant disjoints. Fixes issue [#254](https://github.com/semanticarts/gist/issues/254).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.3.0>.

## Release 9.2.0

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

## Release 9.1.0

- Reformatted all files to match uniform serialization.
- Corrected restriction for `gist:Collection`.
- Provided missing labels for classes and properties.
- Corrects issues [#72](https://github.com/semanticarts/gist/issues/72), [#91](https://github.com/semanticarts/gist/issues/91), [#95](https://github.com/semanticarts/gist/issues/95), [#96](https://github.com/semanticarts/gist/issues/96), [#97](https://github.com/semanticarts/gist/issues/97), [#98](https://github.com/semanticarts/gist/issues/98), [#101](https://github.com/semanticarts/gist/issues/101), [#122](https://github.com/semanticarts/gist/issues/122), and [#145](https://github.com/semanticarts/gist/issues/145).
- Removed outdated Visio and PDF files, documentation is now auto-generated as part of the release process.
- gistWiki has been removed.

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.1.0>.

## Release 9.0

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

## Release 8.0

This major version primarily changed all concept URIs to use `/` instead of `#`
Additionally, gistWiki is no longer included by gistCore.

Import URL: <http://ontologies.semanticarts.com/o/gistCore8.0.0>.

## Release 7.5

This version focused on making the import structure simpler and flatter, in order to make it easier for people to use subsets of gist if they want to.  Because all of gist is in one name space this was relatively easy to do and will have very little impact on anyone who is using gist 7.* (see the change log there were a few changes that you may want to review).

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.5.owl>.

## Release 7.4

Gist 7.4 was an internal release.

## Release 7.3

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

## Release 7.2

- Add wiki and rdfshape capability
- Removed some redundant assertions, and moved some comments to the ontology where the concept was first introduced.
- Removed `currencyValue` in favor of `decimalValue`
- Upgrades domains on some date properties and `hasCommunicationAddress`
- Deprecated a lot of the measurement stuff that wasn't being used (as far as we know)

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.2.owl>.

## Release 7.1.1

- Fix an erroneous disjoint statement on the class gist:Magnitude.
If you previously downloaded gist 7.1 you may have experienced an inference error if you attempted to run inference using Hermit.
The gist 7.1.1 release has eliminated the cause of this error.
- In addition to using the OWL files locally, you can import these files via URL directly into your ontology editor of choice(Protegé, Topbraid, etc.) The import will take care of the dependencies.

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.1.1.owl>.

## Release 7.1

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

## Release Notes gist 7.0

gist 7.0 is a major upgrade from our last released version (6.7.1). The main differences are:

- gist 7.0 is extremely modular. There are 18 modules that can be used collectively or in subsets if you don't need all the concepts in gist.
- gist 7.0 is more elegant than its predecessors. We have reduced the number of top level concepts that everything else derives from to 12. And these 12 concepts are not philosophical abstractions like endurants and perdurants, or qualia, there are normal terms whose definitions are quite close to what you already believe.
- gist 7.0 has more extensive and more-fine grained disjointness at the highest level. It turns out that in order for an upper ontology to help you avoid making logical errors in your derived enterprise or ontology, it needs to make use of disjointness. Without  disjointness, the reasoner does not find logic errors.

For documentation and OWL files regarding terms that were deprecated when moving from version 6.7.1 to 7.0, please see the sub-folder called "Deprecated terms from gist6.7.1".

In addition to using the OWL files locally, you can import these files via URL directly into your ontology editor of choice(Protegé, Topbraid, etc.) The import will take care of the dependencies.

Import URL: <http://ontologies.semanticarts.com/o/gistCore7.0.owl>.
