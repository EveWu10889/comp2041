#!/usr/bin/perl -w

sub fib {
my ($n) = @_;
return 1 if $n < 1;
return $n * fib($n-1);
}

print fib(5);
