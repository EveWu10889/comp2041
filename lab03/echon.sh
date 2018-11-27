#!/bin/bash

num=$#
start=0
end=$1
if [ $num -eq 2 ]
then
    
    if [ $1 -ge 0 ] 2>/dev/null
    then
         while [ $start -lt $end ]
         do
            echo $2
            start=$(($start + 1))
            echo -n
         done
    else
        echo "./echon.sh: argument 1 must be a non-negative integer" 1>&2
    fi    
else
    echo "Usage: ./echon.sh <number of lines> <string>" 1>&2   

fi
