#!/usr/bin/perl -w

while ($line = <>) {
    if ($line =~ /(-?\d+(\.\d+)?)\D*$/) {
        print "$1\n";
        print "$2\n";
    }
}
