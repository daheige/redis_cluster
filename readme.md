# redis 6.0/7.0 cluster搭建
先安装好redis,然后执行如下操作：
```shell
sh mk-redis-node.sh
sh start-nodes.sh
sh create-cluster.sh
```
输入yes回车即可
```shell
slots:[5461-10922] (5462 slots) master
1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
create redis cluster success
```

# redis-cli命令终端
```shell
sh redis-cli-node.sh
127.0.0.1:6381>
或者 redis-cli -p 6381 -c
```

# 查看集群信息
```
127.0.0.1:6383> cluster info
cluster_state:ok
cluster_slots_assigned:16384
cluster_slots_ok:16384
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:6
cluster_size:3
cluster_current_epoch:6
cluster_my_epoch:3
cluster_stats_messages_ping_sent:1142
cluster_stats_messages_pong_sent:1132
cluster_stats_messages_meet_sent:1
cluster_stats_messages_sent:2275
cluster_stats_messages_ping_received:1132
cluster_stats_messages_pong_received:1143
cluster_stats_messages_received:2275
127.0.0.1:6383> cluster nodes
cd8fb879fb4d6de5f18ca617c875c50c668b4a7d 127.0.0.1:6383@16383 myself,master - 0 1662655409000 3 connected 10923-16383
0e24c950400e0892d018752b69514fbddaef8890 127.0.0.1:6381@16381 master - 0 1662655409575 1 connected 0-5460
044bd86043ff5f8401dc9a9d56d96c1008961685 127.0.0.1:6382@16382 master - 0 1662655409575 2 connected 5461-10922
f49ff0a4e3a79425ae05af2c713b0da8bbf65ca4 127.0.0.1:6384@16384 slave 044bd86043ff5f8401dc9a9d56d96c1008961685 0 1662655408000 2 connected
a691c835c4223b66141c1ace8c09185d697d9eac 127.0.0.1:6386@16386 slave 0e24c950400e0892d018752b69514fbddaef8890 0 1662655408871 1 connected
512de9f37e48f11149d4f39b6d28f0d7df1d61e9 127.0.0.1:6385@16385 slave cd8fb879fb4d6de5f18ca617c875c50c668b4a7d 0 1662655409878 3 connected
```

到这里你的redis6.0/7.0 cluster搭建好了
