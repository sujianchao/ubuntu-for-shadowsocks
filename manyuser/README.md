#默认暴露端口
    EXPOSE 22 50000-50009
#配置环境变量
    ENV HOSTNAME        localhost      
	ENV USERNAME        ssuser
	ENV PASSWORD        yourDBPassword
	ENV DATABASE        shadowsocks
#开启ssh登录
	ENV AUTHORIZED_KEYS yes
#默认加密方式rc4-md5暂不支持修改
