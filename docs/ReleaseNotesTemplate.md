Release Notes Template
=====

As noted in the [contributor guidelines](Contributing.md), every PR must include an update to the release notes, except in the rare cases where there is no user-facing change.

Notes:

- Reviewers will reject a PR that does not include an update to the release notes.
- The release manager will review the release notes for content and formatting.
- Please follow the heading conventions shown, as the [markdown configuration file](markdownlint.json) dictates the mixed heading style.
- The Rationale entry for patch changes may be as simple as "Bug fix."
- Each bulleted line should end in a period.
- Descriptions are stated in past tense.
- Surround ontology terms with backticks; e.g., `gist:Weight`.
- A full example is shown in the [release notes for version 9.4.0](ReleaseNotes.md).

Template:

```markdown
Release X.x.x
-----

### Major Updates

*Name*
   - Description:
   - Rationale:
   - Impact:
   - Migration plan:
   - Issue(s):

### Minor Updates

*Name*
   - Description:
   - Rationale:
   - Impact:
   - Issue(s):

### Patch Updates

*Name*
   - Description:
   - Rationale:
   - Issue(s):

Import URL: <http://ontologies.semanticarts.com/o/gistCoreX.x.x>.
```
