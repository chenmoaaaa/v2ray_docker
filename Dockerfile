# About v2ray of Docker
# 
# Version:1.0.1

FROM ubuntu:14.04
MAINTAINER Mai Senlin <2858876091@qq.com>

RUN apt-get -qq update && \
    apt-get install -q -y wget build-essential python-pip python-m2crypto && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
	
RUN curl -L -s https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/install-release.sh |bash
ADD config.json /etc/v2ray/config.json
ADD start.sh /usr/local/bin/start.sh

RUN chmod 755 /usr/local/bin/start.sh
EXPOSE 18888
CMD ["sh", "-c", "start.sh"]
