#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]; then
    echo "it is a failed"
    exit 1

fi

VALIDATE(){
   if [ $1 -eq 0 ]; then
    echo -e "$2 is a $G success $N"
   else
    echo -e "$2 is a $R failure $N"
    exit 1
    
 fi
}

dnf install mysql -y
if [ $? -ne 0]; then
    echo -e "$2 already exists ....$G skipping $N"
VALIDATE $? "mysql"

dnf install nginxadf -y
VALIDATE $? "nginx"

dnf isntall python -y
VALIDATE $? "python"
