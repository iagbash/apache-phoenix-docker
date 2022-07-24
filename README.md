Docker image for Apache Phoenix

## For running:

```
docker run -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60030:60030 -p 60020:60020 -h hbase-docker --name 2.0.2-5.1.2-phoenix -d igoragbash/apache-phoenix:2.0.2-5.1.2
```

### Also, for proper work add to /etc/host:

```
127.0.0.1  hbase-docker
```
