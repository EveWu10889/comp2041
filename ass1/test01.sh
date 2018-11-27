#!/bin/bash

# commit just one file (add, commit, show, log)

./legit.pl init
echo line 1 > a
echo hello > b
./legit.pl commit -a -m "first commit"
echo line 2 >> a
echo world >> b
./legit.pl add b
./legit.pl commit -m "second commit"
./legit.pl log
./legit.pl show 0:a
./legit.pl show 0:b
./leigt.pl show 1:a
./legit.pl show 1:b
./legit.pl show :a
./legit.pl show :b


