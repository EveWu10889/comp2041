#!/usr/bin/perl -w

foreach $filename (@ARGV) {
    open (my $f, "<", $filename) or die;
    #print $f,"\n";
    $count = 0;
    while ($line = <$f>) {
        if ($line =~ /([\/\d]+) +(\d+) +(Orca.*)/) {
            
            $count += $2;    
            #print $count,"\n";   
        }   
    }
    print "$count Orcas reported in $filename\n";
}





