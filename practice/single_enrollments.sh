#!/bin/sh
cut -d'|' -f2|sort|uniq -c|egrep '^ *1 '|sed 's/.* //'

