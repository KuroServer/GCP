FROM ubuntu

MAINTAINER KuroServerSystems

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
    apache2
RUN a2enmod rewrite

RUN apt-get update -y && apt-get install -y \
    php \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
#    php-hash \
    php-json \
    php-mbstring \
    php-mysqli \
    php-libsodium \
#    php-openssl \
#    php-pcre \
    php-imagick \
    php-xml \
    php-zip \

#    php-filter \
    php-gd \
    php-iconv \
#    php-mcrypt \
    php-simplexml \
    php-xmlreader \
#    php-zlib \

    php-ssh2 \
    php-ftp \
    php-sockets \

    php-opcache

RUN apt-get update -y && apt-get install -y \
    sudo \
    lsb-release \
    curl \
    gnupg

# gcsfuse-[バージョン名]を指定する

RUN export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` && \
    echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN groupadd fuse
RUN usermod -aG fuse www-data
    
RUN apt-get update -y && apt-get install -y \
    gcsfuse \
    vim

COPY entrypoint-school.sh /usr/local/bin/entrypoint-school.sh
RUN chmod a+x /usr/local/bin/entrypoint-school.sh

EXPOSE 80 443
ENTRYPOINT ["/usr/local/bin/entrypoint-school.sh"]
