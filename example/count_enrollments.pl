#!/usr/bin/perl -w

open my $in, "<", "course.txt" or die "$0: cannot open $!\n";

foreach $course (sort keys %count)


@fields = split /\|/, $line
