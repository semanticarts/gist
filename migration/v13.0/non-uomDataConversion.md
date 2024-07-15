# data migration scripts

## Overview

The following scripts come in pairs; one to convert data that resides in named graphs and one to convert data in the default graph.

Each pair should be used in sequence; first convert data in the named graphs using script 1 and then convert the data in the default graph using script 2.

In the case of useOffersProperty, script 3 converts data in the named graphs and script 4 converts the data in the default graph.

Be sure to read the header of each data conversion script.

## Examples

- renameProperties replaces `gist:isGeographicallyContainedIn` with `gist:isGeoContainedIn`
- replaceAddressClasses replaces `gist:EmailAddress` with `gist:ElectronicAddress`
- replaceAddressClasses replaces `gist:StreetAddress` with `gist:PhysicalAddress`

The different types and uses of addresses can be modeled as categories; see [the address migration documentation(AddressMigration.md) as well as the [full documentation of the new address model](/docs/model_documentation/AddressGuidance.md).

- replacePropertiesWithInverses replaces `gist:hasPart` with `gist:isPartOf`

- useOffersProperty (scripts 1 and 2) replaces `gist:hasPart` with `gist:offers` in the context of an offer
- useOffersProperty (scripts 3 and 4) replaces `gist:isPartOf` with `gist:offers` in the context of an offer

When converting data about offers, the offer and any sub-offer must belong to a the `gist:Offer` class or a subclass of it for the script to recognize the thing being offered.

The examples above are not a complete description of each script; read the scripts to see the complete list of changes they make to the data.

## Notes

- read the scripts to see the complete list of changes they make to the data (the examples above are not comprehensive).
- renameProperties, replaceAddressClasses, and replacePropertiesWithInverses remove classes and properties that are deprecated, i.e. they perform data conversion necessary to conform to gist 13.
- useOffersProperty is optional for conformance with gist 13
- be sure to update all artifacts such as data ingestion, queries, forms, documentation, etc. along with converting the data
- for data conversion of magnitudes and units of measure, see the directory uom_queries
