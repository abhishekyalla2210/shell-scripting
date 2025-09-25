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
    exit 1
    
 fi
}

dnf intall mysql -y
VALIDATE $? "mysql"

dnf intall nginx -y
VALIDATE $? "nginx"

dnf intall python -y
VALIDATE $? "python"
