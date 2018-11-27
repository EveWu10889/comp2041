#!/usr/bin/perl -w

$count = 0;
if (@ARGV == 0) {
    die "Usage: ./identical_files.pl <files>\n";
}

open my $f, "<", $ARGV[0];
    @array = <$f>;
    #print @array;

foreach $file (@ARGV) {
    #print $f;
    open my $f1, "<", $file;
    
    @new = <$f1>;
   
    if (@new eq @array) {
        next;
    } else {
        print "$file is not identical\n";
        exit 0;
    }
    my $count++;
}

if ($count eq @ARGV) {
    print "All files are identical\n";
}
