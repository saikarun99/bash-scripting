#!/bin/bash
# variable is generally used to hold values dynamically.

a=45
b=56
c=xyz
#There is no concept of data types in linux
# everything in linux is considered to be a string

#How can I print the variable?
#using the special character "$" we can print the value of the variable

echo $a
echo $b
echo $c

# $a and ${a} both are same, prefer to use flower brackets

echo $x
#if you dont declare a variable and uses it then it gives null 
#value when we attempt to print its value but it never throws any error

#How to print the date in bash

Date="02AUG23"
echo "todays date is $Date"


