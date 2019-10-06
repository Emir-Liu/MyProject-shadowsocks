SHELL=/bin/bash

serverip	= 95.179.146.13
ssh_username	= root
ssh_password	= qA2.p*Aw}94{Zfed
server_port	= 5024
local_address	= 127.0.0.1
local_port	= 1080
password	= lymlovezjj
method		= aes-256-cfb
timeout		= 300
fast_open	= true
serveraccount	= root

.PHONY:check server local
	

check :
	#检测是否能够连接到服务器
	ping $(serverip)

server:	connectscp connectssh
	#一键配置,启动服务器端

local:	startlocal
	#一键启动客户端

connectscp:	
	#将配置服务器的脚本通过scp发送到服务器上
	./connectscp.sh $(ssh_username) $(serverip) $(ssh_password)

connectssh:	
	#通过ssh连接服务器运行配置服务器的脚本,停留在远程连接界面，以便于观察
	./connectssh.sh $(ssh_username) $(serverip) $(ssh_password)

connect:
	ssh $(serveraccount)@$(serverip)

startserver:	buildserver createserverconfig
	#启动服务器端shadowsocks
	ssserver -c shadowsocks.json -d stop
	ssserver -c shadowsocks.json -d start

startlocal:	createlocalconfig
	#启动客户端shadowsocks
	sslocal -c shadowsocks.json -d stop
	sslocal -c shadowsocks.json -d start

buildserver:	
	#在服务器端，更新apt，下载shadowsocks
	apt-get --yes --force-yes update
	apt --yes --force-yes install shadowsocks

createserverconfig:
	#创建服务器端shadowsocks的配置文件
	echo '{'	> test-server
	echo '	"server":"0.0.0.0",' >> test-server
	echo '	"server_port":$(server_port),' >> test-server
	echo '	"password":"$(password)",' >> test-server
	echo '	"method":"$(method)"' >> test-server
	echo '}' >> test-server
createlocalconfig:
	#创建客户端shadowsocks的配置文件
	echo '{' > test-local
	echo '"server": "$(serverip)",' >> test-local
	echo '"server_port": $(server_port),' >> test-local
	echo '"local_address": "$(local_address)",' >> test-local
	echo '"local_port": "$(local_port)",' >> test-local
	echo '"password": "$(password)",' >> test-local
	echo '"method": "$(method)",' >> test-local
	echo '"timeout": $(timeout),' >> test-local
	echo '"fast_open": $(fast_open)' >> test-local
	echo '}' >> test-local
