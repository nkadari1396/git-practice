#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$1 is...FAILED"
        exit 1
    else
        echo "$3 is...SUCCESS"
    fi
}

CHECK_ROOT

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed...going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL" "Good News"
    
else
    echo "MySQL is already installed..nothing to do"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install"
    dnf install nginx -y
    VALIDATE $? "Installing nginx" "Good News"
else
    echo "MySQL is already installed..nothing to do"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    VALIDATE $? "Installing Git" "Good News"
else
    echo "Git is already installed, nothing to do.."
fi

