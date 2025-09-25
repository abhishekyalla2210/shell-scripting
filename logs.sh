#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[34m"

LOGS="/var/log/shell-script"
SCRIPTNAME=$( echo $0 | cut -d "." -f1 )
LOGFILE="$LOGS/$SCRIPTNAME.log" 

mkdir -p $LOGS
echo "script start at: $(date)"


if [ $USERID -ne 0 ]; then
    echo -e " $R please login with root access $N"
    exit 1
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

dnf list installed mysql &>>$LOG_FILE
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "Python3 already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

