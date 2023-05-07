gist Deprecation and Deletion Policy
=====

- Terms to be removed, including changing a local name (which constitutes a removal plus an addition), enter a deprecation-deletion cycle.
- Deletion is a major change. If the next release is not a major update, terms must be deprecated rather than deleted.
- Deprecation is a minor change, since the deprecated term is still available for use.
- A patch release may not contain deprecations.
- Existing use of deprecated terms can be maintained, but users should not create new references to these terms. Rather, they should future-proof by using the new term, if there is one.
- If the term slated for removal is referenced by other term definitions, as in a domain axiom or property restriction, such that a change to that reference constitutes a major change, the term cannot be deprecated in a minor release. The change or removal must wait until the next major release, when the references to it can be appropriately modified or removed.
- A deprecated term receives an `owl:deprecated true` annotation.
- If the deprecated term is directly replaced by another equivalent term, it will include an `owl:equivalentClass` or `owl:equivalentProperty` assertion pointing to the replacement. This occurs in the case of simple renaming.
- If the deprecated term has been superseded by another term, it receives the annotation `gist:isSupersededBy` pointing to the latter. This could be an exact match (in the case of simple renaming), an approximate match (in the case of renaming and some semantic change), or subsumption. Note that in the case of an exact match, the deprecated term is  _both_ equivalent to _and_ superseded by the other term.
- A major release contains no deprecations. That is, all currently deprecated terms are deleted, and other terms will be directly deleted rather than deprecated first.
