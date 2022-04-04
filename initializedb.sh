echo "Starting Database Initialization Script."
mkdir -p /run/mysqld
chmod 777 -v /run/mysqld
mkdir -p /config/database
if [ -z "$(ls -A /config/database)" ]; then
   echo "Initializing . . ."
   mysqld --initialize --datadir /config/database
   mysqld --datadir /config/database &
   cat /software/initializedb.sql | mysql
else
   mysqld --datadir /config/database &
fi