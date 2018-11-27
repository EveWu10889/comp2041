#!/bin/bash

# remove with --force option

./legit.pl init
touch a b c d
./legit.pl add a b
echo 5 >> b
./legit.pl rm --force a
./legit.pl commit -m "first commit"
echo 6 >> c
./legit.pl add c
./legit.pl commit -m "second commit"
./legit.pl rm --force a
./legit.pl rm --force b
./legit.pl rm --force c
./legit.pl rm --force d



