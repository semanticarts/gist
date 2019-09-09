#!/bin/bash
# serialize.sh
# Reserializes one or more OWL files into a standard format using rdf-toolkit.

usage() {
    scriptname=`basename "$0"`
    echo Formats OWL files into a standard format. Operates on a single file, all files in a directory, or a set of files specified with a wildcard.
    echo Usage: $scriptname [ file \| directory \| wildcard expression ]
    echo Examples:
    echo $scriptname ./OntologyFiles/gistAddress.owl
    echo $scriptname ../OntologyFiles
    echo "$scriptname ../OntologyFiles/*.owl"
}

serialize_file() {
    file=$1
    # Require '.owl' extension. rdf-toolkit throws exceptions on non-RDF input. 
    # Avoid the exceptions on the '.txt' and '.xml' files stored in ../OntologyFiles. 
    # Later improvement: check actual file format rather than file extension. 
    # Should also extend to other RDF formats such as Turtle.
    filename=`basename "$file"`
    ext=${filename##*.}
    if [ $ext != 'owl' ] ; then
        echo Skipping file $file. 
        return
    fi
    echo Reserializing $file into a standard format.
    tmp=$file.bak
    cp $file $tmp
    java -jar ./rdf-toolkit.jar -tfmt rdf-xml -sdt explicit -dtd -ibn -s $tmp -t $file
    rm $tmp 
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

echo Done!
