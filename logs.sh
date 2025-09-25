#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[34m"

LOGS="/var/log/shell-script"
SCRIPTNAME=$( echo $0 | cut -d "." -f1 )
LOGFILE="$LOGFILE/$SCRIPTNAME.log" 

mkdir -p $LOGFILE
echo "script start at: $(date)"


if [ $USERID -ne 0 ]; then
    echo -e " $R please login with root access $N"
    exit 1
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" 
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

dnf list installed mysql &>>$LOGFILE
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOGFILE
    VALIDATE $? "MySQL"
else
    echo -e "MySQL already exist ... $Y SKIPPING $N"
fi

dnf list installed nginx &>>$LOGFILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOGFILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
fi

dnf list installed python3 &>>$LOGFILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOGFILE
    VALIDATE $? "python3"
else
    echo -e "Python3 already exist ... $Y SKIPPING $N"
fi

