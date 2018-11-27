#!/bin/bash
echo $#
if (($# == 1))
then
    start=1
    finish=$1
elif (($# == 2))
then
    start=$1
    finish=$2
else
    echo "Usage: $0 <start> <finish>" 1>&2
    exit 1
fi

for argument in "$@"
do
    # This use of a regex is a bash extension missing from many Shells
    # It should be avoided if portability is a concern
    if [[ "$argument" =~ '^-?[0-9]+$' ]]
    then
        echo "$0: argument '$argument' is not an integer" 1>&2
        exit 1
    fi
done

number=$start
while ((number <= finish))
do
    echo $number
    number=$((number + 1))
done
