#!/bin/bash

#make redis durable on disk
sed -i 's/appendonly no/appendonly yes/g' /etc/redis/redis.conf

#Start redis server on 22122
redis-server --port 22122 &

/app/dynomite --conf-file=/app/redis_single.yml -v5
