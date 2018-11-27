#!/bin/bash

# commit two files with the same contents

./legit.pl init
echo line 1 > a
./legit.pl add a
./legit.pl commit -m "first commit"
echo line 1 > b
./legit.pl add b
./legit.pl commit -m "second commit"






