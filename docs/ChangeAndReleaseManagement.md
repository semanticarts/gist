Change and Release Management
=====

This document describes the Semantic Arts change and release management process for gist.

Review and Triage of Outstanding Issues
-----

- Semantic Arts ontologists meet regularly (twice monthly as of April 30, 2020) in order to review and triage GitHub issues. (Refer to [Contributing.md](Contributing.md) for guidelines on submitting an issue.)
- Issues are triaged in reverse chronological order.
- Issues are categorized in one of three ways:
  - **Will not implement**
    - Label as `closed:wontfix`, `closed:duplicate`, or `closed:can't reproduce`.
    - For duplicate issues, add the earlier issue number in a comment.
  - **Will implement**
    - Assign an implementer (could be external to SA under certain circumstances, such as when the issue submitted is external).
    - Assign or re-assign priority, impact level, and effort level. These may have been assigned by the submitter but may be revised as appropriate.
    - Tentatively assign to a release project. This may be reassigned to a later release project as needed.
    - Label as `status:triaged`.
    - Determine and document the resolution to be implemented. For small issues this can be done at the current review meeting; larger issues may require additional discussion, in which case the label `status:in review` should also be added. In such cases the assignee will prepare a summary of alternative implementations, pros and cons, rationales, etc. to be presented at the next meeting. This process will continue until reviewers agree on an implementation. Once an implementation is determined, apply the label `status:implementation specified`.
    - **Needs further review**
    - This case is similar to the will implement case, in that an assignee is designated to carry the discussion forward at a subsequent meeting; the difference is that here it is not yet agreed whether or how the issue will be addressed. Labels are applied as above.

Workflow: Implementation, Pull Requests, and Merges

- See [Contributing.md](Contributing.md).

Versions and Version Numbering
-----

Version numbers are of the form X.x.x (major.minor.patch). We follow [Semantic Versioning 2.0.0](https://semver.org/): as a guideline, but adjust as needed.

- **Major:** Non-backward-compatible (i.e., reasoning produces different results).
  - Examples: adding a restriction, domain, range.

- **Minor:** New, backward-compatible functionality. May constitute a large change to the ontology, such as addition to new module.
  - Examples: adding a class or property; removing a restriction.

- **Patch:** No new functionality except for bug fixes.
  - Examples: Fixing a typo in an annotation, changing a property that was incorrectly defined as inverse functional rather than functional.

Additional notes:

- Correction of an error, even if not backward-compatible, does not require a major release. The expectation is that users will not have implemented against an obvious error. This would be a patch.
- When a local name is altered, the original term is deprecated to make it a minor rather than major change. The deprecated term receives an `owl:equivalentClass` or `owl:equivalentProperty` assertion to the new term. Deprecated terms may be removed in a future major release. Deprecated terms reside in the `gistDeprecated.owl` file. If a user wants to use a deprecated term, he/she should import this file into his/her ontology, which in turn imports `gistCore.owl` and thus all of gist.
- Major changes should have a significant impact aside from technically modifying inferencing if this is low-impact. E.g.,changing an equivalent class axiom to a union class to a subclass axiom in order to allow new subclasses to be defined. 

Releases
-----

- Releases occur monthly, approximately on the last working day of the month, unless it is determined during a review meeting that there are not a significant number of substantive changes to warrant a release.
