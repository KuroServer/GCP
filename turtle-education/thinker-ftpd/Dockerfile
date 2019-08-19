FROM centos

MAINTAINER KuroServerSystems

RUN yum install -y vsftpd

EXPOSE 20-21

COPY vsftpd.conf /etc/vsftpd/

COPY Entrypoint.sh  /usr/local/bin/
RUN  chmod 755 /usr/local/bin/Entrypoint.sh
ENTRYPOINT ["/usr/local/bin/Entrypoint.sh"]
