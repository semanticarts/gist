# gist upper enterprise ontology

## Prerequisites

You must have `java` installed for the serializer to work.  See JRE Installation instructions [here](https://docs.oracle.com/javase/10/install/installation-jdk-and-jre-microsoft-windows-platforms.htm). 

## To release (Windows)

To generate a folder suitable for ZIP-ing up and releaseing Gist:

1. Save Expression on each tab in the Visio file to its `.owl` file name with *no* version number
     (e.g., `gistCore.owl)

1. Make sure you've got the desired release version number in `version.txt`

1. Run the `bundle.bat` script (double-click or run from command line)
