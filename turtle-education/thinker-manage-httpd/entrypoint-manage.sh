#!/bin/bash

mkdir -p /mnt/disks/thinker-disk

systemctl start rpcbind 
 ystemctl enable rpcbind 

#mount -t nfs 10.146.15.198:/mnt/disks/thinker-disk /mnt/disks/thinker-disk

exec /usr/sbin/httpd -D FOREGROUND
