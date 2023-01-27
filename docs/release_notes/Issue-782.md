### Major Updates
- CoherentUnit / StandardUnit
  - Renamed CoherentUnit to StandardUnit with altLabel as CoherentUnit
  - Changed formal definition to be equivalent to a UnitOfMeasure that
    - has conversion=1
    - has itself as a standard unit
    - has a scopeNote indicating that this captures the idea of dimensiona UnitOfMeasure with itself as a standerd unit and conversion of 1.
  - Made hasStandardUnit functional
- UnitOfMeasure
  -  made equivalent to a Magnitude that
    - has numericValue =1 (it's not called 'unit' for nothing)
    - has itself at its unit of measure
    - has conversion=1
    - has a standard unit
  - removed UnitOfMeasuree from disjoints where incorrect or redundant

- Removed product and ratio units and magnitudes
  - Removed: ProductUnit, CoherentProductUnit, ProductMagnitude
  - Removed: RatioUnit, CoherentRatioUnit, RatioMagnitude
  - Percentage was redefined because it had been a subclass of RatioMagnitude which was defined in terms of RationUnit. The old definitions are inserted as blank nodes to retain same formal meaning.

- Aspect
  - Make Aspect a not a subclass of Category.  Aspects such as like length, or inner diameter or cycle time do not exist for the purpose of categorizing things.
  - Make Aspect a subclass of SchemaMetaData. An aspect is a representation of a property connecting two things. It has roughly the same meaning as an OWL property.

- Renamed Extent to Distance for consistency with DistanceUnit
- Renamed MolarQuantity to MoleQuantity and CountingUnit to CountUnit for consistency
- Renamed InformationQuantity to DataSize for naming consistency

### Minor Updates
- Moved an annotation about units from Magnitude to a better home: UnitOfMeasure
- Fixed an erroneous definition of Magnitude and added examples
- Added scopeNote for hasPrecision to say the precision of a Magnitude must have the same StandardUnit as the Magnitude.
- Removed and deprecated SimpleUnitOfMeasure
- Removed and deprecated hasBaseUnit. Use hasStandardUnit instead.
- Removed redundant typing of BaseUnits, can be inferred from enumeration.
- Added square meter and cubic meter as standard units for Area and Volume units respectively.
- Made cubic_meter and square_meter explicit instances of just UnitOfMeasure instead of VolumeUnit and AreaUnit, respectively.
- AreaUnit is now equivalent to UnitOfMeasure with standard unit of square meter, no longer requiring multipier/multiplicand
- VolumeUnit is now equivalent to UnitOfMeasure with standard unit of cubic meter, no longer requiring multipier/multiplicand
- Made non-standard units (e.g. minute) explicit instances of UnitOfMeasure rather than of the more specifit class, (e..g DurationUnit)





