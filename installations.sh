#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ];then
    echo "it is a success"
else 
    echo "it is a failure"
if