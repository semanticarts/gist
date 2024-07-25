# Migrating to gist v13.0 from v12.0

This file gives a quick overview of using the migration utilities provided
by the gist team to help migrate from the previous version of gist.

> See also additional documentation in the [Major Version Migration](../../docs/MajorVersionMigration.md).

## Important Remarks

- **These scripts are not cumulative; you must run the migrations for each version of gist
  in sequence.**

- **These utilities are a starting point.** You should review them before running
  them to make sure you approve of the actions prior to using them.

- **These utilities do not handle everything**, in some cases we can only warn you
  about changes that were made in gist and you will need to decide how you want
  to handle the changes.

## Migration Queries

All of our migration tools are SPARQL queries.

The following directory structure holds the migration scripts:

    .
    └── queries/
        │
        ├── action/
        │   ├── default/
        │   │   └── *.rq
        │   └── ngraphs/
        │       └── *.rq
        │
        ├── report/
        │   ├── default/
        │   │   └── *.rq
        │   └── ngraphs/
        │       └── *.rq
        │
        └── uom_queries/
            └── *.rq

The `./queries/` directory contains the following directories:

- `./queries/action/` : Update queries for migrating from Gist v12.0 to v13.0

- `./queries/report/` : Validation queries that return SHACL validation reports for data that does not comply with Gist v13.0

- `./queries/uom_queries/` : Queries for migrating to the new ontology for magnitudes, aspects, and units of measure

The action and report directories each contain the following two directories:

- `default/` : These queries only work on the default graph`*`

  > `*` the handling of these queries will be dependent upon which triplestore you are using and how it was configured. Some triplestores will only use
  > triples in the default graph, some will use all triples in all named graphs.

- `ngraphs/` : These queries only work on named graphs

## Requirements

These migration scripts are meant to be run using the open source `onto_tool`
program. Information about onto_tool and how to install it, is available at
[PyPi](https://pypi.org/project/onto-tool).

## Run on local files

> Note: A known limitation of `onto_tool` is that it does not support named graphs when run against local files. It does support named graphs when run against a SPARQL endpoint.

1. Starting in this directory, either place source data files in the `./input/` directory or point the script at the location of your data via `-v input` flag (see example below). See the onto_tool documentation for which file formats are supported.

   > - The `migrate_local.yaml` file currently looks in the input directory for `*.owl` and `*.ttl` files. If other formats are supported and you plan to use them, you will need to update the yaml.
   > - The script will only transform RDF data files at the top level of the input directory, and will not recursively descend into sub-directories. Invoke the script multiple times with different directories specified via the `-v input` flag as needed.

2. Execute the following command for the default `./input` director:

   ```shell
   onto_tool bundle migrate_local.yaml
   ```

   or with a custom input directory:

   ```shell
   onto_tool bundle -v input <directory of RDF data> migrate_local.yaml
   ```

3. `onto_tool` will output to STDOUT, you should see something like the following:

        INFO:root:Rename properties in named graphs.
        INFO:root:Replace address classes in named graphs.
        INFO:root:Replace properties with inverses in named graphs.
        INFO:root:Use new gist:offers property in named graphs (script 1).
        INFO:root:Use new gist:offers property in named graphs (script 2).
        INFO:root:Rename properties in named graphs.
        INFO:root:Replace address classes in named graphs.
        INFO:root:Replace properties with inverses in named graphs.
        INFO:root:Use new gist:offers property in named graphs (script 1).
        INFO:root:Use new gist:offers property in named graphs (script 2).
        INFO:root:Check the named graphs for other items that should be reviewed.
        INFO:root:Check named graphs for other items that should be reviewed.

   - Output files will be created in the `./output/` directory. The location can be overriden by specifying `-v output <existing directory for output>`.

   - Report files will be created in the `./reports/` directory. The location can be overriden by specifying `-v report <existing directory for report>`.

## Run Against SPARQL Endpoint

You will need to tell `onto_tool` the URL of your SPARQL endpoint. You can do that
by editing the `migration_endpoint.yaml` file, or you can put it into the command
line execution like this:

> Note: Use your own values in place of `<...>`

```shell
onto_tool bundle -v user <USER> -v password <PWD>
                 -v endpoint <ENDPOINT-URI>
                 [ -v update_endpoint <UPDATE-URI> ]
                 -v report <REPORT-DIR> migrate_endpoint.yaml
```

## Examples

- renameProperties replaces `gist:isGeographicallyContainedIn` with `gist:isGeoContainedIn`
- replaceAddressClasses replaces `gist:EmailAddress` with `gist:ElectronicAddress`
- replaceAddressClasses replaces `gist:StreetAddress` with `gist:PhysicalAddress`

The different types and uses of addresses can be modeled as categories; see [the address migration documentation](./AddressMigration.md) as well as the [full documentation of the new address model](../../docs/models/AddressGuidance.md).

- replacePropertiesWithInverses replaces `gist:hasPart` with `gist:isPartOf`
- useOffersProperty (scripts 1 and 2) replaces `gist:hasPart` with `gist:offers` in the context of an offer
- useOffersProperty (scripts 3 and 4) replaces `gist:isPartOf` with `gist:offers` in the context of an offer

When converting data about offers, the offer and any sub-offer must belong to a the `gist:Offer` class or a subclass of it for the script to recognize the thing being offered.

The examples above are not a complete description of each script; read the scripts to see the complete list of changes they make to the data.

## Notes

- read the scripts to see the complete list of changes they make to the data (the examples above are not comprehensive).
- renameProperties, replaceAddressClasses, and replacePropertiesWithInverses remove classes and properties that were deprecated in release 12, i.e. they perform data conversion necessary to conform to gist 13.
- useOffersProperty is optional for conformance with gist 13
- be sure to update all artifacts such as data ingestion, queries, forms, documentation, etc. along with converting the data
- for data conversion of magnitudes and units of measure, see the README file in the uom_queries directory
