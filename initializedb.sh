echo "Starting Database Initialization Script."
mkdir -p /run/mysqld
chmod 777 -v /run/mysqld
mkdir -p /config/database
if [ -z "$(ls -A /config)" ]; then
   echo "Initializing . . ."
   cp -rv /var/lib/mysql /config/database
   mariadbd &
   cat /software/initializedb.sql | mysql
else
   mariadbd &
fi