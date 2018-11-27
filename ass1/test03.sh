#!/bin/bash

# remove with adding and committing

./legit.pl init
touch a b
./legit.pl commit -m "first commit"
./legit.pl add a
./legit.pl commit -m "second commit"
./legit.pl commit -a -m "all commit"
./legit.pl rm --cached b
./legit.pl commit -m "third commit"
./legit.pl rm a
./legit.pl commit -m "forth commit"
./legit.pl rm b
./legit.pl commit -m "fifth commit"
./legit.pl rm b
./legit.pl commit -m "sixth commit"
./legit.pl rm b
./legit.pl commit -m "seventh commit"
rm a
./legit.pl commit -m "last commit"
rm b
./legit.pl commit -m "last commit"

