#!/bin/bash

# remove with --cached option after adding and committing

./legit.pl init
touch a b c d
./legit.pl add a b
echo 1 > a
./legit.pl commit -m "first commit"
echo 2 > b
./legit.pl rm a b 
echo 3 > c
./legit.pl rm --cached a
./legit.pl rm --cached b
./legit.pl rm --cached c
./legit.pl rm --cached d
./legit.pl commit -m "second commit"



