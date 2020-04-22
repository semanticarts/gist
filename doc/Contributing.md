Issue and Pull Request Submission Guidelines
=====

Semantic Arts gist Change and Release Management
-----

- The current Semantic Arts workflow (details in a forthcoming change and release management document) for gist development requires that an issue be submitted, triaged, and approved for implementation before a pull request is submitted. We will not review or approve pull requests not based on approved issues.
- All bug reports and feature requests should be submitted via issues in this repository rather than through email, the website contact form, or other communication channels, and all discussion will be tracked through comments on the issue. These practices ensure that requests are addressed transparently and systematically, and that all discussion is recorded and preserved in a single, public location.


Submitting an Issue
-----

### Atomic Issues

- Each issue should be atomic, to simplify the review process, implementation, and revert/rollback.
- Exception: several very small issues of the same type can be bundled together into a single issue - e.g., fixing typos in labels. 
- Examples: 
  - YES: An issue to change all rdfs:label annotations to skos:prefLabel
  - YES: An issue to fix typos in labels in all gist files.
  - NO: An issue to change all rdfs:label annotations to skos:prefLabel and rewrite definitions as full sentences.

### Issue Title

- The title of the issue should clearly, concretely, and specifically describe the bug or feature request so that the basic meaning can be understood without reading the description. 
- Examples:
  - YES: "Correct the someValuesFrom restriction on property gist:identifiedBy for gist:Room." 
  - YES: "gist:Room should not be required to have an ID"
  - NO: "Fix a restriction."

### Issue Description

- The issue should always include a description that elaborates on the title.

### gist Version

- The 3-segment version number (e.g., 9.1.0) should be referenced in the description.

### Proposals for Resolution

- Whenever possible, the description should include a proposal, or list of options, for resolution.

### Labels

- Please review [label definitions](https://github.com/semanticarts/gist/labels) before use.
- Labels can be applied to the issue based on your subjective assessment of: 
  - Priority: must have, should have, nice to have
  - Impact: major, minor, patch. See the forthcoming document on change and release management.
  - Effort: small, medium, large
  - Area: tools, documentation (ontology is the default and does not need to be specified)
  - Type: bug, question, feature request
- Any labels you apply may be changed during triage. Do not assign status labels, as these are assigned during the triage and review process.

### Other Issue Metadata

- External contributors should not specify assignees, projects, or milestones. These are assigned during the internal review process.


Implementation
-----

### Development Branch

- The first step is to create a new branch from the develop branch for your work: e.g., ```feature/document_submission_guidelines```. This branch will not be preserved after the work is merged into develop, so the name of the branch does not have to be particularly specific or detailed.
- For a large project implemented by more than one person, all ontologists would work on this same branch. 


### Style Guide

- Ontologists should refer to and follow the emerging [_gist Style Guide_](gistStyleGuide.md) during implementation.
- The serializer tool must be run before each commit in order to standardize formatting and eliminate noise in git diffs. See [_gist Style Guide_](gistStyleGuide.md) for details.

### Commits

- If you are working on a project that will require more than one commit, you should commit to your branch regularly to create checkpoints that can be restored if necessary.
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
- Even for solitary projects, publishing your branch and regular pushes are useful for safeguarding your work on the remote server in case of local failure.

Pull Requests
-----

- Once your work is ready to be merged into the develop branch, you will create a pull request (PR).
- Before submitting the PR, you should ensure that you have run the serializer and pulled from develop into your working branch, as above for implementation.
- Content of the PR:  
  - Each PR is atomic, addressing a single issue.
  - The PR should address the entirety of an issue. If it does not, either the PR should be modified or the issue should be revisited and broken up into parts.
  - Reviewers are charged with rejecting the PR with appropriate requests if either of these is violated. 
- The title of the PR should contain the keywords "fixes #nnn" where nnn is the issue number. This automatically closes the issue when the PR is merged.
- Submit the PR to develop (the default branch) and assign it to the release project.
- Assign reviewer(s) based on the impact of the issue (major, minor, patch). The impact level should be labelled on the issue; if not, refer to the forthcoming Change and Release Management document.
  - Major: three reviewers
  - Minor: two reviewers
  - Patch: one reviewer
- You should assign exactly this number, or at most one more. If too many reviewers are assigned, there is a tendency for (i) each reviewer to ignore the request, hoping other reviewers will step in, and (ii) too many cooks spoiling the broth and spreading confusion. 
  - In the case of some issues, it may be that you need input from more than one type of expertise. That is the time to use the "at most one more" prerogative.
- Reviewers must be internal to Semantic Arts. 
  - External contributors should not assign themselves as reviewers.
