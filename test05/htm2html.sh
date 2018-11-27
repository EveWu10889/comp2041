#!/bin/sh

for htm_file in `ls | egrep "*.htm$" | sed 's/ /%/g'`
do
    htm_file=`echo $htm_file | sed 's/%/ /g'`
    #echo "$htm_file"
    html_file=`echo "$htm_file" | sed 's/.htm$/.html/g'`
    #echo "$html_file"
    if test -e "$html_file"
    then
        echo "$html_file" exists
        exit 1
    else
        mv "$htm_file" "$html_file" 
        
    fi
done
