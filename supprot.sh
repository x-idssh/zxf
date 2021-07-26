#!/bin/bash
apt install -y bzip2 gzip iptables-persistent crontab coreutils curl unzip netcat tcpd libsctp-dev cmake make gcc zlib1g-dev libwrap0-dev certbot perl libperl-dev libgd3 libgd-dev libgeoip1 libgeoip-dev geoip-bin libxml2 libxml2-dev libxslt1.1 libxslt1-dev build-essential git tree libpcre3-dev socket dh-autoreconf libssh-4 libssh-dev libconfig9 lolcat mercurial screen chron
apt-get install nftables -y
# Create and Configure rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
exit 0
END
# Disable check Certificate
echo "check_certificate = off" >> ~/.wgetrc
# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sysctl -p
# Iptables Nat
sudo nft add table nat
sudo nft 'add chain nat postrouting { type nat hook postrouting priority 100 ; }'
sudo nft 'add chain nat prerouting { type nat hook prerouting priority -100; }'
sudo nft add rule nat postrouting masquerade
