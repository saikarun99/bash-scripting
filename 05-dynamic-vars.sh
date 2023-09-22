#!/bin/bash

DATE="$(date +%F)"
echo Todays date is $DATE


sessions_count=$(who | wc -l)

echo "$sessions_count"