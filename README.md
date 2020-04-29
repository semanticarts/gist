
# gist upper enterprise ontology

This repository has the raw files that we use to build the release files. If you just want the release files then you can download them from our [website](https://www.semanticarts.com/gist).

## Prerequisites to build the output files

1. You must have `java` installed for the serializer to work.  See JRE Installation instructions [here](https://jdk.java.net/).
1. You must also install the [ontology toolkit](https://github.com/semanticarts/ontology-toolkit), which also requires [Python](https://www.python.org/downloads/) 3.6 or greater.

## To release

1. To generate a folder suitable for ZIP-ing up and releasing Gist, run 

    `onto_tool bundle -v version <release-version> bundle.yaml`

   where `<release-version>` is a [semantic version](https://semver.org/), e.g. `9.2.0`.  It will
serialize the OWL, and create a ZIP-able folder containing everything needed for a web 
download.  The folder will have a name like `gist<release-version>_webDownload`. You can override
this by adding `-v output <path-to-output-folder>` to the command.

1. ZIP up the resulting folder and put it where we host our downloads. 
