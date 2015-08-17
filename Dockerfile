FROM postgres:9.4.2

MAINTAINER Mat Schaffer <mat@stellar.org>

EXPOSE 5432

RUN mkdir /data
RUN mkdir /postgresql-unix-sockets
ADD add-unix-socket.sh docker-entrypoint-initdb.d/
ADD adjust-performance-settings.sh docker-entrypoint-initdb.d/
VOLUME /data
VOLUME /postgresql-unix-sockets
