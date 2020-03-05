gist Change and Release Management
=====

This document describes the Semantic Arts change and release management processes for gist.

Version Numbering
-----

Version numbers are of the form X.x.x (major.minor.patch), defined following [Semantic Versioning 2.0.0](https://semver.org/):

- **Major:** Non-backward-compatible (i.e., reasoning produces different results).
  - Examples: adding a restriction, domain, range.

- **Minor:** New, backward-compatible functionality. May constitute a large change to the ontology, such as addition to new module.
  - Examples: adding a class or property; removing a restriction.

- **Patch:** No new functionality. 
  - Examples: Fixing a typo in an annotation.

Additional notes:
- Correction of an error, even if not backward-compatible, does not require a major release. The expectation is that users will not have implemented against an obvious error. This would be a patch.
- When a local name is altered, the original term is deprecated to make it a minor rather than major change. The deprecated term receives an `owl:equivalentClass` or `owl:equivalentProperty` assertion to the new term. Deprecated terms may be removed in a future major release. Deprecated terms reside in the `gistDeprecated.owl` file.

Issue Submission
-----

- We request that bug reports and feature requests be submitted via issues in this repository rather than through email, the website contact form, or other communication channels, and all discussion is tracked through comments on the issue. These practices ensure that requests are addressed transparently and systematically, and that all discussion is recorded and preserved in a single, public location.
- Each issue should be atomic. Exception: several very small issues of the same type can be bundled together into a single issue - e.g., fixing typos in labels.
- The title of the issue should clearly and concretely describe the issue. 
- The description should include:
  - gist version number
  - proposed solution, where possible
- [Labels](https://github.com/semanticarts/gist/labels) can be applied to the issue based on your subjective assessment of:
  - priority: must-have, should-have, nice-to-have
  - impact: major, minor, patch (see below)
  - effort: small, medium, large
  - type: bug, question, feature request
  - area: tools, documentation - default is ontology, no label required
- Do not apply status labels. These are applied during the review and triage process.
- Any of the labels may be changed during the triage process.

Triage 
-----

- The Semantic Arts ontologists meet at regularly scheduled intervals to review and triage issues (current schedule is twice monthly).
- Triage requires a minimum of three Semantic Arts ontologists in attendance at the review meeting, except for very obvious items like fixing typos.
- The triage sequence:
  1. Issues that have been triaged but are still in review.
  1. Issues already added to the current release project that have not been triaged (very rare).
  1. All other issues in reverse chronological order.
- Each open issue is categorized in one of three ways:
  1. **Will not implement**
    - Action: label as wontfix, duplicate, or can't reproduce, and close the issue. For duplicates, add the duplicated issue number in a comment.
  1. **Will implement**
    - Assign an implementer.
    - Assign priority, impact level (major/minor/patch), and effort level (small/medium/large). Any provisional labels added by the submitter are reviewed and modified as necessary.
    - Assign to a release project. This will automatically place it in the project To Do column.
    - Label as `status:triaged`.
    - For smaller issues, implementation can be decided during the meeting. Specify the implementation in a comment, and label `status:implementation specified`. 
    - Larger issues may need additional discussion, in which case the assigned implementer will prepare a brief summary of alternative implementations, rationales, etc. to present at the next meeting.
  1. **Needs further review**
    - Assign an ontologist responsible for moving the discussion forward. In this case, the assignee prepares the issue for group review, summarizing the discussion, etc.
    - Apply the `status:in review` label.
    - May assign priority, impact level, and effort, or postpone to subsequent review.
    - Label as `status:triaged`.
    - Specify a subsequent review meeting for continued discussion.
 
 
Pull Requests
-----

- All ontologists should refer to the emerging [gist Style Guide](gistStyleGuide.md) during implementation.
- The serializer tool must be run before each commit in order to standardize formatting and eliminate noise in git diffs.
- Each PR should be atomic, addressing a single issue or set of closely related, interdependent issues. Exception: a single PR may encompass multiple small changes of the same type - e.g., fixing typos in labels.
- A PR should address the entirety of an issue. If it does not, the issue should be broken up into parts.
- Submit the PR to the develop branch (the default branch) and assign it to the release project.
- The title of the PR should contain the keywords "fixes #nnn" where nnn is the issue number; more than one issue can be listed as "fixes #nnn, #mmm". This ensures that the issue is closed when the PR is merged.
- PRs must be reviewed and approved by a specific number of Semantic Arts ontologists based on the impact level:
  - Patch: one additional ontologist
  - Minor: two additional ontologists
  - Major: three additional ontologists
- The task of the reviewer is to ensure that the work has been done according to the specified implementation, and that it is atomic.
- Once the required number of reviewers have approved the PR, it is merged to develop.

        
Releases
-----

- Releases occur monthly, approximately on the last working day of the month.
- Each release has an associated GitHub project, which includes all the issues and PRs targeted for that release.
- A rotating release manager is assigned to the release. His/her responsibilities are to:
  - Track the status of associated issues, making sure that they are fixed or deferred to a subsequent release.
  - Provide release notes, based on the project issues and pull requests, and added to the top of the runnning [release notes](ReleaseNotes.md).
  - Submit a PR to develop and request one review. After approval, the reviewer merges the PR.
  - Create and merge a new PR from develop to master.
  - Create the release package by running ontology-toolkit. Additional files, such as documentation, are added to the package and sent to the lead developer in a zip file.
  - Close the project.
  - Draft and publish a new GitHub release. The includes the creation of a tag, formatted as "X.x.x".
- The developer will put the new download package on the server and repoint the website download link to this new package.
- The download will be tested by the release manager and/or automated tools. Details TBD.
- The release manager will send release notification to the gist Council mailing list, and the release will also be announced at the following gist Council meeting.
 
