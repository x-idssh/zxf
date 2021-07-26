#!/bin/bash
#VPS Script By   : X-IDSSH
#Contact Me FB   : X-IDSSH

# Check Root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi

# Check System
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi

# Colours
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

# Requirement
apt update -y
apt upgrade -y
update-grub
# Install Repository
wget https://raw.githubusercontent.com/x-idssh/zxf/main/supprot.sh && chmod +x supprot.sh && sed -i -e 's/\r$//' supprot.sh && screen -S supprot ./supprot.sh
# Script Access 
MYIP=$(wget -qO- icanhazip.com);
echo -e "${green}CHECKING SCRIPT ACCESS${NC}"
IZIN=$( curl https://raw.githubusercontent.com/x-idssh/xxx/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}ACCESS GRANTED...${NC}"
else
echo -e "${green}ACCESS DENIED...${NC}"
exit 1
fi

# Subdomain Settings
mkdir /var/lib/premium-script;
echo -e "${green}ENTER THE VPS SUBDOMAIN/HOSTNAME, IF NOT AVAILABLE, PLEASE CLICK ENTER${NC}"
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /root/domain
echo -e ""
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

# Confirm to Install Script
read -p "Do you want to install this script ? [Y/n] " Answer
echo -e ""
if [[ $Answer =~ ^([yY])$ ]]
        then
		
# Get the "public" interface from the default route
NIC=$(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1)
  # initializing var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
# Openssl Upgrade
wget https://raw.githubusercontent.com/demonk1992/x/main/openssl.sh && chmod +x openssl.sh && sed -i -e 's/\r$//' openssl.sh && screen -S openssl ./openssl.sh
# Install OpenVPN
wget https://raw.githubusercontent.com/x-idssh/zxf/main/vpn.sh && chmod +x vpn.sh && sed -i -e 's/\r$//' vpn.sh && screen -S vpn ./vpn.sh
# Detail Company Profile
country=ID
state=Jawa-Barat
locality=Subabg
organization=X-IDSSH
organizationalunit=IDSSH.XYZ
commonname=IDSSH
email=x-idssh@gmail.com
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
# Install Web Server
wget https://raw.githubusercontent.com/x-idssh/zxf/main/nginx.sh && chmod +x nginx.sh && sed -i -e 's/\r$//' nginx.sh && screen -S nginx ./nginx.sh
# install udpgw
wget https://raw.githubusercontent.com/x-idssh/zxf/main/udpgw.sh && chmod +x udpgw.sh && sed -i -e 's/\r$//' udpgw.sh && screen -S udpgw ./udpgw.sh
# Sett Port OpenSSH
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 843' /etc/ssh/sshd_config
service ssh restart
# Install Dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 222"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
# Install Squid Proxy
wget https://raw.githubusercontent.com/x-idssh/zxf/main/squid.sh && chmod +x squid.sh && sed -i -e 's/\r$//' squid.sh && screen -S squid ./squid.sh
# Setting Vnstat
wget https://raw.githubusercontent.com/x-idssh/zxf/main/vnstat.sh && chmod +x vnstat.sh && sed -i -e 's/\r$//' vnstat.sh && screen -S vnstat ./vnstat.sh
# Install Webmin
wget https://raw.githubusercontent.com/x-idssh/zxf/main/webmin.sh && chmod +x webmin.sh && sed -i -e 's/\r$//' webmin.sh && screen -S webmin ./webmin.sh
# SSLH
wget https://raw.githubusercontent.com/demonk1992/x/main/sslh.sh && chmod +x sslh.sh && sed -i -e 's/\r$//' sslh.sh && screen -S sslh ./sslh.sh
# Install Stunnel
wget https://raw.githubusercontent.com/demonk1992/x/main/stunnel.sh && chmod +x stunnel.sh && sed -i -e 's/\r$//' stunnel.sh && screen -S stunnel ./stunnel.sh
# ssh-websocket
wget https://raw.githubusercontent.com/demonk1992/down/main/websocket.sh && chmod +x websocket.sh && sed -i -e 's/\r$//' websocket.sh && screen -S websocket ./websocket.sh
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
sed -i 's@#Banner@Banner@g' /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
# Install Menu
cd /usr/bin 
wget -O add-host "https://raw.githubusercontent.com/demonk1992/down/main/add-host.sh"
wget -O addhost "https://raw.githubusercontent.com/demonk1992/down/main/addhost.sh"
wget -O mem-tr "https://raw.githubusercontent.com/demonk1992/down/main/mem-tr.sh"
wget -O about "https://raw.githubusercontent.com/demonk1992/down/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/demonk1992/down/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/demonk1992/down/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/demonk1992/down/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/demonk1992/down/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/demonk1992/down/main/member.sh"
wget -o webmin "https://raw.githubusercontent.com/demonk1992/down/main/webmin"
wget -O delete "https://raw.githubusercontent.com/demonk1992/down/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/demonk1992/down/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/demonk1992/down/main/restart.sh"
wget -O speedtest "https://github.com/Aantonberkentod/AutoScriptSSH/raw/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/demonk1992/down/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/demonk1992/down/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/demonk1992/down/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/demonk1992/down/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/demonk1992/down/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/demonk1992/down/main/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/demonk1992/down/main/clear-log.sh"

echo "0 5 * * * root clear-log && reboot" >> /etc/crontab

chmod +x add-host
chmod +x addhost
chmod +x mem-tr
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x webmin
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
# finishing
cd
systemctl restart nginx
service openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/sshd restart
service dropbear restart
/etc/init.d/fail2ban restart
service webmin restart
service stunnel restart
service squid restart

echo "clear" >> .profile
echo 'echo -e ""' >> .profile
echo 'echo -e ""' >> .profile
echo -e "######################|  X-IDSSH  |#######################" | lolcat' >> .profile
echo 'echo -e ""' >> .profile
echo 'echo -e "Whats New On V.1.3 ?" | lolcat' >> .profile
echo 'echo -e ""' >> .profile
echo 'echo -e "* Fixed Bug On Squid Proxy" | lolcat' >> .profile
echo 'echo -e "* Fixed Bug On OpenVPN" | lolcat' >> .profile
echo 'echo -e "* Fixed Bug On Check Port" | lolcat' >> .profile
echo 'echo -e "* Add New Fitur : contact, statport & update" | lolcat' >> .profile
echo 'echo -e "* Update README.md on Github Repo With Minimalist" | lolcat' >> .profile
echo 'echo -e "* Added Lolcat" | lolcat' >> .profile
echo 'echo -e "* Added Confirm Before Create Account" | lolcat' >> .profile
echo 'echo -e "* Added Config OpenVPN Instagram" | lolcat' >> .profile
echo 'echo -e ""' >> .profile
echo 'echo -e "For reporting bug or issues chat me on Telegram : t.me//anakjati567" | lolcat' >> .profile
echo 'echo -e ""' >> .profile

rm /root/deb10.sh
port
success
restart ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# Confirm Install Script
else
                echo -e ""
fi
