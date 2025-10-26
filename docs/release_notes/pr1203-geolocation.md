
### Major Updates

- Changes to classes related to geographic location.
  - Renamed `gist:Place` to `gist:GeoLocation`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Updated annotation for `gist:GeoLocation` to say it can be a point, an area, or a volume. Issue [#939](https://github.com/semanticarts/gist/issues/939).
  - Updated annotations for subclasses of `gist:GeoLocation`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Used terms like "geographic area" instead of "geo-area". Issue [#1084](https://github.com/semanticarts/gist/issues/1084).
  - `gist:GeoRoute` is now a subclass of `gist:OrderedCollection`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - `gist:Landmark` is now a subclass only of `gist:PhysicalIdentifiableItem`. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Changed class expression in definition of `gist:Landmark` from an equivalence to a subclass. Issue [#1197](https://github.com/semanticarts/gist/issues/1197).
  - Removed class `gist:GeoSegment`. Issue [#1182](https://github.com/semanticarts/gist/issues/1182).
