#!/usr/bin/perl -w
my %count;
my %words;
#$found_word = lc $ARGV[0];
foreach $file (glob "lyrics/*.txt") {
        #print "$file\n";
        open my $f, "<", $file;
        $artist = $file;
        $artist =~ s/\.txt$//g;
        $artist =~ s/lyrics\///g;
        $artist =~ s/_/ /g;
        #print $artist;
        #chomp;
        while ($line = <$f>) {
            #print;
            #s/"\*\*\*([^*]+)\*\*\*"//g;
            $line = lc $line;
            foreach $word ($line =~ /[a-z]+/g) {
                #$sum ++;
                $words{$artist}++;
                $count{$artist}{$word}++;            
            }
      
        }
}
 
foreach $found_word (@ARGV) {
    $found_word = lc $ARGV[0];
    foreach $artist (sort keys %words) {
        my $num = $count{$artist}{$found_word}||0;
        my $sum = $words{$artist}; 
        my $fre = log($num+1)-log($sum);
        printf "log((%d+1)/%6d) = %8.4f %s\n", $num, $sum, $fre, $artist;
    }
}




