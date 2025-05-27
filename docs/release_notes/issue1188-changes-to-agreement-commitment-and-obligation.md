### Major Updates

- Changes to `gist:Commitment`, `gist:Agreement`, and `gist:Obligation`. Issue [#1188](https://github.com/semanticarts/gist/issues/1188).
  - Deleted class `gist:Obligation`.
  - Changed the definition of `gist:Agreement` to no longer reference `gist:Obligation`. 
  - `gist:Agreement` is no longer a subclass of `gist:Commitment`. 
  - `gist:Agreement` and `gist:Commitment` are now direct subclasses of `gist:Intention`. 
  

### Minor Updates
- Changes to `gist:Commitment`, `gist:Agreement`, and removal of `gist:Obligation`. Issue [#1188](https://github.com/semanticarts/gist/issues/1188).
  - Added `skos:scopeNote` to `gist:Commitment` which makes clear the unilateral-ness of the new definition. 
  - Added `skos:scopeNote` to `gist:Agreement` which emphasizes that it is not necessary to instantiate every single commitment which makes up an agreement.
  - Added `skos:scopeNote` to `gist:Commitment` which clarifies that commitments might be binding via legal, moral, contractual, or other kinds of deontic force.
