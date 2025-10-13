# gist Contributor Quick Reference

This is a quick reference guide to submitting a pull request (PR) to the gist GitHub repository. Refer to the [contribution guidelines](Contributing.md) for full details.

## Set up a Local GitHub Repository

- Clone the [gist GitHub repository](https://github.com/semanticarts/gist.git).
- Run the script `./tools/setup.cmd`.
- Check to make sure that `./tools/pre-commit` has been copied to `./.git/hooks` and is executable. This ensures, among other things, that the serializer `./tools/serializer/rdf-toolkit.jar` runs before each commit. The serializer converts files into a standard Turtle format in order to remove noise in the diffs. No ontology files should be committed to the repository without running the serializer.

## Create a Working Branch

- Create a working branch from the base (target) branch. This is typically `develop`, but there may be a release branch.
- Name the branch with your username + slash + issue number + brief description. Example: `jsmith/546_documentation_updates`.

## Implement

- Change the status of the issue you are working on to "In Progress."
- Work on one issue at a time unless they are closely interconnected.
- Consult the [_gist Style Guide_](gistStyleGuide.md) to ensure you are following gist conventions and best practices during implementation.
- The serializer `./tools/serializer/rdf-toolkit.jar` *must* be run before every commit. If you have followed the [repository setup instructions](#set-up-a-local-github-repository), this will occur automatically.
- Add a release note as described in [_Contributing_](Contributing.md#release-notes).

## Submit a Pull Request

- When implementation is complete, [create a pull request](https://github.com/semanticarts/gist/pulls) to the base branch.
- Add the text "Closes #nnn" (where nnn is the issue number) to the description field. (If there are multiple issues, you must use the keyword "Closes" before each one.)
- Assign the PR to yourself.
- Add the PR to the same project as the issue. Set its status to "In Review."
- Set the issue status to "In Review."
- Submit the PR.
- Resolve any conflicts with the base branch.
- Assign one or more reviewers.
- Address reviewer comments.
