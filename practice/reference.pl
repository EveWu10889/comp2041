#!/usr/bin/perl -w

@a = <>;
#print @a;

for $i (0..$#a) {
    if ($a[$i] =~ /^#(\d+)/){
        #print "$1";
        $a[$i] = $a[$1-1];
    }
}
print @a;
