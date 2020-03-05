Issue and Pull Request Submission Guidelines
=====

**Note:** An issue should be submitted and sent through the standard review and triage process described in [_Change and Release Management_](ChangeAndReleaseManagement.md) before submitting a pull request. The current Semantic Arts workflow assumes an issue has been reviewed and approved for implementation before a PR is submittted.


Issues
-----

- We request that bug reports and feature requests be submitted via issues in this repository rather than through email, the website contact form, or other communication channels, and all discussion is tracked through comments on the issue. These practices ensure that requests are addressed transparently and systematically, and that all discussion is recorded and preserved in a single, public location.
- Each issue should be atomic. Exception: several very small issues of the same type can be bundled together into a single issue - e.g., fixing typos in labels.
- The title of the issue should clearly and concretely describe the issue. 
- The description should include a proposal for resolution where possible.
- The gist version number should be referenced in the description.
- Labels can be applied to the issue based on your subjective assessment. Any of these labels may be changed during triage.

### Labels

- Review [label definitions](https://github.com/semanticarts/gist/labels) before use.
- Labels can be applied to the issue based on your subjective assessment of:
  - priority: must-have, should-have, nice-to-have
  - impact: major, minor, patch (see [_Change and Release Management_](ChangeAndReleaseManagement.md) for definitions)
  - effort: small, medium, large
  - type: bug, question, feature request
  - area: tools, documentation - default is ontology, no label required
- Do not apply status labels. These are applied during the review and triage process.
- Any of the labels may be changed during the triage process.


Pull Requests
-----

- All ontologists should refer to the emerging [_gist Style Guide_](gistStyleGuide.md) during implementation.
- The serializer tool must be run before each commit in order to standardize formatting and eliminate noise in git diffs.
- Each PR should be atomic, addressing a single issue or set of closely related, interdependent issues. Exception: a single PR may encompass multiple small changes of the same type - e.g., fixing typos in labels.
- A PR should address the entirety of an issue. If it does not, either the PR should be modified or the issue should be revisited and broken up into parts.
- The title of the PR should contain the keywords "fixes #nnn" where nnn is the issue number; more than one issue can be listed as "fixes #nnn, #mmm". This ensures that the issue is closed when the PR is merged.
- Submit the PR to develop (the default branch) and assign it to the release project.
