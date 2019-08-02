#!/bin/bash
# versionize.sh
# Versionize an owl file.

usage() {
    echo Usage: $0 versionNumber somefile.owl
    echo Example: $0 9.0.0 ../OntologyFiles/gistAddress.owl
}

args=("$@")
 
# Check for correct number of args (2)
if [ ${#args[@]} != 2 ] 
then
    usage  
    exit  
fi

file=$2
version=$1

echo Versioning $file to $version
# For in-place substitution, Mac requires sed -i '' where 
# Linux uses just -i; the version below works on both.
sed -i.bak "s/X.x.x/$version/g" $file
rm $file.bak

echo Done!
