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