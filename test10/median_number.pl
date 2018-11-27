#!/usr/bin/perl -w

if (@ARGV % 2 != 1) {
    die "numbers should be odd!\n";
}

@sort = sort {$a <=> $b} @ARGV;
$index = @sort / 2;
$medium = $sort[$index];

print "$medium\n";
