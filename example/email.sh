#!/bin/bash

if 
then 
else
fi

if wget -O- -q "$url" | egrep "$regexp" > /dev/null
then
    echo "hello" | mail -s "hello" $email_address 
    exit 0
