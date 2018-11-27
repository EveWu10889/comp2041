#!/usr/bin/perl -w

@sort = sort {$count{$a} <=> $count{$b}} @array;

my ($n) = @_;
