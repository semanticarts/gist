# Major Version Migration <!-- omit in toc -->

- [Migrating RDF Data in Local Files](#migrating-rdf-data-in-local-files)
- [Migrating Data in a Triple Store](#migrating-data-in-a-triple-store)

When non-backward compatible changes are introduced into `gist` during major upgrades,
the release package will include queries to facilitate the migration of existing RDF, including ontologies, taxonomies, data, and SHACL, to conform to the new version of `gist`. Note that these queries do _not_ operate on SPARQL and other non-RDF files.

For changes that are not amenable to automatic migration, queries will be provided that
report the use of deleted or modified classes and properties so that mitigation measures
can be initiated.

Every major version of `gist` (starting with 10.0.0) will add a sub-directory under the
`migration` directory containing the queries and two migration scripts:

1. `migrate_local.yaml`, intended to apply changes to locally stored RDF data, and
2. `migrate_endpoint.yaml`, which is used to modify RDF data in a triple store

The migration scripts rely on the [Ontology Toolkit](https://pypi.org/project/onto-tool/), which is a
Python-based open source tool provided by Semantic Arts. It requires Python version 3.8 or greater
to be installed.

## Migrating RDF Data in Local Files

Once you have the Ontology Toolkit installed, issue the following command from the directory where
you [cloned](https://github.com/semanticarts/gist) or downloaded gist:

```shell
onto_tool bundle -v input INPUT-DIR 
                 -v output OUTPUT-DIR
                 -v report REPORT-DIR migration/v10.0/migrate_local.yaml
```

where _INPUT-DIR_ is the directory in which your RDF data is located, _OUTPUT-DIR_ is the directory where
updated RDF should be written, and REPORT-DIR is a directory where reports regarding any issues found
during migration are stored. The tool will also list the issues during execution. Output and report
directories will be created as needed, but any existing files in them will be overwritten.

Note that only `.ttl` (Turtle) and `.owl` (RDF/XML) files in the _INPUT-DIR_ are transformed - no
subdirectories are traversed, and those would require additional tool invocations.

## Migrating Data in a Triple Store

Once you have the Ontology Toolkit installed, issue the following command from the directory where
you [cloned](https://github.com/semanticarts/gist) or downloaded gist:

```shell
onto_tool bundle -v user USER -v password PWD 
                 -v endpoint ENDPOINT-URI 
                 [ -v update_endpoint UPDATE-URI ] 
                 -v report REPORT-DIR migration/v10.0/migrate_endpoint.yaml
```

where _ENDPOINT-URI_ is the address of your SPARQL endpoint, and _USER_ and _PWD_ are the credentials
required to access it. Only Basic HTTP authentication is handled at this time. If your triple store has
a separate endpoint for UPDATE queries (e.g. Stardog), provide it as _UPDATE-URI_. Reports regarding any
issues found during migration are stored in _REPORT-DIR_. Report directory will be created as needed,
but any existing files in it will be overwritten.
