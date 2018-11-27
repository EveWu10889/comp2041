#!/usr/bin/perl -w

while ($line = <STDIN>) {
    @word = split /\s+/ , $line;
    @sort_word = sort @word;
    print join (" ", @sort_word), "\n";    
}
