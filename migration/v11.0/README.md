# Migrating to gist v11.0

This file gives a quick overview of using the migration utilities provided
by the gist team to help migrate from the previous version of gist. These
utilities should be reviewed before running them to make sure you approve
of the actions prior to using them.

These utilities do not handle everything, in some cases we can only warn you
about changes that were made in gist and you will need to decide how you want
to handle the changes.

## Requirements

These migration scripts are meant to be run using the open source onto_tool
program. Information about onto_tool and how to install it, is available at
(github)[https://github.com/semanticarts/ontology-toolkit].

## Run on local files

Start in this directory.

Put source data files in the ./input/ directory. See the onto_tool documentation for which file formats are supported.

Execute `onto_tool bundle migrate_local.yaml`.

Output files will be created in the ./output/ directory.

Report files will be created in the ./reports/ directory.
