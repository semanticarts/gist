### Infrastructure Updates

- Made changes to the pre-commit hook. Issue [1214](https://github.com/semanticarts/gist/issues/1214).
  - Prefer RDF_TOOLKIT_JAVA_HOME over JAVA_HOME, since it is the more specific name.
  - If neither of those work, use a Java executable if one is available in the PATH.

### Major Updates

- Deleted `gist:Artifact`. Issue [#385](https://github.com/semanticarts/gist/issues/385).
  - `gist:Content`, `gist:Component`, and `gist:IntellectualProperty` became top-level classes.
  - `gist:Building` and `gist:Equipment` remain within the `gist:PhysicalIdentifiableItem` hierarchy.
- Composites and components. Issue [#1194](https://github.com/semanticarts/gist/issues/1194).
  - Added abstract class `gist:Composite` as the superclass of existing classes `gist:Collection`, `gist:Network`, and `gist:System`.
  - Made `gist:NetworkLink`, `gist:NetworkNode`, and `gist:OrderedMember` subclasses of `gist:Component`.
  - Updated formal definitions and annotations of some of the existing classes.
- Changed the formal definition of `gist:Tag` to prevent unwanted inferences. Issue [#1227](https://github.com/semanticarts/gist/issues/1227).
- Updated OWL restrictions to align with Semantic Arts best practices. [#1062](https://github.com/semanticarts/gist/issues/1062).
- Removed restriction from `gist:ContentExpression` and updated the definition. Issue [#1154](https://github.com/semanticarts/gist/issues/1154).
- Replaced `gist:produces` with its logical inverse, `gist:isProducedBy`. Issue [1163](https://github.com/semanticarts/gist/issues/1163).
- Updated `gist:Offer` so it supports offers to buy and swap as well as offers to sell. Issue [#1177](https://github.com/semanticarts/gist/issues/1177).
  - Replaced `gist:offers` with `gist:offersToProvide` and `gist:offersToReceive`.
  - Updated restrictions and annotations.
- Changed `gist:Text` to be a subclass of `gist:ContentExpression` rather than `gist:Content`. Issue [1186](https://github.com/semanticarts/gist/issues/1186).
- Changes to `gist:Commitment`, `gist:Agreement`, and `gist:Obligation`. Issue [#1188](https://github.com/semanticarts/gist/issues/1188).
  - Deleted class `gist:Obligation`.
  - Changed the definition of `gist:Agreement` to reference `gist:Commitment` rather than `gist:Obligation`.
  - Changed definition of `gist:Commitment` to a unilateral commitment. Thus, `gist:Agreement` is no longer a subclass of `gist:Commitment`.
  - `gist:Agreement` and `gist:Commitment` are now direct subclasses of `gist:Intention`.
- Removed `gist:Taxonomy` and updated `gist:ControlledVocabulary` annotations to indicate that it can be used for taxonomies. Issue [#1235](https://github.com/semanticarts/gist/issues/1235).
- Removed property `gist:accepts`. Issue [#1247](https://github.com/semanticarts/gist/issues/1247).
- Removed `rdfs:range xsd:string` from gist datatype properties `gist:containedText`, `gist:encryptedText`, `gist:name`, `gist:symbol`, and `gist:uniqueText`. Issue [#1300](https://github.com/semanticarts/gist/issues/1300).
- Changes to classes related to geographic location.
  - Renamed `gist:Place` to `gist:GeoLocation`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Updated annotation for `gist:GeoLocation` to say it can be a point, an area, or a volume. Issue [#939](https://github.com/semanticarts/gist/issues/939).
  - Updated annotations for subclasses of `gist:GeoLocation`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Used terms like "geographic area" instead of "geo-area". Issue [#1084](https://github.com/semanticarts/gist/issues/1084).
  - `gist:GeoRoute` is now a subclass of `gist:OrderedCollection`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - `gist:Landmark` is now a subclass only of `gist:PhysicalIdentifiableItem`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Changed class expression in definition of `gist:Landmark` from an equivalence to a subclass. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Removed class `gist:GeoSegment`. Issue [#1182](https://github.com/semanticarts/gist/issues/1182).

### Minor Updates

- Added the class `gist:KnowledgeConcept`. Issue [#1198](https://github.com/semanticarts/gist/issues/1198).
- Added range `xsd:string` to `gist:description`. Issue [#1093](https://github.com/semanticarts/gist/issues/1093).
- Updated annotations on `gist:Agreement` and `gist:Commitment`. Issue [#1188](https://github.com/semanticarts/gist/issues/1188).
- Added `gist:Assignment` class and corresponding object properties `gist:isAssignmentOf` and `gist:isAssignmentTo`. Issues [#1191](https://github.com/semanticarts/gist/issues/1191), [#1223](https://github.com/semanticarts/gist/issues/1223).
- Simplified formal definitions of `gist:GeoRegion` and `gist:UnitGroup`. Changes are purely syntactic and do not change inferencing. Issue [#1225](https://github.com/semanticarts/gist/issues/1225).
- Explicitly defined `gist:RenderedContent` to be a subclass of `gist:FormattedContent`. (This is not a major change, since reasoners would already infer this.) Issue [#1228](https://github.com/semanticarts/gist/issues/1228).
- Removed disjointness axiom between `gist:IntellectualProperty` and `gist:Intention`. Issue [#1251](https://github.com/semanticarts/gist/issues/1251).

### Patch Updates

- Updated annotations for `gist:Task` to clarify the scope of the concept. Issue [#1183](https://github.com/semanticarts/gist/issues/1183).
- Updated the definition of `gist:isGovernedBy` to eliminate circularity. Issue [#1198](https://github.com/semanticarts/gist/issues/1198).
- Added a summary of best practices for the use of OWL restrictions to the gist style guide. Issue [#1257](https://github.com/semanticarts/gist/issues/1257).
- Created guidelines for pull request reviewers (*ReviewerGuidelines*). Issue [#1285](https://github.com/semanticarts/gist/issues/1285).
- Fix broken links in documentation files. Issue [#1295](https://github.com/semanticarts/gist/issues/1295).
- Documentation updates:
  - Added instructions to the `README` on setting up a local gist repository.
  - Updated contributing guidelines.
  - Added a contributor quick reference guide.
  - Added a release note template.
- Changed the values of `rdfs:isDefinedBy` from the unversioned to the versioned gist IRI; e.g., to `https://w3id.org/semanticarts/ontology/gistCore14.0.0`. Issue [#383](https://github.com/semanticarts/gist/issues/383).
- Changed the datatype of the `gist:license` value to `xsd:anyURI`. Issue [#977](https://github.com/semanticarts/gist/issues/977).
- Change prefLabel of altitude from "area" to "altitude". Issue [#1139](https://github.com/semanticarts/gist/issues/1139).
- Modified migration documentation to describe manual work needed when a property is being replaced by its inverse. Issue [#1140](https://github.com/semanticarts/gist/issues/1140).
- Updated annotations for `gist:hasAccuracy`. Issue [#1146](https://github.com/semanticarts/gist/issues/1146).
- Added missing stubs for SKOS annotations. Issue [#1151](https://github.com/semanticarts/gist/issues/1151).
- Updated the definition of `gist:Medium` for clarity and added examples. Issue [#1162](https://github.com/semanticarts/gist/issues/1162).
- Updated the definition of `gist:Organization` to eliminate circularity. Issue [#1172](https://github.com/semanticarts/gist/issues/1172).
- Fixed link to gist download in the README. Issue [#1184](https://github.com/semanticarts/gist/issues/1184).
- Added annotations to `gist:IntellectualProperty`. Issue [#1192](https://github.com/semanticarts/gist/issues/1192).
- Minor grammar change to TemporalRelation scopeNote. Issue [#1229](https://github.com/semanticarts/gist/issues/1229).
- Added a clearer scope note to `gist:description`. Issue [#1234](https://github.com/semanticarts/gist/issues/1234).
- Improved the definition of `gist:hasRecipient`. Issue [#1239](https://github.com/semanticarts/gist/issues/1239).
- Updated annotations to differentiate `gist:hasRecipient`/`gist:goesToAgent` and `gist:hasGiver`/`gist:comesFromAgent` and align definitions of `gist:goesToPlace`/`gist:goesToAgent` and `gist:comesFromPlace`/`gist:comesFromAgent`. Issue [#1024](https://github.com/semanticarts/gist/issues/1024).
