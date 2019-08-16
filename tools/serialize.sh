#!/bin/bash
# serialize.sh
# Reformats one or more OWL files into a standard format using rdf-toolkit.
# NB Should be renamed format.sh or reserialize.sh; a file already represents a 
# serialization, here it is just being reformatted or reserialized.

usage() {
    scriptname=`basename "$0"`
    echo Formats OWL files into a standard format. Operates on a single file, all files in a directory, or a set of files specified with a wildcard.
    echo Usage: $scriptname [ file \| directory \| wildcard expression ]
    echo Examples:
    echo $scriptname ./OntologyFiles/gistAddress.owl
    echo $scriptname ../OntologyFiles
    echo "$scriptname ../OntologyFiles/*.owl"
}

format_file() {
    file=$1
    # Require '.owl' extension. rdf-toolkit throws exceptions on non-RDF input. 
    # Avoid the exceptions on the '.txt' and '.xml' files stored in ../OntologyFiles. 
    # Later improvement: check actual file format rather than file extension.
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

format_directory() {
    dir=$1
    for file in $dir/*; do
        format_file $file
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
        format_file $file
    elif [ -d $file ]; then
        # Remove a trailing slash (for printing filenames).
        file=${file%/}
        format_directory $file
    fi
else
    for i in "${args[@]}"; do
        format_file $i
    done
fi

echo Done!
