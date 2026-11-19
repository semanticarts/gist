### Patch Updates

- Added formal definitions to the following for issue [#1481](https://github.com/semanticarts/gist/issues/1481):
  - `gist:DeliverableSpecification`: added an axiom allowing a `gist:Specification` with either `gist:offersToProvide` or `gist:offersToReceive` from a `gist:Offer` to be inferred into the `gist:DeliverableSpecification` class.
  - `gist:Requirement`: Allowing the class to be inferred into if a `gist:Intention gist:requires` a `gist:Behavior`.
