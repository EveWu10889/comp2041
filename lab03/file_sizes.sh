#!/bin/bash

for file in *
do
    lines=`wc -l <$file`
    #small file
    if [ $lines -lt 10 ]
    then
        file1="$file1 $file"
    #medium file
    elif [ $lines -lt 100 ]
    then
        file2="$file2 $file"
    #large file
    else
        file3="$file3 $file"
    fi
done

echo "Small files: $file1"
echo "Medium-sized files: $file2"
echo "Large files: $file3"

   
