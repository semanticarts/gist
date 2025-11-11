### {Major} Updates

- Renamed class `gist:CatalogItem` to `gist:DeliverableSpecification`.
  - Updated scope notes to clarify definition.
- Renamed `gist:BundledCatalogItem` to `gist:BundledDeliverableSpecification` and made it subclass of `gist:Collection`.
- Made `gist:ServiceSpecification` subclass of `gist:DeliverableSpecification` and `gist:EventSpecification`.
- Updated the `gist:offersToProvide` and `gist:offersToReceive` restrictions on `gist:Offer` to reference `gist:DeliverableSpecification`. Issue [#1255](https://github.com/semanticarts/gist/issues/1255).
