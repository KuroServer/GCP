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
    apache2 \
    php \
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

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh

EXPOSE 80 443
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
