Change and Release Management
=====

This document describes the Semantic Arts change and release management process for gist.

Review and Triage of Outstanding Issues
-----

- Semantic Arts ontologists meet twice monthly in order to review and triage GitHub issues and plan releases. (Refer to [Contributing.md](Contributing.md) for guidelines on submitting an issue.)
- Issues are categorized in one of three ways:
  - **Will not implement**
    - Label with one of the `closed` values: already resolved, can't reproduce, completed, duplicate, invalid, won't fix.
    - For duplicate issues, add the earlier issue number in a comment.
  - **Will implement**
    - Smaller issues:
      - Assign an implementer, who could be external to SA under certain circumstances.
      - Assign or re-assign priority, impact level, and effort level.
      - Tentatively assign to a release project. May be reassigned to a later release project as needed.
      - Where possible, determine and document the resolution to be implemented and apply the label `status: implementation specified`.
      - The assigneee implements as specified and submits a PR.
    - To address larger, major, or broader issues (e.g., rewriting a portion of the ontology, revising all annotations), a small, ad hoc working group of volunteers will be formed.
      - The label `status: in review` is applied.
      - A group leader should be selected and assigned to the issue.
      - Each group determines their own work schedule and process. There is no deadline or target date for finalizing a proposal.
      - Once the group has developed a proposal, it will be submitted as a PR and presented during one biweekly meeting, in either order or simultaneously. This does _not_ open up the entire work of the subgroup to be rehashed. If you have strong feelings about the issue you should join the working group.
      - The full group may suggest revisions, which the small group will reconvene to consider, but may or may not adopt.
      - Once the PR has been finalized and passed through the normal review process, it will be incorporated into the release schedule, generally either the next major or minor release.
  - **Needs further review**
    - This case is similar to the "will implement" case, in that an assignee is designated to carry the discussion forward at a subsequent meeting. The difference is that here it is not yet agreed whether or how the issue will be addressed. Labels are applied as above, including `status: in review`.

Workflow: Implementation, Pull Requests, and Merges
-----

- See [Contributing.md](Contributing.md).

Versions and Version Numbering
-----

Version numbers are of the form `X.x.x` (major.minor.patch). We follow [Semantic Versioning 2.0.0](https://semver.org/) as a guideline, but adjust as needed.

- **Major:** Non-backward-compatible, breaking changes, including inferencing, queries, and data conversion.
  - Examples: adding a restriction, domain, range; adding language tags to annotations.
  - Major changes should have a significant impact aside from technically modifying inferencing, if the latter is low-impact. For example, in gist 11.1.0 we removed the restriction on `gist:PhysicallyIdentifiableItem` stating that it must have an identifier. Technically, this impacts inferencing, but we considered this so low impact that it was classified as a minor change.

- **Minor:** New, backward-compatible functionality. Includes _any_ addition to the ontology, even annotation properties or introduction of a new module.
  - Examples: adding a class or property; adding a `domainIncludes` annotation; deprecation of a term; see the [Deprecation and Deletion Policy](DeprecationAndDeletionPolicy.md).

- **Patch:** No new functionality other than bug fixes.
  - Correction of an error, even if not backward-compatible, does not require a major release. The expectation is that users will not have implemented against an obvious error. This would be a patch.
  - Examples: Fixing a typo in an annotation; changing a property that was incorrectly defined as inverse functional rather than functional.
  
Release Schedule
-----

- **Major versions** are released on an ad hoc basis when there is a major update, but no more than once every six months.
- **Minor versions** are (aspirationally) released once per quarter.
