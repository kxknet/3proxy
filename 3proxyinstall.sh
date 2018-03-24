#!/bin/bash
apt-get update
apt-get install -y build-essential nano libevent-dev libssl-dev
wget --no-check-certificate http://3proxy.ru/0.8.11/3proxy-0.8.11.tgz
tar zxvf 3proxy-0.8.11.tgz
cd 3proxy
cd src
sed '/define MAXNSERVERS 5/a \#define ANONYMOUS 1' proxy.h >> maxunofresult.h
rm proxy.h
mv maxunofresult.h proxy.h
cd -
make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://github.com/MaxUNof/3proxy/raw/master/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
wget --no-check-certificate https://github.com/MaxUNof/3proxy/raw/master/.users
chmod 600 /etc/3proxy/.users
echo -e "\e[31mStart: /etc/3proxy/3proxy /etc/3proxy/3proxy.cfg \nStop: /usr/bin/killall 3proxy\nReload: /usr/bin/killall -s USR1 3proxy\nThis info saved into ~/3proxy.txt\e[0m"
echo 'Start: /etc/3proxy/3proxy /etc/3proxy/3proxy.cfg' >> ~/3proxy.txt
echo 'Stop: /usr/bin/killall 3proxy' >> ~/3proxy.txt
echo 'Reload: /usr/bin/killall -s USR1 3proxy' >> ~/3proxy.txt
echo '/etc/3proxy/3proxy /etc/3proxy/3proxy.cfg' >> ~/3proxystart.sh
chmod +x ~/3proxystart.sh
echo -e "\e[32mCreated ~/3proxystart.sh\e[0m"
echo '/usr/bin/killall 3proxy' >> ~/3proxystop.sh
chmod +x ~/3proxystop.sh
echo -e "\e[32mCreated ~/3proxystop.sh\e[0m"
echo '/usr/bin/killall -s USR1 3proxy' >> ~/3proxyreload.sh
chmod +x ~/3proxyreload.sh
echo -e "\e[32mCreated ~/3proxyreload.sh\e[0m"
echo 'nano /etc/3proxy/.users' >> ~/3proxyusers.sh
chmod +x ~/3proxyusers.sh
echo -e "\e[32mCreated ~/3proxyusers.sh\e[0m"
echo 'nano /etc/3proxy/3proxy.cfg' >> ~/3proxycfg.sh
chmod +x ~/3proxycfg.sh
echo -e "\e[32mCreated ~/3proxycfg.sh\e[0m"
