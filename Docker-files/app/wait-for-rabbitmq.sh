#!/bin/bash

host="$1"
port="$2"

echo "⏳ Waiting for RabbitMQ at $host:$port..."

while ! nc -z "$host" "$port"; do
  sleep 2
done

echo "✅ RabbitMQ is up at $host:$port — starting Tomcat..."
exec catalina.sh run
