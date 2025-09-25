#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[34m"

if [ $USERID -ne 0 ]; then
    echo -e " $R please login with root access $N"
    exit 1
fi

VALIDATE(){ 
if [ $1 -ne 0 ]; then
    echo -e "installing $2  is $R failure $N"
    exit 1
else
    echo -e "installing $2 is a $G success $N"
    fi
}

    dnf remove mysql -y
    VALIDATE $? "mysql"

    dnf remove nginx -y
    VALIDATE $? "nginx"

    dnf remove python3 -y
    VALIDATE $? "python3"
