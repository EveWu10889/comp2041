#!/usr/bin/perl -w

while ($line = <>) {
    while ($line =~ /(\d+\.\d+)/) {
        my $number = $1;
        #print "number: $1\n";
        $number =~ /^(\d+)/;
        #print "number: $1\n";
        my $rounded_number = $1;
        if ($number =~ /\.[5-9]/) {
            $rounded_number++;
        }
        $line =~ s/$number/$rounded_number/;
    }
    print $line;
}


