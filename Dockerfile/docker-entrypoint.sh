#!/bin/sh

# env check
if [ -z $GCS_BUCKET_NAME ]; then
    echo "Empty GCS_BUCKET_NAME..." >&2
    exit 1
fi

# make mount point
mkdir -p /mnt/gcs/$GCS_BUCKET_NAME

# mount gcs
gcsfuse -o allow_other $GCS_BUCKET_NAME /mnt/gcs/$GCS_BUCKET_NAME

# create symlink
if [ -L /var/lib/nginx/html ]; then
    rmdir /var/lib/nginx/html
else
    rm -rf /var/lib/nginx/html
fi
ln -sfn /mnt/gcs/$GCS_BUCKET_NAME /var/lib/nginx/html

# main process
nginx -g "daemon off;"

# unmount
fusermount -u /mnt/gcs/$GCS_BUCKET_NAME
