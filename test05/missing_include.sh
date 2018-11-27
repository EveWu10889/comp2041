#!/bin/bash


for files in "$@"
do
#echo "$files"
files_include=`cat "$files" | egrep '#include \".*\"' | cut -d' ' -f2 | sed s/\"//g | tr '\n' ' '`

for file_include in $files_include
do  
    #echo "$file_include" 
    if test -e "$file_include" 
                #echo "$file"
        then
            continue
        else
            echo "$file_include" included into "$files" does not exist
     fi
done
done

