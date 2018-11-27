#!/usr/bin/perl -w

$#ARGV == 1 or die;

open my $f, "<", $ARGV[1];
$num = 1;
while ($line = <$f>) {
    if ($num == $ARGV[0]) {
        print $line,"\n";
        exit 0;       
    }
    $num++;
}

exit 1;
