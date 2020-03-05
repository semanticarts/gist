gist Contributor Guidelines [DRAFT]
=====

This document provides guidelines for submission of issues and pull requests (PRs) to the gist repository.

Issues
-----

- Each issue should be atomic. Exception: several very small issues of the same type can be bundled together into a single issue - e.g., fixing typos in labels.
- The title of the issue should clearly and concretely describe the issue. 
- The description should include:
  - gist version number
  - Proposed solution, where possible
- [Labels](https://github.com/semanticarts/gist/labels) can be applied to the issue based on your subjective assessment of:
  - priority
  - impact 
  - effort level
  - area
- Impact label categories are also defined in the [gist change management documentation](gistChangeManagementProcess.md).
- Do not apply status labels. These are applied during the review and triage process.
- Any of the labels may be changed during the triage process.
- Your issue will be reviewed according to the change management process described in [gist change management documentation](gistChangeManagementProcess.md).
- If you would like to implement a solution, assign the issue to yourself. This does not guarantee that the issue, your proposed solution, or your implementation of that solution will be accepted; all are subject to the normal review process. 

 


Pull Requests 
-----

- Start by creating an issue that your work addresses, if one does not already exist, as described above.
- After submitting the issue, you may wait until the issue has been reviewed and accepted before submitting a PR, or submit the PR prior to issue review.
- Each PR should be atomic, addressing a single issue or set of closely related, interdependent issues. Exception: a single PR may encompass multiple small changes of the same type - e.g., fixing typos in labels.
- A PR should address the entirety of an issue. If it does not, the issue should be broken up into parts.
- Submit the PR to the develop branch (this is the default branch).
- The title of the PR should contain the keywords "fixes #nnn" where nnn is the issue number; more than one issue can be listed as "fixes #nnn, #mmm". This ensures that the issue is closed when the PR is merged.
- Your PR will be reviewed according to the standard review process.

