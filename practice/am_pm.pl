#!/usr/bin/perl -w

@file = <>;

for $line (@file) {
    if($line =~ /((\d+):(\d+):(\d+))/) {
        #print "$1\n";
        $time = $1;
        $hour = $2;
        $min = $3;
        $sec = $4;
        $suffix1 = 'am';
        $suffix2 = 'pm';
        $prefix = 0;
        if ($hour >= 12) {
            $abs = $hour - 12;
            if ($abs > 0 && $abs < 10) {
                $line =~ s/$time/$prefix$abs\:$min\:$sec$suffix2/;
            } elsif ($abs >= 10 && $abs < 12) {
                $line =~ s/$time/$abs\:$min\:$sec$suffix2/;
            } else {
                $line =~ s/$time/$hour\:$min\:$sec$suffix2/;
            }
        } elsif ($hour == 0) {
            $hour = 12;
            $line =~ s/$time/$hour\:$min\:$sec$suffix1/;
        } else {
            $line =~ s/$time/$hour\:$min\:$sec$suffix1/;
        }
    }
}

print @file;
