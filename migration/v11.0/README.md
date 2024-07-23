# Migrating to gist v11.0 from v10.0

> See also additional documentation in the [Major Version Migration](../../docs/MajorVersionMigration.md).

This file gives a quick overview of using the migration utilities provided
by the gist team to help migrate from the previous version of gist. These
scripts are not cumulative; you must run the migrations for each version
in sequence.

These utilities are a starting point. You should review them before running
them to make sure you approve of the actions prior to using them.

These utilities do not handle everything, in some cases we can only warn you
about changes that were made in gist and you will need to decide how you want
to handle the changes.

## Migration Queries

All of our migration tools are SPARQL queries.

You will note that some files have very similar names. Here is what the suffixes mean:

- `_default.rq` : These queries only work on the default graph`*`
- `_ngraphs.rq` : These queries only work on named graphs
- `.rq` : These queries work on both the default graph and named graphs

`*` the handling of these queries will be dependent upon which Triplestore
you are using and how it was configured. Some Triplestores will only use
triples in the default graph, some will use all triples in all named graphs.

## Requirements

These migration scripts are meant to be run using the open source onto_tool
program. Information about onto_tool and how to install it, is available at
[github](https://github.com/semanticarts/ontology-toolkit).

## Run on local files

NOTE: A known limitation of `onto_tool` is that it does not support named graphs when run against local files.
It does support named graphs when run against a SPARQL endpoint.

Start in this directory.

Put source data files in the ./input/ directory. See the onto_tool documentation for which file formats are supported.

Execute:

```shell
onto_tool bundle migrate_local.yaml
```

Output files will be created in the ./output/ directory.

Report files will be created in the ./reports/ directory.

## Run on a SPARQL Endpoint

You will need to tell onto_tool the URL of your SPARQL endpoint. You can do that
by editing the migration_endpoint.yaml file, or you can put it into the command
line execution like this:

```shell
onto_tool bundle -v user USER -v password PWD
                 -v endpoint ENDPOINT-URI
                 [ -v update_endpoint UPDATE-URI ]
                 -v report REPORT-DIR migrate_endpoint.yaml
```
