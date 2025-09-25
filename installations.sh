#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "it is a failed"
    exit 1

fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql is a success"
else
    echo "mysql is a falure"
fi

dnf install nginxghj -y

if [ $? -eq 0 ]; then
    echo "nginx is a success"
else
    echo "nginx is a falure"
     exit 1
fi

dnf install mongodb-mongosh -y

if [ $? -eq 0 ]; then
    echo "mongodb-mongosh is a success"
else
    echo "mongodb-mongosh is a falure"
fi