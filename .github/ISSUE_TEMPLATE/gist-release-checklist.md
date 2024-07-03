---
name: gist Release Checklist
about: Checklist of gist release tasks
title: gist Release Checklist
labels: ''
assignees: ''

---

Details are found in the [full documentation of the release process](https://semarts.atlassian.net/wiki/spaces/OF/pages/1126760539/gist+Release+Management+Ontologists).

- [ ] Create an issue based on this release template and add it to the project, if it does not already exist. 
- [ ] Create release branch (`release/X.x.x`).
- [ ] Prepare release notes on the release branch.
- [ ] Contact @pwin to prepare the eBook and Widoco documentation from the OWL files on the release branch.
- [ ] Update `skos:historyNote` for new release.
- [ ] Test logical consistency.
- [ ] Review the bundle configuration file.
- [ ] Submit a PR from the release branch to `develop`.
- [ ] Submit a PR from the release branch to `main`.
- [ ] Build the release package using `onto_tool` and inspect for correctness.
- [ ] Email the release package to the developers.
- [ ] Add a new GitHub project for the next minor release if it does not already exist.
- [ ] Add a new GitHub project for the next major release if it does not already exist.
- [ ] Create an issue from this template and add it to each of the above two projects, if it does not already exist. Modify the title to include the version number.
- [ ] Create a GitHub release.

Once the release has been posted to the website:
- [ ] Test the release download.
- [ ] Send notification of the release to JT along with text to update the [gist page on the SA website](https://www.semanticarts.com/gist/) and email text to send to gist Forum subscribers.
