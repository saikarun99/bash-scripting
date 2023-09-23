#!/bin/bash

#condition helps us to execute the command only if some factor are true

#syntax of case

# case $var in 
#     opt 1) commands-x ;;
#     opt 2) commands-y ;;
# esac

ACTION=$1

case $ACTION in
    start) 
     echo "starting payment service"
     exit 0
     ;;
     stop)
     echo "stopping payment service"
     exit 1
     ;;
     restart)
     echo "restarting payment service"
     exit 2
     ;;
     *)
     echo "valid options are start stop restart"
     echo "example usage: bash scriptname stop"
     esac