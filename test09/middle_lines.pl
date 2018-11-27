#!/usr/bin/perl -w

open my $f, "<", $ARGV[0];
my @array;
while ($line = <$f>) {
    push (@array, $line);
}

if (@array) {
    $n = @array;
    #print $n;
    if ($n % 2 != 0) {
        print $array[$n/2];
    } else {
        print $array[$n/2-1];
        print $array[$n/2];
    }
    #print @array;
} else {
    exit;
}
