#!/bin/bash

# check status with complex rm commands

./legit.pl init
touch a b c d
./legit.pl commit -a -m "first commit"
echo 1 > a 
echo 2 > b
echo 3 > c
./legit.pl add a
./legit.pl commit -m "second commit"
./legit.pl rm --cached --force c
echo hello >> b
./legit.pl rm a c
./legit.pl commit -m "third commit"
./legit.pl rm --force --cached d
./legit.pl commit -m "forth commit"
./legit.pl status

