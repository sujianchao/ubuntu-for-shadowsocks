# About shadowsocks of Docker
# 
# Version:1.0

FROM ubuntu:14.04
MAINTAINER Su Jianchao <sujianchao@gmail.com>

ENV REFRESHED_AT 2016-01-19


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server pwgen
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

RUN apt-get install -q -y git wget build-essential python-pip python-m2crypto && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install shadowsocks && pip install cymysql

#增加chacha20加密方式
RUN wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz && \
    tar zxf LATEST.tar.gz && \
    cd libsodium* && \
    ./configure && make -j2 && make install && \
    ldconfig

ENV AUTHORIZED_KEYS **None**

#shadowsocks参数配置
ENV HOSTNAME        localhost      
ENV USERNAME        ssuser
ENV PASSWORD        yourDBPassword
ENV DATABASE        shadowsocks
ENV SS_SERVER_PORT  50000-50009
#部署shadowsocks多用户版
RUN git clone -b manyuser https://github.com/sujianchao/shadowsocks.git /app

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 22 $SS_SERVER_PORT

CMD ["/run.sh"]
