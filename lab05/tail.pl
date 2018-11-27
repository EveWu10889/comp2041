#!/usr/bin/perl -w 
$n = 10; 
if (@ARGV && $ARGV[0] =~ /^-[0-9]+$/) {
    $n = shift @ARGV;
    $n =~ s/-//g;
}

if (!@ARGV) {
    $ARGV[0] = "-";
}

foreach $file (@ARGV) {
    
        my $i = 0;
        open (my $input, "<$file");
        if(scalar @ARGV > 1) {
            print "==> $file <== ","\n";
        }
        @lines = <$input>;
        if ((scalar @lines) <= $n){
            print @lines;   
        }
        else {
           $num = $#lines-$n+1; 
           while ($num <= $#lines) {
                print $lines[$num]; 
                $num++;            
            }
        }
    close ($input);
}
