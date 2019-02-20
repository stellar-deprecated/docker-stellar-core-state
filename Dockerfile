FROM postgres:9.5

MAINTAINER Graydon Hoare <graydon@stellar.org>

EXPOSE 5432

RUN mkdir /data
RUN mkdir /postgresql-unix-sockets
RUN chown postgres:postgres /postgresql-unix-sockets
ADD add-unix-socket.sh docker-entrypoint-initdb.d/
ADD adjust-performance-settings.sh docker-entrypoint-initdb.d/
VOLUME /data
VOLUME /postgresql-unix-sockets
