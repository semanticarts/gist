# gist upper enterprise ontology

## Prerequisites

You must have `java` installed for the serializer to work.  See JRE Installation instructions
[here](https://jdk.java.net/). 

## To release (Windows)

To generate a folder suitable for ZIP-ing up and releaseing Gist:

1. Save Expression on each tab in the Visio file to its `.owl` file name 
with *no* version number
     (e.g., `gistCore.owl)

1. Make sure you edit `version.txt` and put in the desired version number with 
**no leading nor trailing spaces** 

1. Run the `bundle.bat` script (double-click or run from command line).  It will 
serialize the OWL, and create a ZIP-able folder containing everything needed for a web 
download. 
