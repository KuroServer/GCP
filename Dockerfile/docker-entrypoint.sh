#!/bin/sh

GCS_BUCKET_NAME=thinker-school

# env check
#if [ -z $GCS_BUCKET_NAME ]; then
#    echo "Empty GCS_BUCKET_NAME..." >&2
#    exit 1
#fi

# make mount point
mkdir -p /mnt/gcs/$GCS_BUCKET_NAME

# mount gcs
gcsfuse -o allow_other $GCS_BUCKET_NAME /mnt/gcs/$GCS_BUCKET_NAME

# create symlink
if [ -L /var/www/html ]; then
    rmdir /var/www/html
else
    rm -rf /var/www/html
fi
ln -sfn /mnt/gcs/$GCS_BUCKET_NAME /var/www/html

# main process
#httpd -g "daemon off;"

# unmount
#fusermount -u /mnt/gcs/$GCS_BUCKET_NAME
