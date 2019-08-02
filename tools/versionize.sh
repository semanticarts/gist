#!/bin/bash
# versionize.sh
# Versionize an owl file.

usage() {
    echo Versionizes a single file or all files in a directory.
    echo Usage: $0 versionNumber [ file \| directory ]
    echo File example: $0 9.0.0 ../OntologyFiles/gistAddress.owl
    echo Directory example: 9.0.0 ../OntologyFiles
}

versionize_file() {
    version=$1
    file=$2
    echo Versioning $file to $version
    # For in-place substitution, Mac requires sed -i '' where 
    # Linux uses just -i; the version below works on both.
    sed -i.bak "s/X.x.x/$version/g" $file
    rm $file.bak
}

versionize_directory() {
    version=$1
    dir=$2
    for file in $dir/*; do
        versionize_file $version $file
    done
}

args=("$@")
 
# Check for correct number of args (2)
if [ ${#args[@]} != 2 ] 
then
    usage  
    exit  
fi

version=$1
file=$2

if [ -f $file ]; then
    versionize_file $version $file
elif [ -d $file ]; then
    versionize_directory $version $file
fi

echo Done!
