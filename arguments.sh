#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 20 ]; then
    echo "the number is less than 20"
elif [ $NUMBER -eq 20 ]; then
    echo "it is equal to 20"    

else 
    echo "the number is greater than 20"
fi