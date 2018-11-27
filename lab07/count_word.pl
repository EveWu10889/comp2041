#!/usr/bin/perl -w
$count = 0;
#open my $f, "<", $ARGV[1];
$found_word = lc $ARGV[0];
while (<STDIN>) {
    #print "$line\n";
    chomp;    
    foreach $word (split /[^a-zA-Z]+/) {
       $word = lc $word;
       #print "$word\n*******";
       if ($word eq $found_word) {
        $count ++;
        #print "$count****\n";
       } 
       
    }
}

    print "$ARGV[0] occurred $count times\n"; 

