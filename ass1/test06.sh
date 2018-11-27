#!/bin/bash

# remove with various options

./legit.pl init
echo 1 > a
touch b c d
./legit.pl add a b c 
./legit.pl commit -a -m "first commit"
echo 2 >> a
./legit.pl add a b
echo 3 >> c
echo 4 >> d
./legit.pl rm --cached a
./legit.pl rm --force --cached b
./legit.pl rm --force c 
./legit.pl rm --cached --force d
./legit.pl status



