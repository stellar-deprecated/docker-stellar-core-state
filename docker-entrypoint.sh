#!/bin/bash
set -e

# This script overwrites the default postgres image docker-entrypoint.sh,
# ensuring that the socket directory is created and accessible prior to
# launching postgres.
#
# The Dockerfile moves the original entrypoint to /docker-entrypoint-real.sh
# 

mkdir -p /postgresql-unix-sockets
chmod 0777 /postgresql-unix-sockets
exec /docker-entrypoint-real.sh "$@"
