#!/usr/bin/perl -w

while ($line = <STDIN>) {
    while ($line =~ s/<!(.*?)>/<__REPLACE_ME__>/) {
        $s = `$1`;
        $line =~ s/<__REPLACE_ME__>/$s/;
    }
    while ($line =~ s/<(.*?)>/<__REPLACE_ME__>/) {
        $s = `cat $1`;
        $line =~ s/<__REPLACE_ME__>/$s/;
    }
    print $line;
}
