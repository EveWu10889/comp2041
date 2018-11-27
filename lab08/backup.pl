#!/usr/bin/perl -w
#print $OUT (<$in>)
#print Backup of 'n.txt' saved as '.n.txt.3';

open my $in, "<", $ARGV[0];
$var = 0;
while (1) {
    $new = ".$ARGV[0].$var";
    $var++;
    if (-e $new) {
        next;
    }
    else {
        open my $out, ">", "$new";
        print $out (<$in>);
        print "Backup of '$ARGV[0]' saved as '$new'\n";
        last;
    }
}
