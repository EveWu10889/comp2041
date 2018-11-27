#!/bin/bash 

for file in *.htm
do
    newFile="$file"l
    #echo -n $newFile
    if test -e "$newFile"
    then
        echo "$newFile exists"
        exit 1
    else
        mv "$file" "$newFile"
    fi
done

