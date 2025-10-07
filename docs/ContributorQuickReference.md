# gist Contributing Quick Reference

This is a quick reference guide to submitting a pull request (PR) to the gist GitHub repository. Refer to the [contribution guidelines](Contributing.md) for full details.

## Set up a Local GitHub Repository

- Clone the [gist GitHub repository](https://github.com/semanticarts/gist.git).
- Run the script `./tools/setup.cmd`.

## Create a Working Branch

- Create a working branch from the `develop` branch or a release branch, where applicable.
- Name the branch with your username + slash + issue number + brief description. Example: `jsmith/546_documentation_updates`.

## Implement

- Change the status of the issue you are working on to "In Progress."
- Work on one issue at a time unless they are closely interconnected.
- Consult the [_gist Style Guide_](gistStyleGuide.md) to ensure you are following gist conventions and best practices during implementation.
- Add a release note as described in [_Contributing_](Contributing.md#release-notes).

## Submit a Pull Request

- When implementation is complete, [create a pull request](https://github.com/semanticarts/gist/pulls) to the target branch (`develop` or a release branch, if one exists).
- Add the text "Closes #nnn" (where nnn is the issue number) to the description field. (If there are multiple issues, you must use the keyword "Closes" before each one.)
- Assign the PR to yourself.
- Add the PR to the same project as the issue. Set its status to "In Review."
- Set the issue status to "In Review."
- Submit the PR.
- Resolve any conflicts with the target branch.
- Assign one or more reviewers.
- Address reviewer comments.
