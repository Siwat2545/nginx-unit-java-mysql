FROM ghcr.io/siwatinc/nginx-unit-java:latest
ADD ./entrypoint.sh /software/entrypoint.sh
RUN chmod +x /software/entrypoint.sh
ADD ./initializedb.sh /software/initializedb.sh
ADD ./initializedb.sql /software/initializedb.sql
RUN apt-get update && apt-get -y install mysql-server
WORKDIR /config

