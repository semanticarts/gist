gist Contributor Guidelines for Issues and Pull Requests
=====

gist Change and Release Management
-----

- All bug reports and feature requests should be submitted via issues in this repository rather than through email, the website contact form, or other communication channels, and all discussion will be tracked through comments on the issue. These practices ensure that requests are addressed transparently and systematically, and that all discussion is recorded and preserved in a single, public location.
- External contributors may submit a PR accompanied by a mandatory issue. They will be reviewed as part of our regular triage process, and will either be accepted and merged to develop, accepted with requested modifications, or rejected and closed. Submit only an issue if you have a request without a solution; submit a PR with the issue if you have a proposed solution. External contributions should conform to the requirements for issues and PRs outlined in the following sections.
- gist Council presentations may have an associated issue created so that the proposals will be formally reviewed.

Submitting an Issue
-----

### Content

- Search existing open issues before adding a new one. If the issue already exists, add your comments to it.
- Each issue should be atomic, to simplify the review process, implementation, and revert/rollback.
- Exception: several very small issues of the same type can be bundled together into a single issue - e.g., fixing typos in labels.
- Examples:
  - YES: Change all rdfs:label annotations to skos:prefLabel
  - YES: Fix typos in labels in all gist files.
  - NO: Change all rdfs:label annotations to skos:prefLabel and improve definitions.

### Issue Title

- The title of the issue should clearly and concretely describe the bug or feature request so that the basic meaning can be understood without reading the description.
- Examples:
  - YES: "Correct the owl:someValuesFrom restriction on property gist:identifiedBy for gist:Room."
  - YES: "gist:Room should not be required to have an ID"
  - NO: "Fix a restriction."

### Issue Description

- The issue should always include a description that elaborates on the title.
- The 3-segment version number (e.g., 9.1.0) should be referenced in the description unless it is the current version on the develop branch.

### Proposals for Resolution

- Whenever possible, the description should include a proposal, or list of options, for resolution.

### Labels

- Please review [label definitions](https://github.com/semanticarts/gist/labels) before use.
- Labels can be applied to the issue based on your subjective assessment of:
  - Priority: must have, should have, nice to have
  - Impact: major, minor, patch. See the document on [change and release management](ChangeAndReleaseManagement.md) for definitions. These are based on [Semantic Versioning](https://semver.org/).
  - Effort: small, medium, large
  - Area: tools, documentation (ontology is the default and does not need to be specified)
  - Type: bug, question, feature request
- Any labels you apply may be changed during triage. Do not assign status labels, as these are assigned during the triage and review process.

### Other Issue Metadata

- External contributors should not specify assignees, projects, or milestones. These are assigned during the internal review process.

Implementation
-----

### Working Branch

- The first step is to create a working branch from develop for your work: e.g., `feature/document_submission_guidelines` or `bugfix/fix_typo_in_Address_definition`. This branch will not be preserved after the work is merged into develop, so its name does not have to be particularly specific, accurate, or detailed. Some developers like to add the issue number to the new branch.

### Style Guide

- Ontologists should consult the emerging [_gist Style Guide_](gistStyleGuide.md) during implementation.
- The serializer tool should be run before each commit in order to standardize formatting and eliminate noise in git diffs. See [_gist Style Guide_](gistStyleGuide.md) for details.

### Commits, Pushes, and Merges

- If you are working on a project that will require more than one commit, you should commit to your working branch regularly to create logical checkpoints that can be restored if necessary. Each commit should be atomic for ease of rollback or reversion. Ideally, you finish working on one sub-task and commit it before taking up another.
- However, it is possible to go overboard and commit every little change independently. This creates clutter in the repository history.
- As you work, it is _essential_ that you merge regularly - e.g., daily - from develop back into your working branch. This ensures that, when it comes time to merge your work into develop, you will have resolved any merge conflicts with a minimum of difficulty. Note that your PR cannot be merged to develop until all merge conflicts are resolved.
- The commit message should be clear enough so that someone can get a basic understanding of the commit without looking at the actual changes in the files.
  - Examples:
    - YES: "Fix typo in definition of gist:Address."
    - NO: "Fix typo."

Pull Requests
-----

### Creating the Pull Request (PR)

- Once your work is ready to be merged into develop, you will create a pull request (PR).
- Before submitting the PR, you should ensure that you have (a) merged develop into your working branch, as above [during implementation](#commits-pushes-and-merges), and (b) run the serializer. The latter _should_ be unnecessary, since the serializer should have been run before every commit, but running it again protects against having forgotten at some point.
- Submit the PR to develop.
- If the issue(s) addressed by the PR is(are) slated for a particular release, assign the PR to the same release project, using the Project labels on the right sidebar, in order to facilitate release management.
- Assign one or more reviewers, as specified [below](#assigning-reviewers).
- You should _not_ delete your working branch, either locally or on the remote, at this point. If reviewers request changes to the PR, these should be made on the same branch for automatic updating of the PR.

### Contents of the PR

- Each PR should be atomic, addressing a single issue. This allows it to be accepted or rejected as a whole.
  - Exception: If there are several very small issues such as typo corrections or definition fixes, these can be submitted in a single PR.
- The PR should address the entirety of an issue. If it does not, either the PR should be modified or the issue should be broken up into parts.
- The title or description of the PR should contain the keywords "fixes #nnn" (or another of the [GitHub keywords](https://docs.github.com/en/enterprise/2.21/user/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword)) where nnn is the issue number. This automatically closes the related issue(s) when the PR is merged.
  - Example: "Correct cardinality restriction on class gist:Room. Fixes #98."
  - Note that if the PR fixes multiple issues, each issue number must be prefixed by the keyword. E.g., "Fixes #98, fixes #102", rather than "Fixes #98, #102" or "Fixes #98 and #102".
- The PR should include an update to the release notes. See [Release Notes](#release-notes).

### Assigning Reviewers

- Assign reviewer(s) based on the impact of the issue (major, minor, patch). The impact level should be labelled on the issue; if not, refer to the forthcoming Change and Release Management document and [Semantic Versioning](https://semver.org/).
  - Major: three reviewers
  - Minor: two reviewers
  - Patch: one reviewer
- You should assign exactly this number, or at most one more. Assigning too many reviewers can cause confusion.
- Reviewers must be internal to Semantic Arts.
- Many issues are general enough to be reviewed by any ontologist; some may require specific expertise. Use your judgement. This might be the time to use the "at most one more" prerogative.
- As well as designating reviewers, you should assign the PR &mdash; but not the issue &mdash; to the reviewers. This makes the assignee visible on the project board so it is clear who is currently responsible for moving the PR forward.

### Review Process

- Reviewers are charged with rejecting the PR or requesting changes, with appropriate comments, if:
  - The criteria of atomicity and completeness are not met.
  - The implementation deviates from that agreed upon during the internal review.
  - The release notes have been updated.
- A reviewer should assign the PR to the same release project as the issue(s) it addresses if that has not been done when the PR was submitted.
- If changes are requested, reassign the PR to the original implementer so it is clear who is responsible for the next action.
- When you correct your PR based on reviewer comments, and commit these changes, they automaticallly get added to the existing PR, so you should not create another PR.
- If a reviewer does not deem him/herself qualified to review the PR, he/she should reassign it to another reviewer.

### Merging the PR

- Some ontologists are repository admins with permission to merge to the "develop" branch. If your reviewer is not one of these, he/she will re-assign the PR to one of them after approving it for merge.
- Squash merges will not be used; however, the admin may choose to perform a rebase on the branch being merged in order to clean up the commit history.
- The GitHub project board is configured to automatically move a merged PR and its associated issue(s) to the Done column.
- The repository is configured to automatically delete the implementation branch from the remote; those with local copies of this branch should delete them locally.

### Multi-Developer Projects

- Some large projects are implemented by more than one person. In this case, a shared development branch is first cut from develop, and then each developer cuts his/her own branch off of this one. Merges will first take place from these individual working branches into the shared development branch, and finally the shared branch is merged into develop.
- The process of branching, submitting PRs, and merging is otherwise the same. Each developer should ensure that the shared branch is merged regularly into his/her working branch to avoid merge conflicts, and the same steps should be followed when submitting a PR to the shared branch and later from the shared branch to develop.

### Release Notes

#### General

- All PRs must include an update to the release notes, except in the rare cases where there are no user-facing changes. Small fixes of a similar nature, such as correcting several typos in annotations, may be gathered into a single release note, even if they were submitted for separate issues or as separate PRs.
- Reviewers will reject a PR without well-formed release notes.
- The release manager will review the release notes for content and formatting before release.
- On release, the release manager will replace the version placeholder X.x.x with the correct version number, both in the release note heading and in the import URL.

#### Formatting

- The release notes will be divided into three sections, for major, minor, and patch changes, as relevant.
- Each release note should follow the following formatting conventions:
  - Descriptions begin with a past tense verb.
  - Ontology and other code terms are enclosed in backticks; e.g., `gist:Weight`.
  - Each note ends in a period.
  - Refer to the most recent release notes for examples.
  - Please follow the heading conventions shown, as the [markdown configuration file](markdownlint.json) dictates the mixed heading style.
  - Release notes example:
  
#### Example

```markdown
Release notes gist 9.4.0
-----

### Major Updates

- Changed the `gist` namespace from `http:` to `https:`.

### Minor Updates

- Changes to category predicates: added intransitive properties `hasDirectSubCategory` and `hasDirectSuperCategory` as subproperties of `hasSubCategory` and `hasSuperCategory`, respectively. The latter are defined as transitive. Issues [#104](https://github.com/semanticarts/gist/issues/104), [#107](https://github.com/semanticarts/gist/issues/107).

### Patch Updates

- Deprecated `gist:_unitedNations`. Issue [#207](https://github.com/semanticarts/gist/issues/207).
- Made `gist:hasPhysicalLocation` transitive. Issue [#109](https://github.com/semanticarts/gist/issues/109).

Import URL: <https://ontologies.semanticarts.com/o/gistCore9.4.0>.

```
