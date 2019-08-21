#!/bin/bash
/usr/sbin/init
sudo systemctl start rpcbind 
mkdir -p /mnt/disks/thinker-disk
sudo mount -t nfs 10.146.15.198:/mnt/disks/thinker-disk /mnt/disks/thinker-disk
sudo systemctl start httpd
