#!/bin/bash
echo "Checking Vps"
sleep 0.5
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif
MYIP=$(curl -s http://whatismyip.akamai.com/);
domain=$(cat /var/lib/premium-script/ipvps.conf)
echo Script AutoCreate Akun SSH dan OpenVPN X-IDSSH
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank you for using our service"
echo -e "Informasi Akun SSH & OpenVPN"
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "==============================="
echo -e "IP Server      : $MYIP"
echo -e "Host           : $domain"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 222"
echo -e "SSL/TLS        : 443"
echo -e "WS-SSH         : 80"
echo -e "WS SSL-SSH     : 443"
echo -e "WS-OVPN        : 2095"
echo -e "Port Squid     : 3128, 8080 (limit to IP SSH)" 
echo -e "OpenVPN        : TCP 1194 http://$MIP:81/client-tcp-1194.ovpn"
echo -e "OpenVPN        : UDP 2200 http://$MYIP:81/client-udp-2200.ovpn"
echo -e "OpenVPN        : SSL 443 http://$MYIP:81/client-tcp-ssl.ovpn"
echo -e "badvpn         : 7300"
echo -e "==============================="
echo -e "Payload WS - SSH "
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================="
echo -e "==============================="
echo -e "Payload WS SSL - SSH "
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "SNI : $domain"
echo -e "==============================="
echo -e "Aktif Sampai   : $exp"
echo -e ""
