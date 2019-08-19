FROM centos

MAINTAINER KuroServerSystems

RUN yum install -y vsftpd

EXPOSE 21
EXPOSE 60000-60100

COPY vsftpd.conf /etc/vsftpd/

COPY Entrypoint.sh  /usr/local/bin/
RUN  chmod 755 /usr/local/bin/Entrypoint.sh
ENTRYPOINT ["/usr/local/bin/Entrypoint.sh"]
