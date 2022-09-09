#!/bin/bash
for port in $(seq 1 6);
do
redis-server ~/web/redis_cluster/node-${port}/conf/redis.conf
done
