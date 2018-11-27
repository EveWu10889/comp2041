#!/bin/bash

if test $# -gt 0
then
    for arg in "$@"
    do  
        display "$arg"
        echo -n "Address to e-mail this image to? "
        read address
        if test -n "$address"
        then
            echo -n "Message to accompany image? "
            read message
            echo "$message"|mutt -s "pictures" -e 'set copy=no' -a "$arg" -- $address
            echo "$arg sent to $address"
        else
            echo "Please enter the valid email for $arg!"   
        fi  
    done
else
    echo "Please input at least one image!"
    exit 1
fi
