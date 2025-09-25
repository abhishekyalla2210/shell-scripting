#!/bin/bash

echo "enter the number"
read NUMBER

if [ $(($NUMBER % 2,3,5 -eq 0 ))];then
    echo "the given number $NUMBER is a prime number"
else    echo "it is not prime"
fi