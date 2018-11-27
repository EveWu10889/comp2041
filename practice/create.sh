#!/bin/bash

start=$1
finish=$2
filename="$3"

i=$start
while (($i <= $finish))
do
    echo $i
    i=$(($i + 1))
done >>$filename
