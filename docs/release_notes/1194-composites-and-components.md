### Major Updates

- Deleted `gist:Artifact`. Issue [#385](https://github.com/semanticarts/gist/issues/385).
  - `gist:Content`, `gist:Component`, and `gist:IntellectualProperty` became top-level classes.
  - `gist:Building` and `gist:Equipment` remain within the `gist:PhysicalIdentifiableItem` hierarchy.
- Composites and components. Issue [#1194](https://github.com/semanticarts/gist/issues/1194).
  - Added abstract class `gist:Composite` as the superclass of existing classes `gist:Collection`, `gist:Network`, and `gist:System`.
  - Made `gist:NetworkLink`, `gist:NetworkNode`, and `gist:OrderedMember` subclasses of `gist:Component`.
  - Updated formal definitions and annotations of some of the existing classes.
