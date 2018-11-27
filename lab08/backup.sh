#!/bin/bash 



var=0 

while [ "1" ]
do
    
    new=`echo ".$1.$var"`
    var=$(($var+1))
    if [ -e $new ]
    then
        continue
    else
        cp $1 $new
        echo "Backup of '$1' saved as '$new'"
        break;
    fi   
done



