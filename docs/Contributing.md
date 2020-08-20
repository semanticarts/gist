gist Contributor Guidelines for Issues and Pull Requests
=====

gist Change and Release Management
-----

- The Semantic Arts workflow for gist development requires that an issue be submitted, triaged, and approved for implementation before work proceeds and a pull request is submitted. We will not review or approve pull requests that are not based on issues approved for implementation.
- All bug reports and feature requests should be submitted via issues in this repository rather than through email, the website contact form, or other communication channels, and all discussion will be tracked through comments on the issue. These practices ensure that requests are addressed transparently and systematically, and that all discussion is recorded and preserved in a single, public location.
- gist Council presentations will have an associated issue created so that the proposals will be reviewed and acted on.

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

### Development Branch

- The first step is to create a new branch from the develop branch for your work: e.g., `feature/document_submission_guidelines`. This branch will not be preserved after the work is merged into develop, so the name of the branch does not have to be particularly specific or detailed.
- For a large project implemented by more than one person, all developers would work on this same branch. This applies whether the contributions of different developers are concurrent or sequential.

### Style Guide

- Ontologists should consult the emerging [_gist Style Guide_](gistStyleGuide.md) during implementation.
- The serializer tool must be run before each commit in order to standardize formatting and eliminate noise in git diffs. See [_gist Style Guide_](gistStyleGuide.md) for details.

### Commits

- If you are working on a project that will require more than one commit, you should commit to your branch regularly to create logical checkpoints that can be restored if necessary.
- However, it is possible to go overboard and commit every little change independently. This creates clutter in the repository history.
- This is especially important if working on a project with others, to reduce the likelihood of conflicts.
- However, each commit should be atomic for ease of rollback or reversion. Finish working on one sub-task and commit it before taking up another.
- As you work, it is _essential_ that you merge regularly from develop back into your branch. This ensures that, when it comes time to merge your work into develop, you will have resolved any merge conflicts with a minimum of difficulty.
- The commit message should be clear enough so that someone can get a basic understanding of the commit without looking at the actual changes in the files.
  - Examples:
    - YES: "Fix typo in definition of gist:Address."
    - NO: "Fix typo."

### Pushes

- If you are working on a large project with other developers, you must publish your branch and keep it up-to-date with regular commits and pushes to the remote.
- Even for solitary projects, publishing your branch and pushing regularly are useful for safeguarding your work on the remote server in case of local failure.

Pull Requests
-----

### Creating the Pull Request (PR)

- Once your work is ready to be merged into the develop branch, you will create a pull request (PR).
- Before submitting the PR, you should ensure that you have run the serializer and pulled from develop into your working branch, as above for implementation.
- Submit the PR to develop (the default branch) and assign it to the release project.
- Assign one or more reviewers, as specified below.
- You should _not_ delete your working branch, either locally or on the remote, at this point. If reviewers request changes to the PR, these should be made on the same branch for automatic updating of the PR.

### Contents of the PR

- Each PR should be atomic, addressing a single issue. This allows it to be accepted or rejected as a whole.
  - Exception: If there are several very small issues such as typo corrections or definition fixes, these can be submitted in a single PR.
- The PR should address the entirety of an issue. If it does not, either the PR should be modified or the issue should be broken up into parts.
- The description of the PR should contain the keywords "fixes #nnn" (or another of the [GitHub keywords](https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue)) where nnn is the issue number. This automatically closes the issue when the PR is merged.
  - Example: "Correct cardinality restriction on class gist:Room. Fixes #98."
- The PR should include an update to the release notes for the issue. Format:
  - One-line or so summary of change, followed by a link to the issue. This may be a copy of the issue title if that is well-phrased.
  - See notes for release 9.2.0 for examples.
  - Example: Replaced all "xs" namespace prefixes for XML Schema with "xsd." Corrects issue [158](https://github.com/semanticarts/gist/issues/158).
  - Exception: For very small issues, such as definition tweaks or typo corrections, a single line item will be included in the release notes. If such an item already exists, update it to include your issue number. If not, create it.
    - Example: "Various minor wording changes in definitions."

### Assigning Reviewers

- Assign reviewer(s) based on the impact of the issue (major, minor, patch). The impact level should be labelled on the issue; if not, refer to the forthcoming Change and Release Management document and [Semantic Versioning](https://semver.org/).
  - Major: three reviewers
  - Minor: two reviewers
  - Patch: one reviewer
- You should assign exactly this number, or at most one more. If too many reviewers are assigned, there is a tendency for (i) each reviewer to ignore the request, expecting other reviewers to step in, and (ii) too many cooks spoiling the broth and spreading confusion.
  - In the case of some issues, it may be that you need input from more than one type of expertise. That is the time to use the "at most one more" prerogative.
- Reviewers must be internal to Semantic Arts.
- Also assign the PR (but not the issue) to the reviewers. This makes the assignee visible on the project board so it is clear who is currently responsible for moving the PR forward.
- External contributors should not assign themselves as reviewers.
- Many issues are general enough to be reviewed by any Semantic Arts ontologist; some may require specific expertise. Use your judgement.

### Review Process

- Reviewers are charged with rejecting the PR or requesting changes, with appropriate comments, if:
  - The criteria of atomicity and completeness are not met.
  - The implementation deviates from that agreed upon during the internal review.
- If changes are requested, reassign the issue to the original implementer so it is clear who is responsible for the next action.
- When you correct your PR based on reviewer comments, and commit these changes, they automaticallly get added to the existing PR, so you should not create another PR.
- If a reviewer does not deem him/herself qualified to review the issue, he/she should reassign it to another reviewer.

### Merging the PR

- There are three repository admins with permission to merge to develop. If your reviewer is not one of these, he/she will re-assign the PR to one of them after approving it for merge.
- Squash merges will not be used; however, the admin may choose to perform a rebase on the branch being merged into develop in order to clean up the commit history.
- The project board is configured to automatically move a merged PR and its associated issue to the Done column.
- The repository is configured to automatically delete the implementation branch from the remote; those with local copies of this branch should delete them locally.
