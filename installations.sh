#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "it is a failed"

fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql is a success"
else
    echo "mysql is a falure"
fi
