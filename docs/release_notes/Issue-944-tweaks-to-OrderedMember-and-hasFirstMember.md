### Major Updates

- Added `gist:providesOrderFor` restriction to `gist:OrderedMember`. Issue [944](https://github.com/semanticarts/gist/issues/944).
- Changed filter class for `gist:isFirstMemberOf` (formerly `gist:hasFirstMember`) restriction on `gist:OrderedCollection` from `owl:Thing` to `gist:OrderedMember`. Issue [944](https://github.com/semanticarts/gist/issues/944).

### Patch Updates

- Updated `skos:scopeNote` on `gist:isFirstMemberOf` (formerly `gist:hasFirstMember`) to reflect that strict orderings *are* allowed.  Issue [944](https://github.com/semanticarts/gist/issues/944).
