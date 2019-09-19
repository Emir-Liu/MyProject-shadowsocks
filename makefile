

serverip	= 95.179.220.102
ssh_password	= 9k}T=2V()G++q_eH
server_port	= 5024
local_address	= 127.0.0.1
local_port	= 1080
password	= lymlovezjj
method		= aes-256-cfb
timeout		= 300
fast_open	= true
serveraccount	= root

check :
	ping $(serverip)

connecttest:
	spawn ssh user@$(serverip)
	expect{"password"{set timeout 300;sen\"$(ssh_password)\r\"}}
connect:
	ssh $(serveraccount)@$(serverip)

startserver:	buildserver createserverconfig
	ssserver -c shadowsocks/json -d start
buildserver:	
	apt-get update
	apt install shadowsocks

createserverconfig:
	echo "{\n\"server\":\"0.0.0.0\",\n\"server_port\":$(server_port),\n\"password\":\"$(password)\",\n\"method\":\"$(method)\"\n}" > test2 

createlocalconfig:
	echo "{\n\"server\": \"$(serverip)\",\n\"server_port\": $(server_port),\n\"local_address\": \"$(local_address)\",\n\"local_port\": \"$(local_port)\",\n\"password\": \"$(password)\",\n\"method\": \"$(method)\",\n\"timeout\": $(timeout),\n\"fast_open\": $(fast_open)\n}" > test1

