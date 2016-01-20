#默认加密方式rc4-md5暂不支持修改


#默认开放端口
    EXPOSE 22 50000-50009

#配置Mysql数据库变量
    ENV HOSTNAME        localhost      
	ENV USERNAME        ssuser
	ENV PASSWORD        yourDBPassword
	ENV DATABASE        shadowsocks

#root登录密码可查看docker的log输出
	========================================================================
	You can now connect to this Ubuntu container via SSH using:

	    ssh -p 		<port> root@<host>
	and enter the root password 'U0iSGVUCr7W3' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================


In this case, `U0iSGVUCr7W3` is the password allocated to the `root` user.

Done!




#为root设置固定密码
	ENV ROOT_PASS        mypass

#导入授权key登录ssh
	ENV AUTHORIZED_KEYS		`cat ~/.ssh/id_rsa.pub`