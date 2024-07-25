# Migrating to gist v12.0 from v11.0

This file gives a quick overview of using the migration utilities provided
by the gist team to help migrate from the previous version of gist.

> See also additional documentation in the [Major Version Migration](../../docs/MajorVersionMigration.md).

## Important Remarks

- **These scripts are not cumulative; you must run the migrations for each version
  in sequence.**

- **These utilities are a starting point.** You should review them before running
  them to make sure you approve of the actions prior to using them.

- **These utilities do not handle everything**, in some cases we can only warn you
  about changes that were made in gist and you will need to decide how you want
  to handle the changes.

## Migration Queries

All of our migration tools are SPARQL queries.

The following directory structure holds the migration scripts:

```
.
└── queries/
    ├── action/
    │   ├── default/
    │   │   └── *.rq
    │   └── ngraphs/
    │       └── *.rq
    └── report/
        ├── README
        ├── default/
        │   ├── old_namespace/
        │   │   └── *.rq
        │   └── new_namespace/
        │       └── *.rq
        └── ngraphs/
            ├── old_namespace/
            │   └── *.rq
            └── new_namespace/
                └── *.rq
```

The `./queries/` directory contains the following two directories:

- `./queries/action/` : Update queries for migrating from Gist v11.0 to v12.0

- `./queries/report/` : Validation queries that return SHACL validation reports for data that does not comply with Gist v12.0

Each of the above directories contains the following two directories:

- `default/` : These queries only work on the default graph`*`

  > `*` the handling of these queries will be dependent upon which Triplestore you are using and how it was configured. Some Triplestores will only use
  > triples in the default graph, some will use all triples in all named graphs.

- `ngraphs/` : These queries only work on named graphs

In the `default/` and `ngraphs/` directory of `./queries/report/` is two directories:

- `./queries/report/default|ngraphs/old_namespace/` : Queries with the old Gist namespace

- `./queries/report/default|ngraphs/old_namespace/` : Queries with the new Gist namespace

> See also additional documentation in the file `./queries/report/README.md`.

## Requirements

These migration scripts are meant to be run using the open source `onto_tool`
program. Information about onto_tool and how to install it, is available at
[github](https://github.com/semanticarts/ontology-toolkit).

## Run on local files

> Note: A known limitation of `onto_tool` is that it does not support named graphs when run against local files. It does support named graphs when run against a SPARQL endpoint.

1. Starting in this directory, put source data files in the `./input/` directory (the sample data can be removed). See the onto_tool documentation for which file formats are supported.

   > The `migrate_local.yaml` file currently looks in the `./input/` directory for `*.owl` and `*.ttl` files. If other formats are supported and you plan to use them, you will need to update the yaml.

2. Execute the following command:

   ```shell
   onto_tool bundle migrate_local.yaml
   ```

3. `onto_tool` will output to STDOUT, you should see something like the following (this is the output from the sample data included in the `./input/` directory):

   ```
   INFO:root:Replace inverse properties.
   INFO:root:Migrate renamed terms.
   INFO:root:Replace use of gist:Percentage.
   INFO:root:Check for issues that should be reviewed.
   WARNING:root:Verification query ./queries/report/default/new_namespace/detect_removed.rq produced non-empty results:
   Focus                     Path                            Value Severity   Message
   gist:Percentage           <urn:constraint:removed-entity>       sh:Warning Removed entity gist:Percentage referenced in da...
   gist:Percentage           <urn:constraint:removed-entity>       sh:Warning Removed entity gist:Percentage referenced in da...
   gist:Percentage           <urn:constraint:removed-entity>       sh:Warning Removed entity gist:Percentage referenced in da...
   gist:TimeZone             <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TimeZone referenced in data...
   gist:TimeZone             <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TimeZone referenced in data...
   gist:TimeZone             <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TimeZone referenced in data...
   gist:TimeZoneStandard     <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TimeZoneStandard referenced...
   gist:TimeZoneStandard     <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TimeZoneStandard referenced...
   gist:TimeZoneStandard     <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TimeZoneStandard referenced...
   gist:TreatyOrganization   <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TreatyOrganization referenc...
   gist:TreatyOrganization   <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TreatyOrganization referenc...
   gist:TreatyOrganization   <urn:constraint:removed-entity>       sh:Warning Removed entity gist:TreatyOrganization referenc...
   gist:hasOffsetToUniversal <urn:constraint:removed-entity>       sh:Warning Removed entity gist:hasOffsetToUniversal refere...
   gist:hasOffsetToUniversal <urn:constraint:removed-entity>       sh:Warning Removed entity gist:hasOffsetToUniversal refere...
   gist:hasOffsetToUniversal <urn:constraint:removed-entity>       sh:Warning Removed entity gist:hasOffsetToUniversal refere...
   gist:usesTimeZoneStandard <urn:constraint:removed-entity>       sh:Warning Removed entity gist:usesTimeZoneStandard refere...
   gist:usesTimeZoneStandard <urn:constraint:removed-entity>       sh:Warning Removed entity gist:usesTimeZoneStandard refere...
   gist:usesTimeZoneStandard <urn:constraint:removed-entity>       sh:Warning Removed entity gist:usesTimeZoneStandard refere...
   ```

   - Output files will be created in the `./output/` directory.

   - Report files will be created in the `./reports/` directory.

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
