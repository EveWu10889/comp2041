#!/bin/bash 

egrep 'F$'|cut -d'|' -f2|sort|uniq
