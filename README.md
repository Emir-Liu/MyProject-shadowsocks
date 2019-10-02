# shadowsocks-makefile

Introduction:
  you can use it to get access to the true internet from China.
  And,it is a fast and easy way to establish your own VPN/VPS and connect it.
Environment: Ubuntu,Shadowsocks

How to use it :
  step 1.clone the repositery to your computer
  step 2.rent or buy a VPN/VPS
  step 3.open shell and change the working directory to the local repositery
  step 4.change the makefile file,change serverip and ssh_password to your own VPS/VPN's ip and password
  step 5.input the following commands:
  ```bash
  make server
  ```
  step 6.open a new shell and change the working directory to the local repositery
  step 7.input the following commands:
  ```bash
  sudo make local
  ```
When you use it :

  1.you shoud install related software in your host.
  (you don't need to be concerned about the software in the server,they are all included in the shell)
  
How to find where is the problem:
  1.before you do as step 5,you can use the command "make check" to check if you can connect your VPS/VPN ,
  if not you should rent or buy a new VPS/VPN.
  2.on step 5,you can see your server status,it will show you if you make it sucessfully or not.
  3.on step 7,you can see your local host's status as above.
  




if you have any problem:
  you can create a new issue or you can send email to me.
  email:egliuym@gmail.com
  
