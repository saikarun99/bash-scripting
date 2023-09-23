#! /bin/bash

#validating the user is root user or not

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then

echo "Script is expected to be run by root user or with a sudo privilege \n \t Ex: sudo wrapper.sh frontend"

exit 1

fi
echo "configuring frontend"

echo "installing frontend"

yum install nginx -y &>> /tmp/frontend.log

if [ $? == 0 ]; then
       echo "Installation successful"
else 
       echo "Installation failed"
fi
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf

#validate the user who is running the script
 
