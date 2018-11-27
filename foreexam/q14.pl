#!/usr/bin/perl -w

foreach $word (@ARGV) {
    if ($word =~ /^(\d+)$/) {
        push (@nums, "$1");
    }
}

@sorted = sort {$a <=> $b} @nums;

print "@sorted\n";
