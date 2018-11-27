#!/usr/bin/perl -w
   if ($#ARGV+1 != 2) {
        die "Usage: ./echon.pl <number of lines> <string>\n";
   }
   $pattern = $ARGV[0];
    if ($pattern !~ /^[0-9]+$/) {
        die "./echon.pl: argument 1 must be a non-negative integer\n";
    }

    for ($i = 0; $i < $ARGV[0]; $i++) {
        print $ARGV[1],"\n";     
    }

