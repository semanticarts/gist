### Major Updates

- Made `gist:Project` a subclass of `gist:Composite` because it has parts by definition. (No associated issue.)

### Minor Updates

- Added implementation of a simple, generic workflow model to gist. Issue [#1500](https://github.com/semanticarts/gist/issues/1500). Includes the definition of four new classes and six new properties:
  - `gist:Condition`
  - `gist:EvaluationTaskTemplate`
  - `gist:WorkflowDefinition`
  - `gist:WorkflowExecution`
  - `gist:evalutes`
  - `gist:hasInput`
  - `gist:hasOutput`
  - `gist:isExecutedBy`
  - `gist:precedesDirectlyIfFalse`
  - `gist:precedesDirectlyIfTrue`
