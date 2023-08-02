#!/bin/bash

DATE="$(date +%F)"
echo "$DATE"

sessions_count=$(who | wc -l)

echo "$sessions_count"