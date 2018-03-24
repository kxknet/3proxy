apt-get update
apt-get install -y build-essential nano libevent-dev libssl-dev
wget --no-check-certificate hhttp://3proxy.ru/0.8.11/3proxy-0.8.11.tgz
tar xzf 3proxy-0.8.11.tar.gz
cd 3proxy-0.8.11
cd src
nano proxy.h
cd -
make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://github.com/MaxUNof/3proxy/raw/master/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
wget --no-check-certificate https://github.com/MaxUNof/3proxy/raw/master/.users
chmod 600 /etc/3proxy/.proxyauth
cd /etc/init.d/
wget --no-check-certificate https://raw.github.com/MaxUNof/3proxy/master/3proxyinit
chmod  +x /etc/init.d/3proxyinit
update-rc.d 3proxyinit defaults
