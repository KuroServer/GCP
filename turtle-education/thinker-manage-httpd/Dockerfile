\FROM centos

MAINTAINER KuroServerSystems

RUN yum -y update && yum -y install httpd

RUN yum -y install epel-release \
 && rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
 && yum -y install --enablerepo=remi,remi-php72 php \
php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit \
php-pecl-xdebug php-gd php-intl php-symfony php-pdo php-xml php-tokenizer php-pear php-zip

COPY entrypoint-manage.sh /usr/local/bin/entrypoint-manage.sh
RUN chmod a+x /usr/local/bin/entrypoint-manage.sh

EXPOSE 80 443
ENTRYPOINT ["/usr/local/bin/entrypoint-manage.sh"]
