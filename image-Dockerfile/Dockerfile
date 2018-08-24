FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y sysbench net-tools  nload
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
CMD ["/bin/bash","-c","/docker-entrypoint.sh"]
