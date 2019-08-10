#!/bin/bash
source /etc/apache2/envvars
chown -R www-data:www-data *
sudo -u www-data gcsfuse thinker-school ./
exec apache2 -D FOREGROUND
