#!/bin/bash

services="sshd postfix acpid apparmor apport"

for i in $services; do
    ps -C "$i"
    if [ $? -ne 0 ]; then
        echo "$i is stopped"
        echo "$i is stopped" | mail -s "Service monitor" "bharathsh98@gmail.com"
        echo "Attempting to start $i"
        sudo service "$i" start 
    fi
done
