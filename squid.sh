#!/bin/bash
MYIP=$(wget -qO- icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
apt-get -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/x-idssh/zxf/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf
service squid restart
