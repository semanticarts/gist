### Major Updates

- Changes to `gist:Specification` sub-hierarchy.  Issue [#1255](https://github.com/semanticarts/gist/issues/1255).
  - Renamed class `gist:CatalogItem` to `gist:DeliverableSpecification` and updated scope note to clarify definition.
  - Renamed `gist:BundledCatalogItem` to `gist:BundledDeliverableSpecification` and made it subclass of `gist:Collection` as well as `gist:DeliverableSpecification`. 
  - Made `gist:ServiceSpecification` subclass of `gist:DeliverableSpecification` and `gist:EventSpecification`.
  - Updated the `gist:offersToProvide` and `gist:offersToReceive` restrictions on `gist:Offer` to reference `gist:DeliverableSpecification`.
