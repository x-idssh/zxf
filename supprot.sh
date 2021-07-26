apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
export DEBIAN_FRONTEND=noninteractive
apt-get install -y iptables-persistent
apt-get install nftables -y
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

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END
apt-get install -y ca-certificates apt-transport-https lsb-release screen unzip wget curl git netcat tcpd build-essential zlib1g-dev libsctp-dev cmake make gcc zlib1g-dev libwrap0-dev certbot perl libperl-dev libgd3 libgd-dev libgeoip1 libgeoip-dev geoip-bin libxml2 libxml2-dev libxslt1.1 libxslt1-dev build-essential git tree libpcre3-dev socket dh-autoreconf libssh-4 libssh-dev libconfig9 lolcat mercurial
# Enable rc local
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
vv
