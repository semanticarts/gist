# Change and Release Management <!-- omit in toc -->

- [Review and Triage of Outstanding Issues](#review-and-triage-of-outstanding-issues)
- [Workflow: Implementation, Pull Requests, and Merges](#workflow-implementation-pull-requests-and-merges)
- [Versions and Version Numbering](#versions-and-version-numbering)
- [Release Schedule](#release-schedule)

This document describes the Semantic Arts change and release management process for gist.

## Review and Triage of Outstanding Issues

- Semantic Arts ontologists meet twice monthly to review and triage GitHub issues and plan releases. (Refer to [*Contributing*](Contributing.md) for guidelines on submitting an issue.)
- Issues are categorized in one of three ways:
  - **Will not implement**
    - Add the reason in a comment. For duplicate issues, add the earlier issue number in the comment.
  - **Will implement**
    - Smaller issues:
      - Assign an implementer.
      - Assign or re-assign priority, impact level, and effort level.
      - Tentatively assign to a release project. May be reassigned to a later release project as needed. The assigned issue should be added to the "To Do (Assigned)" column of the project board.
      - Determine and document the resolution to be implemented and apply the label `status: implementation specified`.
      - The assigneee implements as specified and submits a PR. See [*Contributing*](Contributing.md#submitting-a-pull-request-pr) for details.
    - To address larger, major, or broader issues (e.g., rewriting a portion of the ontology, revising all annotations), a small, ad hoc working group of volunteers will be formed.
      - The issue is moved into the "To Do (Assigned)" column.
      - A group leader should be selected and assigned to the issue.
      - Each group determines their own work schedule and process. There is no deadline or target date for finalizing a proposal.
      - Once the group has developed a proposal, it will be submitted as a PR and presented during a biweekly meeting, in either order or simultaneously. This does *not* open up the entire work of the subgroup to be rehashed. If you have strong feelings about the issue you should join the working group.
      - The full group may propose revisions, which the small group will reconvene to consider but is not obligated to adopt.
      - Once the PR has been finalized and passed through the normal review process, it will be incorporated into the release schedule for either the next major or minor release as appropriate.
  - **Needs further review**
    - This case is similar to the "will implement" case, in that an assignee is designated to carry the discussion forward at a subsequent meeting. The difference is that here it is not yet agreed whether or how the issue will be addressed. Labels are applied as above, including `status: in review`.
- Fast-tracking. Some issues are small and non-controversial enough to bypass the group triage sessions (this is admittedly not entirely objective). These are labelled `fast-track` and put into the "To Do" column though even if assigned. Anyone interested in implementing an unassigned, fast-tracked issue may assign the task to him- or herself.
  
## Workflow: Implementation, Pull Requests, and Merges

- See [*Contributing*](Contributing.md).

## Versions and Version Numbering

Version numbers are of the form `X.x.x` (major.minor.patch). We follow [Semantic Versioning 2.0.0](https://semver.org/) as a guideline, adapting for ontology development.

- **Major:** Non-backward-compatible, breaking changes, including inferencing, queries, and data conversion.
  - Examples: adding a restriction, domain, range; adding language tags to annotations.
  - Large changes, such as introducing a new module, are not in and of themselves major changes; they are major updates only if they impact the semantics of existing terms.
- **Minor:** New, backward-compatible functionality. Includes *any* non-major addition to the ontology, even annotation properties or introduction of a new module.
  - Examples: adding a class or property; adding a `domainIncludes` annotation; deprecation of a term. - See the [*Deprecation and Deletion Policy*](DeprecationAndDeletionPolicy.md).
- **Patch:** No new functionality other than bug fixes and infrastructure changes that affect process but not the ontology itself.
  - Correction of an error, even if not backward-compatible, does not require a major release. The expectation is that users will not have implemented against an obvious error. This would be a patch.
  - Examples: Fixing a typo in an annotation; changing a property that was incorrectly defined as inverse functional rather than functional; modification of the bundle configuration.

A minor or patch version should require only that the user update the version number in the extension ontology's import statement; no other changes are required to retain existing functionality.
  
## Release Schedule

- **Major versions** are released on an ad hoc basis when there is a major update, but no more than once every six months.
- **Minor versions** are released approximately once per quarter.
- **Patch versions** are released for urgent bug fixes.
