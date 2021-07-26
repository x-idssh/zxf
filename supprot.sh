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
echo -e "========================="
echo -e "| Installing Ruby . . . |"
echo -e "-------------------------"
echo -e ""
apt-get install ruby -y
echo -e ""

# Checking Ruby Version
echo -e "==============================="
echo -e "| Checking Ruby Version . . . |"
echo -e "-------------------------------"
echo -e ""
ruby --version
echo -e ""

# Download & Install Lolcat
echo -e "==================================="
echo -e "| Download & Install Lolcat . . . |"
echo -e "-----------------------------------"
echo -e ""
wget https://github.com/x-idssh/xxx/raw/main/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
echo -e ""
echo "-----------=[ X-IDSSH ]=-----------" | lolcat
echo -e ""
# Common Password
git clone https://github.com/x-idssh/xxx
cd /root/xxx/common
mv common /etc/pam.d/
chmod +x /etc/pam.d/common-password
# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END
# Enable rc local
systemctl enable rc-local
systemctl start rc-local.service
# remove unnecessary files
apt -y autoremove
apt -y autoclean
apt -y clean
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
# install udpgw
wget https://raw.githubusercontent.com/x-idssh/zxf/main/udpgw.sh && chmod +x udpgw.sh && sed -i -e 's/\r$//' udpgw.sh && screen -S udpgw ./udpgw.sh
# Sett Port OpenSSH
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
service ssh restart
# Install Dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 222"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
# Install Fail2ban
cdLEDinstall fail2ban
apt-get -y install fail2ban
# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
# Add Banner
cat > /etc/idssh.net <<-END
<h6><font color='blue'>IDSSH.XYZ</font></h6>
END
sed -i 's@#Banner@Banner@g' /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
