The following diagram represent the structure of the directories at this location:

```
.
└── report/
    ├── README <- You are here!
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

- `./report/README.md` : You are here!
- `./report/default/` : This directory contains queries that only work on the default graph`*`

  > `*` the handling of these queries will be dependent upon which Triplestore
  > you are using and how it was configured. Some Triplestores will only use
  > triples in the default graph, some will use all triples in all named graphs.

- `./report/ngraphs/` : This directory contains queries that only work on named graphs
- `./report/default|ngraphs/old_namespace/` : Queries in this directory use the old Gist namespace:

  ```
  https://ontologies.semanticarts.com/gist/
  ```

  > Note: Queries with the old namespace should be used to validate your data **before** running the migration scripts

- `./report/default|ngraphs/new_namespace/` : Queries in this directory use the new Gist namespace:

  ```
  https://w3id.org/semanticarts/ns/ontology/gist/
  ```

  > Note: Queries with the new namespace should be used to validate your data **after** running the migration scripts
