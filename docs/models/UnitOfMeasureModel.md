# New Magnitudes and Units of Measure in gist 13

## Overview

The following is an informal high-level description of changes to gist to better support magnitudes and units of measure.

With gist 13, the ontology for magnitudes and units of measure has been revisited to provide:

- Simpler governance
- Support for financial metrics
- Simple standard ways to represent data involving units of measure
- Support for calculations involving units of measure

The release includes scripts for converting data from gist 12 to gist 13, and Semantic Arts will also provide a rich set of reference data for units of measure that can be tapped going forward.

## Simple example

To see how gist 13 accomplishes these goals, let’s start with a simple example and build on it.

A patio has an area of 144 square feet.

We can break this statement down as follows:

- The patio has a magnitude that represents its area
- The magnitude is for an area (a measurable characteristic, also called an aspect)
- The magnitude uses square feet to measure the area
- The magnitude has a numeric value of 144

Each of these simpler statements can be represented as a triple; the gist properties involved are, respectively:

- has magnitude
- has aspect (new)
- has unit of measure
- numeric value

## Main concepts

Building on this example, the new concepts for units of measure in gist 13 are:

- every magnitude is directly related to a measurable characteristic (called an aspect)
- aspects and units of measure are treated as reference data and are not part of the ontology
- groups of units can be established, where all the units in the group measure the same aspect (for example foot, meter and kilometer all measure distance)
- the units of measure in a group are all multiples of the same product of powers of base units, given as exponent of kilogram, exponent of meter, exponent of second, etc.
- as before, every unit of measure has a conversion factor and a conversion offset that can be used to convert from one unit of measure to another (e.g. from liters to gallons)
- there is a simple way to represent units of measure and aspects in terms of component parts, e.g. ‘profit = revenue – expenses’ or ‘watt hour per mile = watt x hour / mile’
- aspects can be categorized by discipline

## What's new and different

To draw a comparison with gist 12:

- it is no longer necessary to change the ontology to add new aspects and units of measure, because they are treated as reference data instead of as classes
- it is no longer necessary to figure out if a unit is a coherent unit, a simple unit, a product unit, etc.
- because of the two items above, gist now has 25% fewer classes
- there is now one standard way to represent magnitudes and aspects
- there is now a simple way to validate that a unit of measure is applicable for measuring a given aspect (i.e. the unit of measure belongs to a unit group related to the aspect)
- calculations can now be done in SPARQL that would be far more complex in gist 12

## Relationship to the International System of Units

Most units of measure can be related to the International System of Units as in the following example using base units kilogram, meter, and second:

1 watt-hour = 3600 x kilogram meter squared per second squared

In terms of the ontology:

- the conversion factor for watt-hour is 3600
- the exponent of kilogram is 1
- the exponent of meter is 2
- the exponent of second is -2
- all other exponents are zero

Every member of a unit group containing watt-hour must be a multiple of kilogram meter squared per second squared.

## Working with exponents

Calculations involving the exponents can be done as follows:

2 meters squared x 3 meters
= 2 x 3 (meter with exponent 2) x (meter with exponent 1)
= 6 meter with exponent 3    [to get the product, add the exponents]

Calculations involving exponents can be done in SPARQL queries. A more complex example is:
1 watt = 1 kilogram meter squared per second cubed
1 hour = 3600 seconds
1 mile = 1609.34 meters

Therefore:

1 watt-hour per mile
= 1 x watt x hour x mile^-1
= (1 x kilogram x meter^2 x second^-3) x (3600 x second) x (1609.344 meter)^-1
= (1 x 3600 x 1609.344^-1)  x kilogram x (meter^2 x meter^-1) x (second^-3 x second)
= 2.237 x kilogram x meter x second^-2

This calculation relates the unit ‘watt-hour per mile’ to the base units kilogram, meter, and second of the International System of Units, with a conversionFactor of 2.237.

## References

For more information, see the following items in the gist ontology:

### Classes

- Aspect
- UnitGroup
- UnitOfMeasure
- Magnitude

### Object properties

- hasUnitGroup
- isMemberOf
- hasAccuracy
- hasAspect
- hasUnitOfMeasure
- hasMultiplier
- hasDivisor
- hasAddend
- hasSubtrahend

### Datatype properties

- numericValue
- conversionFactor
- conversionOffset
- hasExponentOfAmpere, hasExponentOfBit, etc.

### Also see

- Section 2.3.4 of the Brochure of the International System of Units at <https://www.bipm.org/documents/20126/41483022/SI-Brochure-9-EN.pdf>.
