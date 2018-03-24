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
echo 'Start: /etc/3proxy/3proxy /etc/3proxy/3proxy.cfg \nStop: /usr/bin/killall 3proxy\n Reload: /usr/bin/killall -s USR1 3proxy'
