#!/bin/sh

if test $# = 0
then
    echo "Usage $0: <program>" 1>&2
    exit 1
fi

for program in "$@"
do
    program_found=''
    for directory in `echo "$PATH" | tr ':' ' '`
    do
        #echo $directory
        f="$directory/$program"
        if test -x "$f"
        then
            ls -ld "$f"
            $program_found=1
        fi
    done
    if test -z $program_found
    then
        echo "$program not found"
    fi
done

