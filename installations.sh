#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "it is a failure"
else 
    echo "it is a succes"
fi