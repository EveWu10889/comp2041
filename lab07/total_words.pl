#!/usr/bin/perl -w

my $sum = 0;
while ($line = <>) {
    chomp $line;
    
    foreach $word (split /[^a-zA-Z]+/, $line) {
       $word =~ tr/A-Z/a-z/;
       if ($word ne "") {
       #print "$word\n";
        $sum += 1;
       } 
    }
}

print "$sum words\n";
