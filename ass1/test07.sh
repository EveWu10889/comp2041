#!/bin/bash

# check status with simple rm commands

./legit.pl init
touch a b c d
./legit.pl add a b
./legit.pl commit -m "first commit"
echo 1 > a 
./legit.pl commit -a -m "second commit"
rm d 
echo 2 > b
./legit.pl rm a
./legit.pl commit -m "third commit"
echo 3 > c
./legit.pl add a b c d 
./legit.pl commit -m "forth commit"
./legit.pl status



