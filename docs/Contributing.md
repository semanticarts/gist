gist Contributor Guidelines for Issues and Pull Requests
=====

Contributing to gist
-----

- All bug reports and feature requests should be submitted via issues in this repository rather than through email, the website contact form, or other communication channels, and all discussion will be tracked through comments on the issue. These practices ensure that requests are addressed transparently and systematically, and that all discussion is recorded and preserved in a single, public location.
- External contributors may submit a PR accompanied by an issue. These will be reviewed as part of our regular triage process, and will either be accepted and merged to develop, accepted with requested modifications, or rejected and closed. Submit only an issue if you have a request without a solution; submit a PR with the issue if you have a proposed solution that you would like to implement. External contributions should conform to the requirements for issues and PRs outlined in the following sections.

Submitting an Issue
-----

### Content

- Search existing open issues before adding a new one. If the issue already exists, add your comments to it.
- Each issue should be atomic, to simplify the review process, implementation, and revert/rollback.
- Exception: several small issues of the same type can be bundled together into a single issue - e.g., fixing typos in labels or changing all `rdfs:label`s to `skos:prefLabel`s.

### Issue Title

- The title of the issue should clearly and concretely describe the bug or feature request so that the basic meaning can be understood without reading the description.
- Examples:
  - YES: "Correct the owl:someValuesFrom restriction on property gist:isIdentifiedBy for gist:Room."
  - YES: "gist:Room should not be required to have an ID"
  - NO: "Fix a restriction."

### Issue Description

- The issue should include a description that elaborates on the title.
- The full version number (e.g., 9.1.0) should be referenced in the description.

### Proposals for Resolution

- Whenever possible, the description should include a proposal, or list of options, for resolution.

### Issue Metadata

- External contributors should not specify assignees, projects, or milestones, nor apply labels for priority, effort, etc. These are assigned during the internal review process.

How to Contribute
-----

After cloning the gist repository, run the script `./tools/setup.cmd`. This script will work on Windows, Linux, and Mac.

### Pre-Commit Hook

The `./tools` directory contains a pre-commit hook that you should copy into `./git/hooks`. The `setup.cmd` script mentioned above will do this for you.

The pre-commit hook does several things when you run `git commit`:

- Prevents commits to the following branchs: develop, main, and master.
- Runs the serializer before each commit. This converts files into a standard Turtle format in order to remove noise in the diffs. As the comments in the file indicate, you should use the version of `rdf-toolkit.jar` in this directory, rather than another version that you may have elsewhere on your local drive.
- Runs a `sed` command to remove `skos` stubs that Protege may add to your files.
- Any PR containing commits without running the pre-commit hook will be returned for correction.

### Working Branch

- The first step is to create a working branch from develop for your work: e.g., `feature/document_submission_guidelines` or `bugfix/fix_typo_in_Address_definition`. This branch will not be preserved after the work is merged into develop, so its name does not have to be particularly specific, accurate, or detailed. Some developers like to add the issue number to the branch.

### Style Guide

- Ontologists should consult the emerging [_gist Style Guide_](gistStyleGuide.md) during implementation.

### Commits, Pushes, and Merges

- When you start working on an issue, move it to the "In Progress" column of the project board.
- If you are working on a project that will require more than one commit, you should commit to your working branch regularly to create logical checkpoints that can be restored if necessary. Each commit should be atomic for ease of rollback or reversion. Ideally, you finish working on one sub-task and commit it before taking up another.
- However, it is possible to go overboard and commit every little change independently. This creates clutter in the repository history.
- As you work, it is _essential_ that you merge or rebase regularly from develop back into your working branch. This ensures that, when it comes time to merge your work into develop, you will have resolved most merge conflicts with a minimum of difficulty. Note that your PR cannot be merged to develop until all merge conflicts are resolved.
- The commit message should be clear enough so that someone can get a basic understanding of the commit without looking at the actual changes in the files.
  - Examples:
    - YES: "Fix typo in definition of gist:Address."
    - NO: "Fix typo."

Pull Requests
-----

### Creating the Pull Request (PR)

- Once your work is ready to be merged into develop, you will create a pull request (PR).
- Before submitting the PR, you should ensure that you have merged or rebased develop into your working branch, as above [during implementation](#commits-pushes-and-merges).
- Submit the PR to develop.
- If the issue addressed by the PR is slated for a particular release, assign the PR to the same release project, using the Project labels on the right sidebar, in order to facilitate tracking.
- The project board is configured to automatically put the PR in the "In Review" column. However, the associated issue must be moved manually into that column manually.
- Once the PR has been submitted, check that there are no conflicts with the develop branch. If there are, merge or rebase develop into your branch and resolve the conflicts. You may need to repeat this step after making any requested changes, in case other PRs have been merged to develop in the meantime.
- Assign one or more reviewers, as specified [below](#assigning-reviewers).

### Contents of the PR

- Each PR should be atomic, addressing a single issue. This allows it to be accepted or rejected as a whole.
  - Exceptions: Several small issues such as typo corrections or definition fixes can be submitted in a single PR. Issues that are tightly related can be addressed in a single PR.
- The PR should address the entirety of an issue. If it does not, either the PR should be modified or the issue should be broken up into parts.
- The title of the PR should contain the keywords "fixes #nnn" (or another of the [GitHub keywords](https://docs.github.com/en/enterprise/2.21/user/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword)) where nnn is the issue number. This automatically closes the related issue(s) when the PR is merged.
  - Example: "Correct cardinality restriction on class gist:Room. Fixes #98."
  - Note that if the PR fixes multiple issues, each issue number must be prefixed by the keyword. E.g., "Fixes #98, fixes #102", rather than "Fixes #98, #102" or "Fixes #98 and #102".
- The PR description should contain a link to the issue addressed.
- The PR should include an update to the release notes. See [Release Notes](#release-notes).
- Refer to the [deprecation and deletion policy](DeprecationAndDeletionPolicy.md) if you are deprecating or deleting terms.

### Reviewing Problems with the PR

- At the bottom of the Conversation tab of the PR, you will see notifications about whether various merge criteria are met:
  - At least one review is required. Only one review is stipulated in GitHub, but as outlined below some types of changes require additional reviewers.
  - Build checks must have passed. This includes running the serializer and looking for merge conflicts. These problems will be flagged and should be addressed before assigning reviewers to the PR.
- If you prefer to put the PR in draft state while you attend to any issues, you will find a link to do so below the list of reviewers. Be sure to put it back into "ready to review" state, which, annoyingly, is not done in the same place, but below in the build checks section.

### Assigning Reviewers

- Assign reviewer(s) based on the impact of the issue (major, minor, patch). This should be labelled on the issue; if not, consult the [Change and Release Management documentation](ChangeAndReleaseManagement.md) for guidance.
  - Major: three reviewers
  - Minor: two reviewers
  - Patch: one reviewer
- Reviewers must be internal to Semantic Arts.
- Many issues are general enough to be reviewed by any ontologist; some may require specific expertise. Use your judgment. This might be the time to use the "at most one more" prerogative.

### Review Process

- Reviewers are charged with rejecting the PR or requesting changes, if:
  - The criteria of atomicity and completeness are not met.
  - The implementation deviates from that agreed upon during the internal review.
  - The release notes have not been updated.
  - The pre-commit hook has not been run.
- A reviewer should assign the PR to the same release project as the issue(s) it addresses if that has not been done when the PR was submitted.
- When you correct your PR based on reviewer comments, and commit these changes, they automaticallly get added to the existing PR, so you should not create another PR.
- If a reviewer does not deem him/herself qualified to review the PR, he/she should reassign it to another reviewer.

### Merging the PR

- The repository is configured to do rebase and merge by default.
- The GitHub project board is configured to automatically move a merged PR and its associated issue(s) to the Done column.
- The person performing the merge should delete the merged branch on the remote.

### Multi-Developer Projects

- Some large projects are implemented by more than one person. In this case, a shared development branch is first cut from develop, and then each developer cuts his/her own branch off of this one. Merges will first take place from these individual working branches into the shared development branch, and finally the shared branch is merged into develop.
- The process of branching, submitting PRs, and merging is otherwise the same. Each developer should ensure that the shared branch is merged regularly into his/her working branch to avoid merge conflicts, and the same steps should be followed when submitting a PR to the shared branch and later from the shared branch to develop.

### Release Notes

#### General

- Every PR must include a release note, with the exception of changes that are not user-facing, not included in the release package (such as this document), or too trivial to document. Small fixes of a similar nature, such as correcting several typos in annotations, may be gathered into a single release note, even if they were submitted to address separate issues or as separate PRs.
- Do _not_ add your release note directly to the file `/doc/ReleaseNotes.md`. Rather, create a separate Markdown file for the release note in `/docs/release_notes` (create this directory if it does not already exist). This avoids messy merge conflicts when multiple issues are being worked on simultaneously. Be sure to include a heading in the file indicating whether it will go into the major, minor, or patch section of the release notes. The individual release notes will be compiled into the `ReleaseNotes.md` file before the release package is built.
- The name of the release note file has no significance, though it is helpful to name it according to the PR or issue number being addressed.
- Reviewers will reject a PR without a well-formed release note.
- Before building the release package, the release manager will review and the release notes for content and formatting, revising as necessary; copy them into the `ReleaseNotes.md` file, using sections for major, minor, and patch changes; and delete the individual files.

#### Formatting

- The final release notes will be divided into three sections, for major, minor, and patch changes, as relevant.
- Each release note should follow the following formatting conventions:
  - Descriptions use past tense verbs.
  - Ontology and other code terms are enclosed in backticks; e.g., `gist:Weight`.
  - Each note ends in a period.
  - Refer to the most recent release notes for examples.
  - Follow the heading conventions shown, as the [markdown configuration file](.markdownlint.json) dictates the mixed heading style.
  - Release note example:

```markdown

### Minor Updates

- Changes to category predicates: added intransitive properties `hasDirectSubCategory` and `hasDirectSuperCategory` as subproperties of `hasSubCategory` and `hasSuperCategory`, respectively. The latter are defined as transitive. Issues [#104](https://github.com/semanticarts/gist/issues/104), [#107](https://github.com/semanticarts/gist/issues/107).

```
