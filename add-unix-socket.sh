#!/bin/sh

# Place this file in docker-entrypoint-initdb.d/ in the postgresql container.

mkdir -p /postgresql-unix-sockets
chmod 0777 /postgresql-unix-sockets
sed -ri "s/^#(unix_socket_directories\s*=\s*)'([^']+)'/\1'\/postgresql-unix-sockets,\2'/" "${PGDATA}/postgresql.conf"
