#! /bin/bash

#validating the user is root user or not

component=mongodb
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
echo "configuring mongodb"

echo "setting up repos"

curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo

echo "installing mongodb"

yum install -y mongodb-org &>> ${LOGFILE}

stat $?

echo "starting mongodb"
 systemctl enable mongod  &>> ${LOGFILE}
 systemctl start mongod   &>> ${LOGFILE}
 stat $?

echo "updating the ip- address"
    sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
    stat $?

 echo "downloading the schema"

 
 curl -s -L -o /tmp/${component}.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
 stat $?

  echo "extracting the ${component}"
 
 cd /tmp
 unzip mongodb.zip &>> ${LOGFILE}

 stat $?

 echo "injecting the ${component} schema"
 cd ${component}-main
 mongo < catalogue.js &>> ${LOGFILE}
 mongo < users.js &>> ${LOGFILE}
 stat $?

 echo "Installation is completed"


 
