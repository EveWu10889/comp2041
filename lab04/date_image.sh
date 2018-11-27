#!/bin/bash

for file in "$@"
do 
    date=`ls -l "$file"|cut -d' ' -f6-8`
    #tem_file="$file.tmp$$"
    #if test -e "tem_file"
    #then
        #echo "tem_file" not available now
        #exit 1
    #fi
    convert -gravity south -pointsize 36 -draw "text 0,10 '$date'" "$file" "$file" 
done
    
