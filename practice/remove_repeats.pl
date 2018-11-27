#!/usr/bin/perl -w

if (@ARGV == 0) {
    print "\n";
    exit(1);
}
print "$ARGV[0] ";
for($i = 1; $i < @ARGV; $i++) {
    $count = 0;
    for($j = $i-1; $j >= 0; $j--) {        
        if ($ARGV[$i] ne $ARGV[$j]) {
            $count++;
            next;   
        } else {
            last;
        }
    }
    #print "count: $count\n";
    if($count == $i) {
        print "$ARGV[$i] ";
    }
}
print "\n";


