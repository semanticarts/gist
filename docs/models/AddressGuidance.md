# New Patterns for Using gist:Address

In gist v13.0.0, we introduced a new paradigm for modeling addresses. The new model is both more accurate and more expressive.

## Background

As recently as gist 12.1.0, we had five subclasses of gist:Address:

- `gist:ElectronicMessageAddress`
- `gist:EmailAddress`
- `gist:PostalAddress`
- `gist:StreetAddress`
- `gist:TelephoneNumber`

And we had two properties specifically aimed at addresses:

- `gist:hasAddress`
- `gist:hasCommunicationAddress`

But these classes and properties pre-dated our adoption of the "category" paradigm. Further, it is not always possible to know at the time of minting the instances what _kind_ of address is being represented. Is it a postal address or a street address? If it is both, with what midfix should the IRI be minted?

Upon analysis, we decided these classes were not semantically dissimilar enough to warrant their existence as classes.

## The New Model

With gist v13.0.0, we reduced `gist:Address` down to two disjoint subclasses:

- `gist:Address`
  - `gist:ElectronicAddress`
  - `gist:PhysicalAddress` .
We removed `gist:hasCommunicationAddress` and added a new object property, `gist:refersTo`.

The formal restriction definition for `gist:PhysicalAddress` is:

- "gist:Address and (gist:refersTo some gist:Place)".
In other words, a physical address exists in the real, physical world. It is possible for someone to go there and touch the address's referent.

`gist:ElectronicAddress` is disjoint with `gist:PhysicalAddress` and therefore encompasses all addresses that do not have a physical referent. It is _"Content referring to a locatable virtual place not physically existing, as such, but made by software or electronics to appear to do so."_

### Using the new model

#### Address triple patterns

Now, our address-related triples can all conform to three basic patterns:

##### Pattern 1: gist:hasAddress

| **subject class** | **predicate** | **object class** |
| :---------------- | :------------ | :--------------- |
| `owl:Thing` | `gist:hasAddress` | `gist:PhysicalAddress` |
| `owl:Thing` | `gist:hasAddress` | `gist:ElectronicAddress` |

##### Pattern 2: gist:containedText

| **subject class** | **predicate** | **object datatype** |
| :---------------- | :------------ | :------------------ |
| `gist:PhysicalAddress` | `gist:containedText` | `xsd:string` |
| `gist:ElectronicAddress` | `gist:containedText` | `xsd:string` |

##### Pattern 3: gist:refersTo

| **subject class** | **predicate** | **object class** |
| :---------------- | :------------ | :--------------- |
| `gist:PhysicalAddress` | `gist:refersTo` | `gist:Place` |
| `gist:PhysicalAddress` | `gist:refersTo` | `gist:GeoPoint` |
| `gist:PhysicalAddress` | `gist:refersTo` | `gist:GovernedGeoRegion` |
| `gist:PhysicalAddress` | `gist:refersTo` | `gist:CountryGeoRegion` |
| `gist:ElectronicAddress` | `gist:refersTo` | `rdf:Resource` |

#### Examples

##### Pattern 1

| **subject** | **predicate** | **object** |
| :---------- | :------------ | :--------- |
| `ex:_Person_Jjones` | `gist:hasAddress` | `ex:_PhysicalAddress_11235` |
| `ex:_Person_Jjones` | `gist:hasAddress` | `ex:_ElectronicAddress_81321` |
| `ex:_Person_Jjones` | `gist:hasAddress` | `ex:_ElectronicAddress_jjones%40hotmail.com` |

##### Pattern 2

| **subject** | **predicate** | **object** |
| :---------- | :------------ | :--------- |
| `ex:_PhysicalAddress_11235` | `gist:containedText` | "1313 Mockingbird Ln, Munster, IN  46321"  |
| `ex:_ElectronicAddress_81321` | `gist:containedText` | "<https://example.com/bigwebsite.html>"  |
| `ex:_ElectronicAddress_jjones%40hotmail.com` | `gist:containedText` | "<jjones@hotmail.com>"  |

##### Pattern 3

| **subject** | **predicate** | **object** |
| :---------- | :------------ | :--------- |
| `ex:_PhysicalAddress_11235` | `gist:refersTo` | `ex:_GeoPoint_41.53281962240151_-87.49815865065672` |
| `ex:_PhysicalAddress_11235` | `gist:refersTo` | `ex:_GovernedGeoRegion_MunsterIN` |
| `ex:_PhysicalAddress_11235` | `gist:refersTo` | `ex:_GovernedGeoRegion_IN` |
| `ex:_PhysicalAddress_11235` | `gist:refersTo` | `ex:_PostalZone_US_436121` |
| `ex:_PhysicalAddress_11235` | `gist:refersTo` | `ex:_CountryGeoRegion_USA` |
| `ex:_ElectronicAddress_81321` | `gist:refersTo` | `<https://example.com/bigwebsite.html>` |

Especially in the case of electronic addresses, one should be careful not to confuse or conflate the _xsd:string_ object used in the `gist:containedText` triple with the _rdf:resource_ object used in the `gist:refersTo` triple.

Beyond the physical/electronic distinction made by the classes, other important distinctions need to be made. One reasonably might ask, "Still, what _kind_ of address are we talking about?" These additional distinctions are to be handled using categories (i.e., instances of `gist:Category`).

### Address Categories & Instances

gist v13.0.0 supplies three "starter" categories for distinguishing addresses.

- `gist:AddressUsageType`
- `gist:ElectronicAddressType`
- `gist:PhysicalAddressType` .

However, in keeping with our self-imposed rules around the `gistCore` ontology, we do not define member instances of those classes as part of the gist release. But fear not. This document will provide some concrete suggestions.

Every user will need to evaluate how best to categorize their address instances to suit their context. In many cases, this may be influenced by legacy system data. Often, there are implicit distinctions made, based on column names. Too often, there are more distinctions than are truly necessary, based upon old usage. The choice of categories and instances to implement in the knowledge graph should be given careful consideration, and not be chained to outdated or inappropriate concepts.

Below are some examples we recommend for consideration. (The instance IRIs should use the appropriate domain namespace, not `gist:` or `example:`.) But ultimately, the classes and instances must suit the user's particular context.

In addition to the three classes provided within gistCore, we encourage adding `ex:PrecedenceType` to the domain ontology. An example use case would be if a user system needs to handle persons with multiple physical addresses (i.e., a person maintains multiple residences); one address may be designated as "primary", to indicate that the person prefers receiving mailings at that address over the others.

In our experience, the combination of these four categories should cover most addresses.

#### gist:PhysicalAddressType

- `ex:_PhysicalAddressType_street`
- `ex:_PhysicalAddressType_postal_drop` (for PO Boxes, etc.)
- `ex:_PhysicalAddressType_fuzzy` (e.g., "Corner of Main St & First Ave")

#### gist:ElectronicAddressType

- `ex:_ElectronicAddressType_mobile_telephone`
- `ex:_ElectronicAddressType_stationary_telephone`
- `ex:_ElectronicAddressType_fax`
- `ex:_ElectronicAddressType_email`
- `ex:_ElectronicAddressType_web`
- `ex:_ElectronicAddressType_ip` (for Internet Protocol)
- `ex:_ElectronicAddressType_mac` (for Medium Access Control)

#### gist:AddressUsageType

- `ex:_AddressUsageType_billing`
- `ex:_AddressUsageType_business`
- `ex:_AddressUsageType_personal`
- `ex:_AddressUsageType_postal`
- `ex:_AddressUsageType_residence`

#### ex:PrecedenceType

- `ex:_PrecedenceType_primary`
- `ex:_PrecedenceType_secondary`
- `ex:_PrecedenceType_non_primary`

## Temporal Addresses

Rather than assigning an `Address` instance directly to a person or organization, it is often more useful to model addresses in a temporal relation with other things and assign the usage and precedence categories to the relationship instance. For example, a particular address might start out being used as _both_ a residence and a postal address. But at some point, the addressee decides to rent a PO Box to use for their postal address instead. In other cases, one single address may be used as a billing address by one person, and as a residence address for another person.

## Other Considerations

### Use of gist:refersTo

Because `gist:Address` and its subclasses are subclasses of `gist:Content`, it does not make semantic sense to say that an address "is contained in a geo-region". However, it does make sense to say that the address "refers to something." That "something" can be a geo-point (with a specific latitude & longitude), a city, state, or country, a postal zone, or some custom-defined area. Hence, we do not assign a range to the `gist:refersTo` property (and it can be used outside the context of addresses as well).

Also, an address can refer to multiple things, using multiple triples. This is perhaps what people really have in mind when they want an address string split into its component parts. But parsing a string just results in multiple strings. Determining what _actual things_ an address refers to, and using the IRIs for those things, results in much more useful information. So, let the address instance refer to the IRIs for as many things as are useful in the domain's context.

An important point to bear in mind is that an address string might not _explicitly_ refer to a country (e.g., "1313 Mockingbird Ln, Munster, IN"). But it _implicitly_ refers to it. In the example, the address implies the USA because Indiana is part of the US. So, it is perfectly acceptable to have a triple asserting that the address refers to the IRI for the country even when the address string lacks it.

In the case of some electronic address types (e.g., email addresses), one might choose not to use the `gist:refersTo` property at all. And, of course, your use cases need not require the `gist:refersTo` assertions for physical addresses either.

### Address Segments

As noted above, many data models parse physical address strings into their component parts. In the US, this is typically one or two street components for the building and street, one each for the city, state, and postal code. But that pattern is too restrictive for physical addresses internationally. Some countries use very different patterns for physical addresses.

More to the point, many applications simply do not _require_ a parsed address. Consequently, much effort goes into stitching the components back together in some consistent fashion. Hence our recommendation to treat addresses as a single string, using the gist:containedText property.

If, however, the situation calls for such parsed address strings within the knowledge graph, one can expand upon gist, including the necessary subclasses within the user's namespace. E.g., `ex:streetText`, `ex:cityText`, `ex:regionText`, `ex:postalCodeText`.

### Ex uno, multi? (Out of one, many?)

There are arguments for and against treating typographical variants of an address (e.g., _"Street"_ vs _"St"_, _"Avenue"_ vs _"Ave"_) as different individuals and assigning them different IRIs, or using the same `Address` object with multiple `containedText` values. This decision should be made based on your use cases. Semantic Arts makes no recommendation.
