# Guidelines for PR Reviewers

- PR reviewers should ensure that the guidelines for submitting a PR have been followed; see the section above on [submitting a PR](Contributing.md#submitting-a-pull-request-pr).
- If any of the following problems exist, the reviewer may opt to fix them or return the PR to the author:
  - The PR has not been assigned to the same project as the issue being addressed.
  - The PR and the issue have not been assigned status "In Review."
  - The description does not lit the issues closed by the PR, using the phrase "Closes #nnn" where nnn is the issue number. If more than one issue is closed, each should appear on a separate line preceded by the word "Closes."
  - The PR is not submitted to the appropriate branch (usually `develop`, but in some cases there may be a release branch).
- The PR should be returned to the author for any of the following problems:
  - There is no release note or explanation in the PR description of why none has been included.
  - The release note does not adequately reflect the contents of the PR or does not conform to the [guidelines](Contributing.md#release-notes)  - The serializer has not been run or the diffs are noisy for some other reason.
  - The changes do not conform to the agreed upon implementation described at the bottom of the issue.
  - The ontology is not logically consistent.
  - There are conflicts with the base branch.
  - Some checks have not passed.
  - The changes included in the PR are not all within the scope of the issue.
- Commenting on the PR:
  - Review the [GitHub documentation on commenting on PRs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/commenting-on-a-pull-request) for general information.
  - Do _not_ commit your suggestions to the PR itself. Enter comments in the comment box for the author to review.
  - It is helpful to enter minor suggestions such as small wording changes as GitHub suggestions, allowing the author to accept and commit the suggestion with a button click. You can do this by clicking on the small +- icon to the right of the word "Preview" in the comment box. See [item 7 in the GitHub documentation](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/commenting-on-a-pull-request#adding-comments-to-a-pull-request).
