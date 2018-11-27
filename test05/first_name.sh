#!/bin/bash

file=$1
 egrep 'COMP[29]041' $file | cut -d'|' -f3  | cut -d',' -f2 | sed s/^' '//g | cut -d' ' -f1 | sort | uniq -c | sort -n | tail -1 | egrep -i -o '[a-z]+'
#| sed -e s/'([a-z]|[A-Z])+" "$//g'


#
