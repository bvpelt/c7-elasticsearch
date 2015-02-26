# This is a comment
FROM dockerpinguin/c7-logstash:V3
MAINTAINER Bart van Pelt <bart.vanpelt@gmail.com>

RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch

ADD etc/yum.repos.d/elasticsearch-1.4.repo /etc/yum.repos.d/

RUN yum install -y which zeromq && \
    ln -s /usr/lib64/libzmq.so.1 /usr/lib64/libzmq.so

# elasticsearch
RUN yum install -y elasticsearch && \
    sed -i '/# cluster.name:.*/a cluster.name: logstash' /etc/elasticsearch/elasticsearch.yml


## Kibana
WORKDIR /opt/
ADD kibana-4.0.0-linux-x64.tar.gz /opt/

RUN chown -R root:root /opt/kibana-4.0.0-linux-x64
ADD etc/rc.local /etc/rc.local

RUN systemctl enable elasticsearch.service

EXPOSE 5601


