#!/usr/bin/perl -w

my %hash;

foreach $word (@ARGV){
    $hash{$word}+=1;
    if ($hash{$word} == 1) {
        print "$word ";
    }
}


print "\n";
