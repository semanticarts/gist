## Release 13.0.0

### Major Updates

- Removed sensor-related concepts. Issue [#462](https://github.com/semanticarts/gist/issues/462)

- Classes removed:
  - `gist:Actuator`
  - `gist:Controller`
  - `gist:ControllerType`
  - `gist:Sensor`
  - `gist:PhenomenaType`
  
- Properties removed:
  - `gist:hasViableRange`
  - `gist:respondsTo`

- Changed `skos:definition` of `gist:directs` to remove sensor references.

