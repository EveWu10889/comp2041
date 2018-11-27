#!/bin/bash

u=$1
v=$2

while (($v != 0)) 
do
	t=$u
	u=$v
	v=$(($t%$v))
done

if (($u < 0)) 
then
	u=`expr -$u`
fi

echo "The gcd of $1 and $2 is $u"


