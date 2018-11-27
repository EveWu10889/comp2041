#!/usr/bin/perl -w

sub is_prime {
    $i = 2;
    my ($n) = @_;
    while ($i < $n) {
        if($n % $i == 0) {
            return 0;
        }
        $i++;  
    }   
    return 1;
}

$num = 2;
while ($num < 10){
    if (is_prime($num)) {
        print "$num\n";    
    }
    $num ++;
}
