#!/usr/bin/perl -w

#$start = $ARGV[0];
#$end = $ARGV[1];
#$F = $ARGV[3];
#print $ARGV[3];
open $f,">$ARGV[2]";
foreach $num ("$ARGV[0]".."$ARGV[1]") {
    #print "$num\n";
    print $f "$num\n";
}

close $f;
