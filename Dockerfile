# About shadowsocks of Docker
# 
# Version:1.0

FROM ubuntu:14.04
MAINTAINER Su Jianchao <sujianchao@gmail.com>

ENV REFRESHED_AT 2015-12-03

RUN apt-get -qq update && \
    apt-get install -q -y wget build-essential python-pip python-m2crypto && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install shadowsocks

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 20000
ENV SS_PASSWORD sujianchao
#ENV SS_METHOD chacha20
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

#add chacha20
RUN wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz && \
    tar zxf LATEST.tar.gz && \
    cd libsodium* && \
    ./configure && make -j2 && make install && \
    ldconfig

ADD shadowsocks.json /etc/
ADD start.sh /usr/local/bin/start.sh
RUN chmod 755 /usr/local/bin/start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "start.sh"]
#ENTRYPOINT ["/usr/local/bin/ssserver"]
