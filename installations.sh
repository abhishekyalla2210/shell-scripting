#!/bin/bash

status=$(echo $?)

if [ $status -ne 0 ]; then
    echo "it is a failed"
else 
    echo "it is a success"
fi