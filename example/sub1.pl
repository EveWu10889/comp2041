#!/usr/bin/perl -w

sub mypush {
    my ($array_ref,@elements) = @_;
    if (@elements) {
        @$array_ref = (@$array_ref, @elements);
    } else {
        @$array_ref = (@$array_ref, $_);
    }
}

$array = [1,2,3];
$x = 4;
@array = mypush(\@$array, $x);
print "@array\n";
