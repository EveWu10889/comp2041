#!/usr/bin/perl -w 

    open (my $f, "<", $ARGV[0]) or die;
    #print $f,"\n";
    while ($line = <$f>) {
        $line =~ /([\/\d]+) +(\d+) +(.*)/;
        $name = $3;
        $c = $2;
        $name =~ tr/A-Z/a-z/;
        $name =~ s/\s+/ /g;
        $name =~ s/[s ]$//g;
        #print "$name\n";  
        #print "*************************","\n";
        $whales{$name}{sum}++;
        $whales{$name}{count} += $c;
        #print $whales{$name}{sum},"\n";
        #print "*************************","\n";
        #print $whales{$name}{count},"\n";
        #print "*************************","\n";
        
      }
      foreach $n (sort keys (%whales)) {
      print "$n observations: $whales{$n}{sum} pods, $whales{$n}{count} individuals\n";
    }


