while (<>) {
    chomp;
    @a = split;
    #print "@a ";
    $h{$a[0]} .= $a[1];
}
#print "$h{a}\n";
print "@a";
