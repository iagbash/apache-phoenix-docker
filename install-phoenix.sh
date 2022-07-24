#!/bin/bash

wget $BUILD_REPO/phoenix-$PHOENIX_VERSION/phoenix-hbase-$HBASE_VERSION-$PHOENIX_VERSION-bin.tar.gz

tar -xzf phoenix-hbase-$HBASE_VERSION-$PHOENIX_VERSION-bin.tar.gz
mv phoenix-hbase-$HBASE_VERSION-$PHOENIX_VERSION-bin /opt/
rm -f phoenix-hbase-$HBASE_VERSION-$PHOENIX_VERSION-bin.tar.gz
ln -s /opt/phoenix-hbase-$HBASE_VERSION-$PHOENIX_VERSION-bin /opt/phoenix

cp /opt/phoenix/phoenix-server-hbase-$HBASE_VERSION-$PHOENIX_VERSION.jar /opt/hbase/lib/
