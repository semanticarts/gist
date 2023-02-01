#!/bin/bash
# serialize.sh
# Reserializes one or more RDF files into a standard format using rdf-toolkit.
# Currently limited to Turtle and RDF/XML formats, and only reserializes to the same format.

usage() {
    scriptname=`basename "$0"`
    echo Formats RDF files into a standard format. Operates on a single file, all files in a directory, or a set of files specified with a wildcard. Files are assumed to have either .owl or .ttl extension. Assumes rdf-toolkit.jar is in the same directory as this script.
    echo Usage: $scriptname [ file \| directory \| wildcard expression ]
    echo Examples:
    echo $scriptname ./ontologies/gistCore.ttl
    echo $scriptname ../ontologies
    echo "$scriptname ../ontologies/*.owl"
}

serialize_file() {
    file=$1

    filename=`basename "$file"`
    ext=${filename##*.}

    if [ $ext == 'owl' ] ; then
        format='rdf-xml'
    elif [ $ext == 'rdf' ] ; then
        format='rdf-xml'
    elif [ $ext == 'ttl' ] ; then
        format='turtle'
    else
        # Require .owl, .rdf, or .ttl extension. rdf-toolkit throws exceptions on non-RDF input. 
        echo Skipping file $file. 
        return
    fi
    echo Serializing $file into a standard format.
    tmp=$file.bak
    cp $file $tmp
    java -jar `dirname "$0"`/rdf-toolkit.jar -tfmt $format -sdt explicit -dtd -ibn -sni -s $file -t $tmp 
    mv $tmp $file
}

serialize_directory() {
    dir=$1
    for file in $dir/*; do
        serialize_file $file
    done
}

args=("$@")
 
# Check for at least one arg
if [ ${#args[@]} -lt 1 ] ; then 
    usage  
    exit  
fi

if [ ${#args[@]} -eq 1 ] ; then 
    file=$1      
    if [ -f $file ] ; then
        serialize_file $file
    elif [ -d $file ]; then
        # Remove a trailing slash (for printing filenames).
        file=${file%/}
        serialize_directory $file
    fi
else
    for i in "${args[@]}"; do
        serialize_file $i
    done
fi

echo Done serializing files!
