#!/bin/bash

mkdir -p /mnt/disks/thinker-disk

exec /usr/sbin/httpd -D FOREGROUND
