#!/bin/bash
#validate the user who is running the script
 USER_ID=$(id -u)
 COMPONENT=frontend
 LOGFILE="/tmp/${COMPONENT}.log"

 if [$USER_ID -ne 0] ; then
        echo "script is expected to be executed by the root user or with a sudo privilege
        exit 1
 fi
 
