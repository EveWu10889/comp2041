#!/usr/bin/perl

while ($line = <>) {
    if ($line =~ /^(\w+)\s+(\d+)/) {
        #print "$1 $2\n";
        $name = $1;
        $count = $2;
        $fine{$name} += $count;
    }
}

@stu = sort {$fine{$b} <=> $fine{$a}} keys %fine;

#$max = $fine{$stu[0]};

print "Expel $stu[0] whose library fines total \$$fine{$stu[0]}\n";
