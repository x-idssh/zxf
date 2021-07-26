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
echo "$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /root/domain
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
# Install Web Server
wget https://raw.githubusercontent.com/x-idssh/zxf/main/nginx.sh && chmod +x nginx.sh && sed -i -e 's/\r$//' nginx.sh && screen -S nginx ./nginx.sh
# Openssl Upgrade
wget https://raw.githubusercontent.com/demonk1992/x/main/openssl.sh && chmod +x openssl.sh && sed -i -e 's/\r$//' openssl.sh && screen -S openssl ./openssl.sh
# Install OpenVPN
wget https://raw.githubusercontent.com/x-idssh/zxf/main/vpn.sh && chmod +x vpn.sh && sed -i -e 's/\r$//' vpn.sh && screen -S vpn ./vpn.sh
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
# Install Menu
cd /usr/bin 
wget -O mem-tr "https://raw.githubusercontent.com/x-idssh/zxf/main/mem-tr.sh"
wget -O about "https://raw.githubusercontent.com/x-idssh/zxf/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/x-idssh/zxf/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/x-idssh/zxf/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/x-idssh/zxf/main/trial.sh"
wget -O deluser "https://raw.githubusercontent.com/x-idssh/zxf/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/x-idssh/zxf/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/x-idssh/zxf/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/x-idssh/zxf/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/x-idssh/zxf/main/restart.sh"
wget -O speedtest "https://github.com/Aantonberkentod/AutoScriptSSH/raw/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/x-idssh/zxf/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/demonk1992/down/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/x-idssh/zxf/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/x-idssh/zxf/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/x-idssh/zxf/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/demonk1992/down/main/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/demonk1992/down/main/clear-log.sh"

echo "0 5 * * * root clear-log && reboot" >> /etc/crontab

chmod +x mem-tr
sed -i -e 's/\r$//' mem-tr
chmod +x menu
sed -i -e 's/\r$//' menu
chmod +x usernew
sed -i -e 's/\r$//' usernew
chmod +x trial
sed -i -e 's/\r$//' trial
chmod +x deluser
sed -i -e 's/\r$//' deluser
chmod +x member
sed -i -e 's/\r$//' member
chmod +x delete
sed -i -e 's/\r$//' delete
chmod +x cek
sed -i -e 's/\r$//' cek
chmod +x restart
sed -i -e 's/\r$//' restart
chmod +x speedtest
sed -i -e 's/\r$//' speedtest
chmod +x info
sed -i -e 's/\r$//' info
chmod +x about
sed -i -e 's/\r$//' about
chmod +x autokill
sed -i -e 's/\r$//' autokill
chmod +x tendang
sed -i -e 's/\r$//' tendang
chmod +x ceklim
sed -i -e 's/\r$//' ceklim
chmod +x ram
sed -i -e 's/\r$//' ram
chmod +x renew
sed -i -e 's/\r$//' renew
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

rm /root/deb10.sh
fi