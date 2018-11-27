#!/usr/bin/perl -w

    open (my $f, "<", $ARGV[1]) or die;
    #print $f,"\n";
    $count = 0;
    $sum = 0;
    while ($line = <$f>) {
        $line =~ /([\/\d]+) +(\d+) +(.*)/;
        $name = $3;
        while 
            if ($line =~ /([\/\d]+) +(\d+) +($name)/) {
                whales{$name}{sum}++;
                whales{$name}{count} += $2;    
                #print $count,"\n";   
            }   
    }
    print "$ARGV[0] observations: $sum pods, $count individuals\n";




