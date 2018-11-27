#!/usr/bin/perl -w

while (<>) {
chomp; # remove newline
($name, $mark) = split; # separate data fields
$marks{$name} .= ",$mark"; # accumulate marks
}
foreach $name (keys %marks) {
$marks{$name} =~ s/,//; # remove comma prefix
print "$name $marks{$name}\n";
}
