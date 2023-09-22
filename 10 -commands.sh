#!/bin/bash
#There are 4 types of commands are available
#1. binary (/bin, /sbin)
#2. Aliases
#3. Functions Functions are nothing but a set of commands that can be written in a sequence and can be called n number of times as per requirement
#4. shell or built in commands

#HOw to declare a function

# f() {
#     echo hai
# }

#THis is how we call function
# f

stat()
{


    echo "no of sessions opened are $(who | wc -l)"

}
stat

sleep 5

stat
