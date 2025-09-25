#!/bin/bash

status=$($?)

if [ $status -eq 0 ]; then
    echo "it is a success"
else 
    echo "it is a failure"
fi