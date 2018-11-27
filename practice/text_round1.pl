#!/usr/bin/perl -w

while($line = <>) {
    while ($line =~ /(\d+\.\d+)/) {
        #print "$1\n";
        $number = $1;
        $number =~ /^(\d+)/;
        $round_num = $1;
        if ($round_num =~ /\.[5-9]/) {
            $round_num++;
        }
        $line =~ s/$number/$round_num/;
    }
    print $line;
}
