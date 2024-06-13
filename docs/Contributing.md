# gist Contributor Guidelines for Issues and Pull Requests <!-- omit in toc -->

- [Contributing to gist](#contributing-to-gist)
- [Submitting an Issue](#submitting-an-issue)
  - [Content](#content)
  - [Issue Title](#issue-title)
  - [Issue Description](#issue-description)
  - [Proposals for Resolution](#proposals-for-resolution)
  - [Issue Metadata](#issue-metadata)
- [Setting up the Local Repository](#setting-up-the-local-repository)
- [Submitting a Pull Request (PR)](#submitting-a-pull-request-pr)
  - [Working Branch](#working-branch)
  - [Style Guide](#style-guide)
  - [Commits, Pushes, and Merges](#commits-pushes-and-merges)
  - [Creating the Pull Request (PR)](#creating-the-pull-request-pr)
  - [Draft PRs](#draft-prs)
  - [Contents of the PR](#contents-of-the-pr)
  - [Reviewing Problems with the PR](#reviewing-problems-with-the-pr)
  - [Requesting Reviews](#requesting-reviews)
  - [Review Process](#review-process)
  - [Merging the PR](#merging-the-pr)
  - [Multi-Developer Projects](#multi-developer-projects)
  - [Release Notes](#release-notes)
    - [General](#general)
    - [Formatting](#formatting)

## Contributing to gist

- There are a variety of ways to contribute to the ongoing evolution of gist: commenting on issue threads; upvoting issues; submitting bug reports, feature requests, and pull requests.
- All bug reports and feature requests should be submitted via issues in this repository rather than through email, the website contact form, or other communication channels, and all discussion will be tracked through comments on the issue. These practices ensure that requests are addressed publicly, transparently, and systematically, and that all discussion is captured and preserved in a single public location.
- External contributors may submit a pull request (PR) accompanied by an issue. These will be reviewed as part of our regular triage process, and will either be accepted and merged to develop, accepted with requested modifications, or rejected and closed. Submit only an issue if you have a request without a solution; submit a PR with the issue if you have a proposed solution that you would like to implement. External contributions should conform to the requirements for issues and PRs outlined in the following sections.

## Submitting an Issue

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

## Setting up the Local Repository

- Clone the [gist GitHub repository](https://github.com/semanticarts/gist.git).

- Run the script `./tools/setup.cmd`. This script will work on Windows, Linux, and Mac. It copies the `./tools/pre-commit` hook into `.git/hooks`, which means it will run before every commit you make to the repository.

The pre-commit hook does several things when you run `git commit`:

- Prevents commits to the branches `develop`, `main`, and `master` (though the latter is no longer used in the gist repository).
- Runs the serializer. This converts files into a standard Turtle format in order to remove noise in the diffs. As the comments in the file indicate, you should use the pre-approved version of `rdf-toolkit.jar` in this directory, rather than another version that you may have elsewhere on your local drive.
- Note: Any PR containing unserialized commits will be returned for correction.

## Submitting a Pull Request (PR)

### Working Branch

- The first step is to create a working branch from develop for your work: e.g., `feature/document_submission_guidelines` or `bugfix/fix_typo_in_Address_definition`. This branch will not be preserved after the work is merged into develop, so its name does not have to be particularly specific, accurate, or detailed. Some developers like to add the issue number to the branch.

### Style Guide

- Ontologists should consult the emerging [_gist Style Guide_](gistStyleGuide.md) during implementation.

### Commits, Pushes, and Merges

- When you start working on an issue that is included in a GitHub project, move it to the "In Progress" column of the project board.
- Every version of gist committed to the repository must be logically consistent. You can ensure this by loading the ontology into Protégé and running a reasoner, or by running a commandline reasoner.
- If you are working on a project that will require more than one commit, you should commit to your working branch regularly to create logical checkpoints that can be restored if necessary. Each commit should be atomic for ease of rollback or reversion. Ideally, you finish working on one sub-task and commit it before taking up another.
- However, it is possible to go overboard and commit every little change independently. This creates clutter in the repository history.
- As you work, it is essential that you merge or rebase regularly from develop back into your working branch. This ensures that, when it comes time to merge your work into develop, you will have resolved most merge conflicts more easily than when there are a large number all at once. Note that your PR cannot be merged to develop until all merge conflicts are resolved.
- The commit message should be clear enough so that someone can get a basic understanding of the commit without looking at the actual changes in the files.
  - Examples:
    - YES: "Fix typo in definition of gist:Address."
    - NO: "Fix typo."

### Creating the Pull Request (PR)

- Once your work is ready to be merged into develop, you will [create a pull request](https://github.com/semanticarts/gist/pulls).
- Assign the PR to yourself for tracking purposes.
- Before submitting the PR, you should ensure that you have merged or rebased develop into your working branch, [as above during implementation](#commits-pushes-and-merges).
- Submit the PR to develop.
- If the issue addressed by the PR is slated for a particular release, assign the PR to the same release project, using the Project labels on the right sidebar, in order to facilitate tracking. The PR and the associated issue(s) should be moved to the "In Review" column.
- Once the PR has been submitted, check that there are no conflicts with the develop branch. If there are, merge or rebase develop into your branch and resolve the conflicts. You may need to repeat this step after making any requested changes, in case other PRs have been merged to develop in the meantime.
- Assign one or more reviewers, as specified [below](#assigning-reviewers).

### Draft PRs

- Some developers like to create a PR before work is completed or even before it has begun. Follow the steps above to create the PR, and in addition:
  - Put it into draft state by clicking on the "Convert to draft" link below the list of reviewers.
  - Do not assign reviewers until the PR is ready for review.
  - When ready for review, click on the gray "Ready to review" button beneath the build checks section.
  - Request reviews.

### Contents of the PR

- Each PR should be atomic, addressing a single issue. This allows it to be accepted or rejected as a whole.
  - Exceptions:
    - Several small issues such as typo corrections, definition fixes, or documentation updates can be submitted in a single PR.
    - Issues that are tightly related can be addressed in a single PR.
- The PR should address the entirety of an issue. If it does not, either the PR should be modified or the issue should be broken up into parts.
- The description of the PR should contain the keywords "Closes #nnn" (or another of the [GitHub keywords](https://docs.github.com/en/enterprise/2.21/user/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword)) where nnn is the issue number. This automatically closes the related issue(s) when the PR is merged, and creates a link which allows readers and reviewers to easily reference the issue.
  - Example: "Correct cardinality restriction on class gist:Room. Closes #98."
  - Note that if the PR fixes multiple issues, each issue number must be prefixed by the keyword. E.g., "Closes #98, closes #102", rather than "Closes #98, #102" or "Closes #98 and #102".
- The PR should include an update to the release notes. See [_Release Notes_](#release-notes).
- Refer to the [_Deprecation and Deletion Policy_](DeprecationAndDeletionPolicy.md) if you are deprecating or deleting terms.

### Reviewing Problems with the PR

- At the bottom of the Conversation tab of the PR, you will see notifications about whether various merge criteria are met:
  - At least one review is required. Only one review is stipulated in GitHub, but, as outlined below, some types of changes require additional reviewers.
  - Build checks must have passed. If not, click on the Details link to review the errors.
  - Merge conflicts must be resolved. Note that even if they are resolved when you submit the PR, if there is a time lag before the PR is reviewed and accepted, additional merges from other PRs may have caused new merge conflicts. You will be informed that you need to do another merge.
- If you prefer to [put the PR in draft state](#draft-prs) while you attend to any issues, follow the steps above.

### Requesting Reviews

- Request review(s) based on the impact of the issue (major, minor, patch). This should be labeled on the issue; if not, consult [_Change and Release Management_](ChangeAndReleaseManagement.md) for guidance.
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
- The PR will automatically be moved back into the In Progress column when a reviewer requests changes.

### Merging the PR

- The repository is configured to do rebase and merge by default, but there are some cases where a rebase is not possible and merge commit must be selected.
- The GitHub project board is configured to automatically move a merged PR and its associated issue(s) to the Done column, assuming you have linked the PR to the issue(s).
- The repository is configured to automatically delete the remote branch on merge.

### Multi-Developer Projects

- Some large projects are implemented by more than one person. In this case, a shared development branch is first cut from develop, and then each developer cuts his/her own branch off of this one. Merges will first take place from these individual working branches into the shared development branch, and finally the shared branch is merged into develop.
- The process of branching, submitting PRs, and merging is otherwise the same. Each developer should ensure that the shared branch is merged regularly into his/her working branch to avoid merge conflicts, and the same steps should be followed when submitting a PR to the shared branch and later from the shared branch to develop.

### Release Notes

#### General

- All PRs must include an update to the release notes, except in the rare cases where the change is too trivial to mention; e.g., correcting a single typo. If you deliberately do not include a release note, please indicate this in the PR description so reviewers are aware, though they may disagree and request one.
- Small fixes of a similar nature, such as correcting several typos and/or revising the wording of several annotations, may be gathered into a single release note, even if they were submitted for separate issues or as separate PRs.
- Changes that are closely related, even if merged in separate PRs, should be combined into a single release note. They should be added to the section appropriate to the most impactful change (major, minor, or patch). For example, adding an automatically-generated file and the script that generates it should be included in the same release note, in this case to the Minor Updates section.
- PRs containing no user-facing changes, or changes to files not included in the release package, will still include a release note in the Patch section. Examples: changes to this document; modification of the pre-commit hook; update version of rdf-toolkit.jar.
- Do _not_ add your release note directly to the file `/doc/ReleaseNotes.md`. Rather, create a separate Markdown file for the release note in `/docs/release_notes`. This avoids messy merge conflicts when multiple issues are being worked on simultaneously. Be sure to include a heading in the file indicating whether it will go into the major, minor, or patch section of the release notes. The individual release notes will be compiled into the _ReleaseNotes.md_ file by the release manager before the release package is built.
- The name of the release note file has no significance, though it is helpful to name it according to the PR or issue number being addressed.
- Reviewers will reject a PR without a well-formed release note.
- Before building the release package, the release manager will review the release notes for content and formatting, revising as necessary; copy them into the [_ReleaseNotes.md_](ReleaseNotes) file, using sections for major, minor, and patch changes; and delete the individual files.
  
#### Formatting

- The final release notes will be divided into three sections, for major, minor, and patch changes, as relevant.
- Each release note should follow these formatting conventions:
  - Headings use the open `ATX` convention: i.e., leading hashes only and no underlining.
  - Bullet points are symbolized with dash rather than asterisk.
  - Descriptions begin with a past tense verb or a noun; e.g., "Updated..." or "Updates to...".
  - Ontology and other code terms are enclosed in backticks and use the `gist:` prefix; e.g., `gist:Weight`.
  - Each note includes a link to the issue(s) - but not PRs - addressed. Multiple issues should be listed in ascending numeric order.
  - Each note ends in a period.
  - Refer to the most recent release notes for examples.
  - Release note example:

```markdown

### Minor Updates

- Changes to category predicates: added intransitive properties `hasDirectSubCategory` and `hasDirectSuperCategory` as subproperties of `hasSubCategory` and `hasSuperCategory`, respectively. The latter are defined as transitive. Issues [#104](https://github.com/semanticarts/gist/issues/104), [#107](https://github.com/semanticarts/gist/issues/107).

```
