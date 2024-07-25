# Migrating Addresses to gist 13.0.0

## Overview

gist 13.0.0 introduces a new model of physical and electronic addresses (see [full documentation of the model](../../docs/models/AddressGuidance.md)). Because the new model shifts a large part of the semantics from classes to user-defined categories, the migration can be only partially automated. This guide documents the steps required to migrate your data and ontology extensions into the new model without loss of meaning.

## Automated Steps

The following replacements can be automated by running the migration scripts provided:

| gist 12 | gist 13 |
| :------- | :------- |
| `gist:hasCommunicationAddress`  |`gist:hasAddress` |
| `gist:StreetAddress`  |`gist:PhysicalAddress` |
| `gist:PostalAddress`  |`gist:PhysicalAddress` |
| `gist:EmailAddress`  |`gist:ElectronicAddress` |
| `gist:ElectronicMessageAddress`  |`gist:ElectronicAddress` |
| `gist:TelephoneNumber`  |`gist:ElectronicAddress` |

## Manual Steps

### Address Types

In gist 13.0.0 there are only two subclasses of `gist:Address`, `gist:ElectronicAddress` and `gist:PhysicalAddress`. It defines two new category classes, `gist:ElectronicAddressType` and `gist:PhysicalAddressType`, but does not define any instances. Instances should be defined in your own namespace.

In particular (using sample namespace prefix `my:` for your namespace):

| gist 12 Class | gist 13 Category |
| :--------------| :---------------- |
| `gist:StreetAddress` | `my:_PhysicalAddressType_street_address` |
| `gist:PostalAddress` | `my:_PhysicalAddressType_postal_address` |
| `gist:EmailAddress` | `my:_ElectronicAddressType_email_address` |
| `gist:ElectronicMessageAddress` | `my:_ElectronicAddressType_electronic_message_address` |
| `gist:TelephoneNumber` | `my:_ElectronicAddressType_telephone_number` |

And of course you can define additional categories as needed to model your use cases.

Sample instance data changes:

| gist 12 | gist 13  |
| :------- | :-------- |
| `my:toms_email a gist:EmailAddress .` | `my:toms_email a gist:ElectronicAddress ; gist:isCategorizedBy my:_ElectronicAddressType_email .`|

Sample extension ontology changes:

| gist 12 | gist 13  |
| :------- | :-------- |
| `ex:MobilePhoneNumber rdfs:subClassOf gist:TelephoneNumber .` | `ex:_AddressType_mobile_phone a gist:AddressType .` |

### Address Usage Types

gist 12 and earlier defined a general relationship `gist:hasAddress` between address-holder and address, with one more specific subproperty `gist:hasCommunicationAddress` to distinguish an address used, say, for personal communications from one used for, e.g., receiving packages. gist 13 transfers this distinction to a new category class `gist:AddressUsageType`. You might define `my:_AddressUsageType_personal` and `my:_AddressUsageType_receiving` to make this distinction.

The new model provides flexibility to express more nuanced types of address usage and communication preferences than has previously been available. Consult the [full documentation of the model](../../docs/models/AddressGuidance.md) to learn how to take advantage of these options.
