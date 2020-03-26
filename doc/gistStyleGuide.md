gist Style Guide
=====

This style guide documents standards and conventions we have adopted for gist implementation in order to ensure a consistent, professional, high-quality product.

OWL Version [NEEDS REVIEW]
-----
gist uses OWL 2 DL.


Serialization
-----

- gist OWL files are serialized in RDF/XML. 
- The serialization tool, `serialize.sh` (Mac/Linus) or `serialize.bat` (Windows), should be run before each commit in order to standardize formatting and eliminate noise in git diffs. It is recommended to automate this as a pre-commit hook.

Naming
-----

### Local names


#### Classes

- Camelcase with initial uppercase
- Acronyms are also camelcased so that word boundaries are unambiguous. 
  - Examples: `AmaGuideline`, not `AMAGuideline`; `UriScheme`, not `URIScheme`
  - `ID` is an exception, because Merriam-Webster spells it in all-caps.
- Alphanumeric characters only. 
  - Example: `Isbn10`, not `Isbn-10` or `ISBN-10`.
  
#### Properties

- Camelcase with initial lowercase
- Acronyms as above

#### All

- No non-standard abbreviations. E.g., `hasUoM` should be `hasUnitOfMeasure`.

### Labels

#### Classes

- Sentence case
- Normalized to natural language standards. E.g., hyphens inserted, acronyms in all caps, etc.
  - Examples: _AMA guideline_, _ISBN-10_
  
#### Properties

- Same as classes, but initial lowercase 
- Examples: _has unit of measure_, _has SSN_. 

#### Rationale

We adopt sentence over title case because the latter, while technically well-defined, has more complex rules and can introduce inconsistencies when implemented by different users.
