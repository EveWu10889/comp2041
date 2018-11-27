#!/usr/bin/perl -w

open my $f, "<", $ARGV[0];
#open my $out, ">", $ARGV[0];
while(<$f>) {       
    tr/[0-9]/#/;
    push @array, $_;
}

open my $out, ">", $ARGV[0];
print $out @array; 


