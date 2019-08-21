FROM centos

MAINTAINER KuroServerSystems

RUN yum -y update

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y install sudo

RUN yum -y install nfs-utils

RUN yum -y install httpd

RUN yum -y install epel-release \
 && rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
 && yum -y install --enablerepo=remi,remi-php72 php \
php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit \
php-pecl-xdebug php-gd php-intl php-symfony php-pdo php-xml php-tokenizer php-pear php-zip

RUN yum -y install composer 

COPY entrypoint-manage.sh /usr/local/bin/entrypoint-manage.sh
RUN chmod a+x /usr/local/bin/entrypoint-manage.sh

COPY httpd.conf /etc/httpd/conf/httpd.conf

EXPOSE 80 443
CMD ["/usr/sbin/init"]
