#!/bin/bash

#if condition ideally available in 3 formats

#1.simple if
#2. if else
#3. else if

# simple if
<<COMMENT
if [ expression ]; then
      commands
fi
 
 #commands are going to be executed only if the expression is true, if the expression is false commands will not be executed

 #if -else

 if [ expression ]; then

    command1

else
    command 2
fi

#elif

if [ expression 1 ]; then

    command 1

elif [ expression 2 ]; then
  
    command 2

elif [ expression 3 ]; then
  
  command 3

else 

command 4

fi

COMMENT

echo "demo on if usage"

action=$1

if [ "$action" == "start" ]; then
    echo "starting payment service"
    exit 0

elif [ "$action" == "stop" ]; then
        echo "stoping payment service"
        exit 1
elif [ "$action" == "restart"]; then
        echo "restarting payment service"
        exit 2
else 

echo "valid option is start only"
exit 3
fi