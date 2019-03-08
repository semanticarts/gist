# gist upper enterprise ontology

This repository has the raw files that we use to build the release files. If you just want the release files then you can download them from our [website](https://www.semanticarts.com/gist).

## Prerequisites to build the output files

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
download.  The folder will have a name like `gist8.0.0_webDownload`

1. ZIP up the resulting folder and put it where we host our downloads. 
