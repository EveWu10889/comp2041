#!/usr/bin/perl -w

#our $max;
while($line = <>){
    if ($line =~ /\D*(-?([0-9]+)?\.?([0-9]+)?)\D*/) {
        #print "$line";
        $num = $1;
        push (@nums, "$num");
        push (@file, "$line");
    } else {
        next;
    }
}

$max = (sort {$b <=> $a} @nums)[0];
#print $max;

for $i (0..$#nums) {
    if($nums[$i] == $max) {
        print $file[$i];
    }
}
