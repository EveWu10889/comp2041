#!/usr/bin/perl -w

@numbers = (4, 12, 5, 7, 2, 9);
print "@numbers\n";
($a, $b, $c, $d) = @numbers;
print "$a $b $c $d\n";

$x = $a;
$y = $b;
print "($x, $y)\n";
($x, $y) = ($y, $x);
print "($x, $y)\n";

@a = (9, 5, 7);
#@b = @a; # @b = (3,5,7);
@c = (1, @a, 9); # @c = (1,3,5,7,9);
if (@a == (@a)) {
print "yes1\n";
}
if ((@a) == ((@a))) {
print "yes2\n";
}

@b = sort(@a);
@c = reverse(@a);
print "@b\n";
print "@c\n";
