#! /bin/bash

#validating the user is root user or not

component=frontend
LOGFILE=/tmp/${component}.log
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

yum install nginx -y &>> ${LOGFILE}


stat $?

echo "starting nginx"
 systemctl enable nginx &>> ${LOGFILE}
 systemctl start nginx &>> ${LOGFILE}
 stat $?

echo "downloading the frontend component"
 curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
 stat $?

 echo "clean up of default front end"
 cd /usr/share/nginx/html &>> ${LOGFILE}
 rm -rf * &>> ${LOGFILE}

 stat $?

 echo "extracting frontend"
 unzip /tmp/frontend.zip &>> ${LOGFILE}
 stat $?

 echo "sorting the frontend files"
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo "restarting frontend"

systemctl daemon-reload
systemctl restart nginx



 
