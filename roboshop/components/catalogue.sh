#! /bin/bash
#validating the user is root user or not
component=catalogue
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
echo "configuring catalogue"
echo "installing nodejs"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> ${LOGFILE}
yum install nodejs -y &>> ${LOGFILE}
stat $?

id ${APPUSER} &>> ${LOGFILE}
if [ $? -ne 0 ]; then
    echo "create application user account"
    useradd roboshop
    stat $?
fi
echo "downloading the ${component}"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $?

echo "copying the ${component} to ${APPUSER} home directory:"

cd /home/${APPUSER}

rm -rf ${COMPONENT}
unzip -o /tmp/${component}.zip &>> ${LOGFILE}
mv ${component}-main ${component}
chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${component}/
stat $?

echo "generating the ${component} artifacts"
cd /home/${APPUSER}/${component}
npm install &>> ${LOGFILE}
stat $?

echo "configuring the ${component} system file"
sed -ie 's/MONGO_DNSNAME/172.31.38.68/' /home/${APPUSER}/${component}/systemd.service

mv /home/${APPUSER}/${component}/systemd.service /etc/systemd/system/${component}.service

echo "starting the ${component} service"
systemctl daemon-reload
systemctl start ${component}
systemctl enable ${component}
stat $?

echo "Installation is completed"
