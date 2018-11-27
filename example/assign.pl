#!/usr/bin/perl -w

sub assign {
    $_[0] = $_[1];
}

assign($x, 42);
print $x;
