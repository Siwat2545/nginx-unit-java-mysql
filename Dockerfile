FROM ghcr.io/siwatinc/nginx-unit-java:latest
ADD ./entrypoint.sh /software/entrypoint.sh
RUN chmod +x /software/entrypoint.sh
ADD ./initializedb.sh /software/initializedb.sh
ADD ./initializedb.sql /software/initializedb.sql
WORKDIR /config
RUN apt-get update && apt-get -y install mariadb-server && echo '[server]' >> /etc/mysql/my.cnf && echo 'datadir=/config/database' >> /etc/mysql/my.cnf
