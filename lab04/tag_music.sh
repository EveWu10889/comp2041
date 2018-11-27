#!/bin/sh

for file_path in "$@"
do
    album=`echo "$file_path"|cut -d'/' -f2`
    #echo "$album"
    year=`echo "$file_path"|cut -d'/' -f2|cut -d',' -f2|sed -r s/'^ '//`
    #echo "$year"
    track=`echo "$file_path"|cut -d'/' -f3|cut -d'-' -f1`
    #echo "$track"
    title=`echo "$file_path"|cut -d'/' -f3|cut -d'-' -f2|sed s/'^ '//`
    #echo "$title"
    artist=`echo "$file_path"|cut -d'/' -f3|cut -d'-' -f3|sed s/'.mp3'//|sed s/'^ '//`  
    #echo "$artist"
    id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$year" "$file_path" >/dev/null
done

