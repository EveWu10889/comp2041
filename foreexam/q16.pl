#!/usr/bin/perl -w


while ($line = <>) {
    if ($line =~ /(\D+)*(\d+)(\D+)*/) {
        #print "$2\n";
        $num = $2;
        push (@nums, $num);
        push (@file, $line);
    }
}

$max = (sort {$b <=> $a} @nums)[0];

for $line (@file) {
    if ($line =~ /$max/) {
        print $line;
    }
}
