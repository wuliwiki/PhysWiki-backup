#!/bin/bash

# usage:
#     sudo nohup ./sync.sh >> sync.log &

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

while true; do
    date
    echo -----------------------------------
    git add . && git commit -m 1 && git push
    printf "sleeping...\n\n\n"
    sleep 3h
done
