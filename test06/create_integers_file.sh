#!/bin/bash


for start1 in $(seq $1 $2)
do
    echo $start1 >>$3
    start1=$(($start1+1))
done
