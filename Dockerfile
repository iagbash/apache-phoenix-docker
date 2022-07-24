FROM openjdk:8

# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030
# Phoenix thin client
EXPOSE 8765


RUN mkdir /hbase-setup
WORKDIR /hbase-setup

ENV HBASE_VERSION 2.0.2
ADD ./install-hbase.sh /hbase-setup/
RUN ./install-hbase.sh

RUN /opt/hbase/bin/hbase-config.sh

ADD ./hbase-site.xml /opt/hbase/conf/hbase-site.xml

ADD ./replace-hostname /opt/replace-hostname

ADD start-pseudo-distributed.sh /opt/hbase/bin/start-pseudo-distributed.sh

WORKDIR /opt/hbase/bin

ENV PATH=$PATH:/opt/hbase/bin

RUN apt-get update

RUN apt-get install -y python2

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
RUN python2 get-pip.py

RUN pip install supervisor && pip install supervisor-stdout
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV BUILD_REPO=http://archive.apache.org/dist/phoenix
# ENV BUILD_REPO=https://dist.apache.org/repos/dist/dev/phoenix
ENV PHOENIX_VERSION=5.1.2
ENV BUILD_QUALIFIER=''
ENV HBASE_VERSION=2.1

RUN mkdir /phoenix-setup
WORKDIR /phoenix-setup

ADD install-phoenix.sh /phoenix-setup/install-phoenix.sh
RUN ./install-phoenix.sh

CMD ["supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]