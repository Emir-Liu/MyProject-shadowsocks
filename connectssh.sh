#! /usr/bin/expect -f
set username		[lindex $argv 0]
set serverip		[lindex $argv 1]
set ssh_password	[lindex $argv 2]
spawn ssh $username@$serverip
expect	"*no)?"		{ send "yes\r"}
expect	"password: " 	{ send "$ssh_password\r"}
expect 	"~# "		{ send "apt --yes --force-yes install make\r"}
expect 	"# "		{ send "make startserver\r"}
interact

