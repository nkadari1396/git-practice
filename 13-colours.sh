#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then
        echo -e "${R}please run this script with root privileges${N}"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installed Failed"
        exit 1
    else
        echo "$2 installed Success"
    fi

}

CHECK_ROOT

dnf list installed git
if [ $? -ne 0 ]
then
    echo -e "${R}git is not installed checking it${N}"
    dnf install git -y
    VALIDATE $? "Git installatiG"
else
    echo -e "${G}git is already installed nothing to do${N}"

fi

dnf list installed Mysql
if [ $? -ne 0 ]
then 
    echo -e "${R}Mysql is not installed checking it${N}"
    dnf install Mysql -y
    VALIDATE $? "Mysql installing"
else
    echo -e "${G}Mysql is already installed nothing to do${N}"
fi