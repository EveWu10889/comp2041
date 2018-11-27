#!/usr/bin/perl -w

foreach $word (@ARGV) {
    #print "$word\n";
    if ($word =~ /[aeiou]{3}/i) {
        print "$word ";
    } 
}
print "\n";


