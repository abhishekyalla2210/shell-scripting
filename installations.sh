#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "it is a failed"
else 
    echo "it is a success"
fi
