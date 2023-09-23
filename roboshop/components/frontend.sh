#! /bin/bash

#validating the user is root user or not

stat()
{
if [ $1 == 0 ]; then
       echo "successful"
else 
       echo "failed"
       exit 2
fi

}

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then

echo "Script is expected to be run by root user or with a sudo privilege \n \t Ex: sudo wrapper.sh frontend"

exit 1

fi
echo "configuring frontend"

echo "installing frontend"

yum install nginx -y &>> /tmp/frontend.log


stat $?

echo "starting nginx"
 systemctl enable nginx &>> /tmp/frontend.log
 systemctl start nginx &>> /tmp/frontend.log
 stat $?

echo "downloading the frontend component"
 curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
 stat $?

 echo "clean up of default front end"
 cd /usr/share/nginx/html &>> /tmp/frontend.log
 rm -rf * &>> /tmp/frontend.log

 stat $?

 echo "extracting frontend"
 unzip /tmp/frontend.zip &>> /tmp/frontend.log
 stat $?
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf

#validate the user who is running the script
 
