#!/usr/bin/perl -w
my %count;
my %words;
$debug = 0;
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
        close $f;
}
 
@artists = keys %count;
foreach $song (@ARGV) {
    my %pro;
    if ($song eq '-d') {
        $debug = 1;
        next;
    }
    open my $f, "<", $song;
    while ($line = <$f>) {
        $line = lc $line;
        print $line;
        print "******";
        foreach $word ($line =~ /[a-z]+/g) {
            foreach $artist (@artists) {
                $pro{$artist} += log((($count{$artist}{$word}||0) + 1)/$words{$artist});
            }
        }
    }
    close $f;
    
    @sorted_artists = sort ({$pro{$b}<=>$pro{$a}} @artists);
    if ($debug) {
        foreach $artist (@sorted_artists) {
            printf "%s: log_probability of %.1f for %s\n", $song, $pro{$artist}, $artist;
        }
    }
    printf "%s most resembles the work of %s (log-probability=%.1f)\n", $song, $sorted_artists[0], $pro{$sorted_artists[0]};
}





