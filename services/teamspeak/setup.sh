apt-get update && apt-get upgrade -y

sudo adduser teamspeak --system --home /usr/local/bin/teamspeak3-server_linux_amd64/ --disabled-login

cd /tmp 

wget -4 --no-cache  https://files.teamspeak-services.com/releases/server/3.12.1/teamspeak3-server_linux_amd64-3.12.1.tar.bz2

cd /usr/local/bin

sudo tar -xjf /tmp/teamspeak3-server_linux_amd64-3.12.1.tar.bz2

sudo chown root:root -R teamspeak3-server_linux_amd64
sudo chown teamspeak:nogroup teamspeak3-server_linux_amd64
sudo chmod go-w -R teamspeak3-server_linux_amd64

cd /usr/local/bin/teamspeak3-server_linux_amd64/

touch .ts3server_license_accepted 

touch query_ip_blacklist.txt 


sudo su teamspeak -s /bin/sh 

./ts3server createinifile=1 > /usr/local/bin/teamspeak3-server_linux_amd64/adminlogin

exit

rm /tmp/teamspeak3-server_linux_amd64-3.12.1.tar.bz2

sudo su teamspeak -c "/usr/local/bin/teamspeak3-server_linux_amd64/ts3server_startscript.sh start inifile=ts3server.ini license_accepted=1" -s /bin/sh

/usr/local/bin/teamspeak3-server_linux_amd64/ts3server_startscript.sh status
