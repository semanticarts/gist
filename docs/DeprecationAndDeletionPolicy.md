# gist Deprecation and Deletion Policy

## The Deprecation-Deletion Cycle

- Any ontology modification resulting in a change in reasoning is a major change; see [_Change and Release Management_](./ChangeAndReleaseManagement.md).
- Changing a local name constitutes a removal plus an addition and is therefore a major change.
- Deprecation is a minor change, since the deprecated term is still available for use.
- A patch release may not contain deprecations other than bug fixes (e.g., misspelling of a local name).
- Terms to be removed enter a _deprecation-deletion cycle_.
- If the next release is not a major update, terms must be deprecated rather than deleted.
- Existing use of deprecated terms in extension ontologies can be maintained, but users should not create new references to these terms. Rather, they should future-proof by using the new term, if there is one.
- If the term slated for removal is referenced by axioms in other gist terms, the term cannot be deprecated in a minor release. The change or removal must wait until the next major release, when the references to it can be appropriately modified or removed.
- A major release contains no deprecations: all currently deprecated terms are deleted, and other terms will be directly deleted rather than deprecated first.

## How to Deprecate

- Add an `owl:deprecated true` annotation to the term.
- If the deprecated term is directly replaced by another equivalent term, add an `owl:equivalentClass` or `owl:equivalentProperty` assertion pointing to the replacement. This occurs in the case of simple renaming.
- If the deprecated term is superseded by another term, add the annotation `gist:isSupersededBy` pointing to the latter. This could be an exact match (in the case of simple renaming), an approximate match (in the case of renaming and some semantic change), or subsumption. Note that in the case of an exact match, the deprecated term is  _both_ equivalent to _and_ superseded by the other term.
- Each major release project includes an issue documenting the updates required to delete the deprecated term in the major release; reate this issue if it does not already exist. Each item should be included in a separate comment so it is possible to link to it. See issue [#947](https://github.com/semanticarts/gist/issues/947) for release `13.0.0` as an example.
- Add the following editorial note to the deprecated term: "See guidance on removing this term in the next major release at <https://github.com/semanticarts/gist/issues/947#issuecomment-1679565100>." (for example).
- In the next major release, submit a PR to make these changes.
