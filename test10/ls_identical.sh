#!/bin/bash

IFS=$(echo -en "\n\b")
if (($# == 2))
then 
   
        for sub_file_1 in `ls $1`
        #read file
        do
            #echo $sub_file_1
            for sub_file_2 in `ls $2`       
            do
                #echo $sub_file_2
                if [[ $sub_file_1 == $sub_file_2 ]]
                then
                    #echo "$sub_file_1"
                    diff $1/$sub_file_1 $2/$sub_file_2 > /dev/null

                    if [ $? == 0 ]
                    then
                        echo "$sub_file_1"
                    fi
                fi
            done
        done    
else 
    echo "Please input two directories!"
    exit 1
fi

