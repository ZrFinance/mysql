
FROM tangchen2018/mysql:5.6.0-centos7

COPY ./load.sh /tmp/load.sh
COPY ./*.sql /tmp/

WORKDIR /tmp/
RUN chmod 755 /tmp/load.sh && /tmp/load.sh && rm -rf /tmp/load.sh /tmp/*.sql

