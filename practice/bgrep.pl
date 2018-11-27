#!/usr/bin/perl -w

open my $in, "<", "$ARGV[0]";
while ($line = <$in>) {
    #print $line;
    while ($line =~ /($ARGV[1])/) {
        
        if ($line =~ /[^\(]*($ARGV[1])[^\)]/) {
           #print "1: $1\n";
           $replace = $1;
           $new = "($1)";
           $line =~ s/$replace/$new/g;             
        } else {
            last;
        }
        print $line;
    } 
     
}
