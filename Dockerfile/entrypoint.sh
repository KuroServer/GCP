#!/bin/bash
source /etc/apache2/envvars
chown -R www-data:www-data *
sudo -u www-data gcsfuse example-bucket ./
exec apache2 -D FOREGROUND
