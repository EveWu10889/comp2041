#!/usr/bin/perl -w

my %hash;
$count = $ARGV[0];
#print $count;

while($line = <STDIN>) {
    foreach $word (split /\n/, $line) {
        #print "$word**";
        $hash{$word}+=1;
        
    }

}

foreach $k1 (keys %hash) {
    if ($hash{$k1} == $count) {
            print "Snap: $k1\n";
        }
}
