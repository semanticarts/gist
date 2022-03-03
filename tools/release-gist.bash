#!/bin/bash

# THIS SCRIPT HAS BEEN SUPERCEDED BY onto_tool. See https://github.com/semanticarts/ontology-toolkit.

## Require $1 (first command line parameter) to be the version of the gist release
if [ -z "$1" ]
  then
    echo "No argument supplied. Must provide the release version number."
    exit 1
fi

# Construct the directory name and the versioned file extension
VERSION=$1
DIRECTORY=gist${VERSION}_webDownload/
[ -d $DIRECTORY ] || ( echo "Directory not found: $DIRECTORY" && exit 1 )

# Quiet rm, ignores non-existent files.
qrm() {
  for f
  do
    [ -e "$f" ] && rm "$f"
  done
}

echo "Processing Files in: $DIRECTORY"
for extension in ttl rdf jsonld; do
  VERSIONED_EXT=${VERSION}.${extension}

  for full_filename in ${DIRECTORY}*${VERSIONED_EXT} ; do
    # Next line handles the case where no files match
    [ -e "$full_filename" ] || ( echo "NO ONTOLOGY FILES FOUND" && exit 1 )

    echo $full_filename

    # Remove the directory from the name
    filename=${full_filename#$DIRECTORY}
    # echo $filename

    # Remove the version & extension, leaving just the base of the filename
    filename_prefix=${filename%$VERSIONED_EXT}
    # echo $filename_prefix

    # Link versioned files to their source file
    qrm $filename
    ln -s $full_filename $filename

    # Link filenames without an extension to source file
    # Link filenames without an extension & version to source file
    if [ $extension == 'rdf' ]
    then
      qrm $filename_prefix $filename_prefix$VERSION
      ln -s $full_filename $filename_prefix
      ln -s $full_filename $filename_prefix$VERSION
    fi

    # Link unversioned filenames to their source file
    qrm $filename_prefix.$extension
    ln -s $full_filename $filename_prefix.$extension
  done
done

qrm Documentation
ln -s ${DIRECTORY}Documentation/ Documentation

qrm gistDeprecated gistDeprecated$VERSION
ln -s ${DIRECTORY}Deprecated/gistDeprecated$VERSION.rdf gistDeprecated
ln -s ${DIRECTORY}Deprecated/gistDeprecated$VERSION.rdf gistDeprecated$VERSION
for extension in ttl rdf jsonld; do
  qrm gistDeprecated.$extension gistDeprecated$VERSION.$extension
  ln -s ${DIRECTORY}Deprecated/gistDeprecated$VERSION.$extension gistDeprecated.$extension
  ln -s ${DIRECTORY}Deprecated/gistDeprecated$VERSION.$extension gistDeprecated$VERSION.$extension
done

qrm ReleaseNotes.html ReleaseNotes.md LICENSE.txt
ln -s ${DIRECTORY}Documentation/ReleaseNotes.html ReleaseNotes.html
ln -s ${DIRECTORY}Documentation/ReleaseNotes.md ReleaseNotes.md
ln -s ${DIRECTORY}LICENSE.txt LICENSE.txt

exit
