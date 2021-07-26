#!/bin/bash
# Script by : X-IDSSH
clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "    AutoScriptVPS by  X-IDSSH      "
echo -e ""
echo -e "    [1] Restart All Services"
echo -e "    [2] Restart OpenSSH"
echo -e "    [3] Restart Dropbear"
echo -e "    [4] Restart Stunnel4"
echo -e "    [5] Restart OpenVPN"
echo -e "    [6] Restart Squid"
echo -e "    [7] Restart Nginx"
echo -e "    [8] Restart Badvpn"
echo -e "    [x] Exit"
echo -e ""
read -p "    Select From Options [1-8 or x] :  " Restart
echo -e ""
echo -e "======================================"
sleep 1
clear
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/webmin restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       AutoScriptVPS by X-IDSSH    "
                echo -e ""
                echo -e "          Service/s Restarted         "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       AutoScriptVPS by X-IDSSH   "
                echo -e ""
                echo -e "         SSH Service Restarted        "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       AutoScriptVPS by X-IDSSG    "
                echo -e ""
                echo -e "       Dropbear Service Restarted     "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                4)
                clear
                service stunnel restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "        AutoScriptVPS by X-IDSSH   "
                echo -e ""
                echo -e "        Stunnel Service Restarted    "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       AutoScriptVPS by X-IDSSH    "
                echo -e ""
                echo -e "       OpenVPN Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       AutoScriptVPS by X-IDSSH    "
                echo -e ""
                echo -e "        Squid3 Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "        AutoScriptVPS by X-IDSSH   "
                echo -e ""
                echo -e "         Nginx Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                8)
                service udpgw restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "       AutoScriptVPS by X-IDSSH    "
                echo -e ""
                echo -e "    Badvpn  Badvpn Service Restarted  "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac