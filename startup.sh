#!/bin/bash

#Start redis server on 22122
redis-server --port 22122 &

/app/dynomite --conf-file=/app/redis_single.yml -v5
