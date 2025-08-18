
### Major Updates

- Delete `gist:Artifact` class.  Delete `gist:Component` class.  Move `gist:Content` and `IntellectualProperty` to top-level classes.  Move `gist:System` and `gist:Network`to subclasses of `gist:Collection`.  Remove `gist:Building` and `gist:Equipment` as subclasses of `gist:Artifact`.  `gist:Building` and `gist:Equipment` will remain subclasses of `gist:PhysicalIdentifiableItem`.  Issue https://github.com/semanticarts/gist/issues/385