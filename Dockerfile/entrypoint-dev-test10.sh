#!/bin/bash

#Set GCS_BUCKET_NAME
GCS_BUCKET_NAME="thinker-school"

# env check
if [ -z $GCS_BUCKET_NAME ]; then
    echo "Empty GCS_BUCKET_NAME..." >&2
    exit 1
fi

# make mount point
mkdir -p /mnt/gcs/$GCS_BUCKET_NAME

# mount gcs
sudo gcsfuse -o allow_other $GCS_BUCKET_NAME /mnt/gcs/$GCS_BUCKET_NAME

# create symlink
if [ -L /var/www ]; then
    rmdir /var/www
else
    rm -rf /var/www
fi
ln -sfn /mnt/gcs/$GCS_BUCKET_NAME /var/www

mkdir /var/run/apache2

#source /etc/apache2/envvars
#chown -R www-data:www-data *
#sudo -u www-data gcsfuse $GCS_BUCKET_NAME ./
exec apache2 -D FOREGROUND
