#!/bin/bash

echo "Setting kernel parameters for Redis (needs container in privileged mode)"
sysctl vm.overcommit_memory=1

echo "=================================="
echo "Starting redis server on 22122"
echo "=================================="
redis-server /app/redis.conf --port 22122 &

sleep 2

echo "=================================="
echo "Starting Dynomite"
echo "=================================="
/app/dynomite --conf-file=/app/dynomite.yml -v5

