#!/bin/bash
# versionize.sh
# Versionize an OWL file or files.

usage() {
    scriptname=`basename "$0"`
    echo Versionizes OWL files. Operates on a single file, all files in a directory, or a set of files specified with a wildcard.
    echo Usage: $scriptname versionNumber [ file \| directory \| wildcard expression ]
    echo Examples:
    echo $scriptname 9.0.0 ../OntologyFiles/gistAddress.owl
    echo $scriptname 9.0.0 ../OntologyFiles
    echo "$scriptname 9.0.0 ../OntologyFiles/*.owl"
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
 
# Check for at least two args
if [ ${#args[@]} -lt 2 ] ; then 
    usage  
    exit  
fi

version=$1

if [ ${#args[@]} -eq 2 ] ; then 
    file=$2    
    if [ -f $file ] ; then
        versionize_file $version $file
    elif [ -d $file ]; then
        versionize_directory $version $file
    fi
else
    for i in "${args[@]:1}"; do
        versionize_file $version $i
    done
fi

echo Done!
