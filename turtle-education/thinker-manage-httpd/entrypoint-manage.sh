#!/bin/bash

mkdir -p /mnt/disks/thinker-disk

sudo systemctl start rpcbind 
sudo systemctl enable rpcbind 

sudo mount -t nfs 10.146.15.198:/mnt/disks/thinker-disk /mnt/disks/thinker-disk

exec /usr/sbin/httpd -D FOREGROUND
