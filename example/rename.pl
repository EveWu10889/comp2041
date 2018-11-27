#!/usr/bin/perl -w

$filename = $ARGV[0];
$tmp_filename = "$filename.new";
print $tmp_filename;
open my $f, '<', $filename or die "$0: Can not open $filename: $!";
open my $g, '>', $tmp_filename or die "$0: Can not open $tmp_filename : $!";
rename "$tmp_filename", $filename;
print $tmp_filename;
