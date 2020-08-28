#!/bin/bash

## Require $1 (first command line parameter) to be the version of the gist release
if [ -z "$1" ]
  then
    echo "No argument supplied. Must provide the release version number."
    exit 1
fi

# Construct the directory name and the versioned file extension
VERSION=$1
DIRECTORY=gist${VERSION}_webDownload/
VERSIONED_EXT=${VERSION}.ttl
[ -d $DIRECTORY ] || echo "Directory not found: $DIRECTORY" && exit 1

echo "Processing Files in: $DIRECTORY"
for full_filename in ${DIRECTORY}*${VERSIONED_EXT} ; do
  # Next line handles the case where no files match
  [ -e "$filename" ] || echo "NO .ttl FILES FOUND" && exit 1

  echo $full_filename

  # Remove the directory from the name
  filename=${full_filename#$DIRECTORY}
  # echo $filename

  # Remove the version & extension, leaving just the base of the filename
  filename_prefix=${filename%$VERSIONED_EXT}
  # echo $filename_prefix

  # Link versioned .ttl files to their source file
  rm $filename
  ln -s $full_filename $filename

  # Link filenames without the .ttl extension to their source file
  rm $filename_prefix$VERSION
  ln -s $full_filename $filename_prefix$VERSION

  # Link unversioned filenames to their source file
  rm $filename_prefix.ttl
  ln -s $full_filename $filename_prefix.ttl
done

rm Documentation catalog-v001.xml
ln -s ${DIRECTORY}catalog-v001.xml catalog-v001.xml
ln -s ${DIRECTORY}Documentation/ Documentation

rm gistDeprecated.ttl gistDeprecated$VERSION gistDeprecated$VERSION.ttl
ln -s ${DIRECTORY}Deprecated/gistDeprecated$VERSION.ttl gistDeprecated.ttl
ln -s ${DIRECTORY}Deprecated/gistDeprecated$VERSION.ttl gistDeprecated$VERSION
ln -s ${DIRECTORY}Deprecated/gistDeprecated$VERSION.ttl gistDeprecated$VERSION.ttl

rm ReleaseNotes.html ReleaseNotes.md LICENSE.txt
ln -s ${DIRECTORY}Documentation/ReleaseNotes.html ReleaseNotes.html
ln -s ${DIRECTORY}Documentation/ReleaseNotes.md ReleaseNotes.md
ln -s ${DIRECTORY}LICENSE.txt LICENSE.txt

exit

