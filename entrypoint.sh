#!/bin/bash

#Make database directory
mkdir -p /config/database

#Start MariaDB
mysqld &

#Initialize Database if necessary
chmod +x /software/initializedb.sh
bash /software/initializedb.sh

#Start Unit
unitd --no-daemon --control unix:/var/run/control-unit.sock &

#Apply Primary Full Configuration
curl -X PUT --data-binary @/software/unit/config.json --unix-socket /var/run/control-unit.sock http://localhost/config

#Idle Forever
tail -f /var/log/unit.log