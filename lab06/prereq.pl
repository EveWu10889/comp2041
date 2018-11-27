#!/usr/bin/perl -w
$course = $ARGV[0];
    $urlpost = "http://www.handbook.unsw.edu.au/postgraduate/courses/2018/$course.html";
    $urlunder = "http://www.handbook.unsw.edu.au/undergraduate/courses/2018/$course.html";  
    open my $page, "wget -q -O- $urlunder $urlpost|";
    while ($line = <$page>) {
        if ($line =~ /Prerequisite/i) {
            $line =~ /<p>[Pp]rerequisites?: ([^><]+)<\/p>/;
            @prerequisite = $1 =~ /[A-Z]{4}[0-9]{4}/g;
            foreach (@prerequisite) {
                $prerequisites{"$_"} = 1;
            }
        }
    }


foreach (sort keys %prerequisites) {
    print "$_\n"
}
