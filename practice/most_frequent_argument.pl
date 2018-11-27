#!/usr/bin/perl -w

for $arg (@ARGV) {
    $seen{$arg}++;
}

@sorted = sort {$seen{$b} <=> $seen{$a}} keys %seen;

for $arg (@ARGV) {
    if ($seen{$arg} == $seen{$sorted[0]}) {
        print "$arg\n";
        exit(1);
    }
}

#print "$sorted[0]\n";
