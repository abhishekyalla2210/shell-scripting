#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "it is a failed"
    exit 1

fi

VALIDATE(){
   if [ $1 -eq 0 ]; then
    echo "$2 is a success"
   else
    echo "$2 is a falure"
 fi
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "nginx"
