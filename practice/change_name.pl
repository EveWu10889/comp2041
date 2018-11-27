#!/usr/bin/perl -w

while (<>) {
    chomp;
    @f = split /\|/;
    $f[2] =~ s/(.*), (.*)/$2 $1/;
    print join("|", @f), "\n";
}
