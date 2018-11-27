#!/usr/bin/perl -w

if (@ARGV != 2) {
    die "Usage: $0 <file> <letter>\n";
}

open $in, "<", "$ARGV[0]";
@file = <$in>;

#print @file;

for $line (@file) {
    while ($line =~ /$ARGV[1]/) {
        if ($line =~ /[^\(]*($ARGV[1])[^\)]/) {
            $old = $1;
            $line =~ s/$old/\($old\)/g;
        }
        else {
            last;
        }
        print $line;  
    }
    #print $line;
}

#print @file;
