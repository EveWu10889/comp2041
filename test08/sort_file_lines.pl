#!/usr/bin/perl -w

my %hash;
my @array;
open my $file, "<", $ARGV[0];

while ($line = <>) {
    foreach $word (split /\n/, $line) {
        $hash{$word} = length $word;        
    }

}


foreach $k (sort { $hash{$a} <=> $hash{$b}
            or $a cmp $b
           } keys %hash) {
    print "$k\n";

}
