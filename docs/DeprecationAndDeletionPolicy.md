gist Deprecation and Deletion Policy
=====

- Terms to be removed, including changing a local name (which constitutes a removal plus an addition), enter a deprecation-deletion cycle.
- Deletion is a major change. If the next release is not a major update, terms must be deprecated rather than deleted.
- Deprecation is a minor change, since the deprecated term is still available for use.
- A patch release may not contain deprecations.
- Existing use of deprecated terms can be maintained, but users should not create new references to these terms. Rather, they should future-proof by using the new term, if there is one.
- If the term slated for removal is referenced by other term definitions, as in a domain axiom or property restriction, such that a change to that reference constitutes a major change, the term cannot be deprecated in a minor release. The change or removal must wait until the next major release, when the references to it can be appropriately modified or removed.
- A deprecated term receives an `owl:deprecated` true assertion, as well as an `owl:equivalentClass` or `owl:equivalentProperty` assertion pointing to the new term where relevant.
- A major release contains no deprecations. That is, all currently deprecated terms are deleted, and any other terms will be directly deleted rather than deprecated first.
