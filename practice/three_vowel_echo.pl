#!/usr/bin/perl -w

for $arg (@ARGV) {
    if ($arg =~ /[aeiou][aeiou][aeiou]/i) {
        print "$arg ";
    }
}
print "\n";
