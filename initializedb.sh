echo "Starting Database Initialization Script."
if [ -z "$(ls -A /config)" ]; then
   echo "Initializing . . ."
   cp -rv /var/lib/mysql /config/database
   cat /software/initializedb.sql | mysql
fi