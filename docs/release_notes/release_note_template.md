### {Major|Minor|Patch} Updates

- Added class `gist:KnowledgeConcept`. Issue [#XXXX](https://github.com/semanticarts/gist/issues/XXXX).

#### Tips

- See [Change and Release Management](../ChangeAndReleaseManagement.md) to determine heading (Major, Minor, or Patch).
- In certain cases, multiple updates may be combined into a single note:
  - Small fixes of a similar nature, such as correcting several typos and/or revising the wording of several annotations. It is not necessary to list the individual changes.
  - Closely related changes. These should be added to the section for the most impactful change (major, minor, or patch). For example, adding an automatically-generated file and the script that generates it should be included in the same release note, in this case to the Minor Updates section.
- Bullet points are symbolized with dash rather than asterisk.
- The note begins with either a past tense verb or a noun; e.g., "Updated..." or "Modifications to...".
- Ontology and other code terms are enclosed in backticks and use the `gist:` prefix; e.g., `gist:Organization`.
- Use nested bullets or tables to organize the content of complex notes.
- Each note includes a link to the issue(s) - but not PRs - addressed. Multiple issues should be listed in ascending numeric order.
- The note does not need to explain the rationale or provide detail. That is the function of the link to the issue.
- Each note ends in a period.
- Refer to recent release notes for examples.
