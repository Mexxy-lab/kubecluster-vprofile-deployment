#!/bin/bash
set -e

DATA_DIR="/var/lib/mysql"

if [ -d "$DATA_DIR/mysql" ]; then
  echo "MySQL data directory detected as already initialized."
else
  echo "MySQL data directory is empty or not initialized, cleaning up..."
  rm -rf "${DATA_DIR:?}"/*
fi

exec docker-entrypoint.sh mysqld
