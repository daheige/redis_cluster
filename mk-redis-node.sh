#!/bin/bash

for port in $(seq 1 6); 
do 

mkdir -p ~/web/redis_cluster/node-${port}/conf

touch ~/web/redis_cluster/node-${port}/conf/redis.conf

cat << EOF >~/web/redis_cluster/node-${port}/conf/redis.conf

port 638${port} 

bind 0.0.0.0

cluster-enabled yes
cluster-config-file node-638${port}.conf
cluster-node-timeout 5000

# 集群节点 ip host模式，宿主机ip
cluster-announce-ip 127.0.0.1
cluster-announce-port 638${port}
cluster-announce-bus-port 1638${port}

# 开启appendonly备份模式
appendonly yes
#appendfsync everysec
appendfilename "appendonly-638${port}.aof"

dbfilename dump-638${port}.rdb

# 对aof文件进行压缩时，是否执行同步操作
no-appendfsync-on-rewrite no

# 当目前aof文件大小超过上一次重写时的aof文件大小的100%时会再次进行重写
auto-aof-rewrite-percentage 100

# 重写前AOF文件的大小最小值 默认 64mb
auto-aof-rewrite-min-size 64mb

daemonize yes

EOF

done
