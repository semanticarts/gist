### Major Updates

- Changes to `gist:Commitment`, `gist:Agreement`, and `gist:Obligation`. Issue [#1188](https://github.com/semanticarts/gist/issues/1188).
  - Deleted class `gist:Obligation`.
  - Changed the definition of `gist:Agreement` to reference `gist:Commitment` rather than `gist:Obligation`. 
  - Changed definition of `gist:Commitment` to a unilateral commitment. Thus, `gist:Agreement` is no longer a subclass of `gist:Commitment`.
  - `gist:Agreement` and `gist:Commitment` are now direct subclasses of `gist:Intention`. 
  

### Minor Updates
- Updated annotations on `gist:Agreement` and `gist:Commitment`. 