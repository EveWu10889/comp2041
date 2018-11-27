#!/usr/bin/perl -w

while ($line = <>) {
    if ($line =~ /(\-?\d+(?:\.\d+)?)/) {
        print "$&";
        #print "$2";
    }
}
