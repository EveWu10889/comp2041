#!/bin/bash

for jpg_file in `ls|echo "*.jpg"`
do
    png_file=`echo "$jpg_file"|sed -e 's/.jpg$/.png/g'`
    if test -e "$png_file"
    then
        echo "$png_file" already exists  
    else
        convert "$jpg_file" "$png_file" && rm "$jpg_file"
    fi
done

