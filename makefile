

serverip	= 95.179.129.245
ssh_username	= root
ssh_password	= 7_Jr7s7k\)m[,Tj54
server_port	= 5024
local_address	= 127.0.0.1
local_port	= 1080
password	= lymlovezjj
method		= aes-256-cfb
timeout		= 300
fast_open	= true
serveraccount	= root

file_name	=tmpdf

check :
	ping $(serverip)

connecttest:
	./test.sh $(ssh_username) $(serverip) $(ssh_password)
connect:
	ssh $(serveraccount)@$(serverip)

startserver:	buildserver createserverconfig
	ssserver -c shadowsocks.json -d start

startlocal:	createlocalconfig
	sslocal -c shadowsocks.json -d start

buildserver:	
	apt-get update
	apt install shadowsocks

createserverconfig:
	echo "{\n\"server\":\"0.0.0.0\",\n\"server_port\":$(server_port),\n\"password\":\"$(password)\",\n\"method\":\"$(method)\"\n}" > shadowsocks.json

createlocalconfig:
	echo "{\n\"server\": \"$(serverip)\",\n\"server_port\": $(server_port),\n\"local_address\": \"$(local_address)\",\n\"local_port\": \"$(local_port)\",\n\"password\": \"$(password)\",\n\"method\": \"$(method)\",\n\"timeout\": $(timeout),\n\"fast_open\": $(fast_open)\n}" > shadowsocks.json

