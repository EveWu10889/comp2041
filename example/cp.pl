#!/usr/bin/perl -w

die "Usage: $0 <infile> <outfile>\n" if @ARGV != 2;

$infile = shift @ARGV;
$outfile = shift @ARGV;

open my $in, '<', $infile or die "Cannot open $infile: $!";
@lines = <$in>;
chomp @lines;
print @lines;
close $in;

open my $out, '>', $outfile or die "Cannot open $outfile: $!";
print $out @lines;
close $out;

exit 0;
