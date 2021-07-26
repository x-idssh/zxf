apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
export DEBIAN_FRONTEND=noninteractive
apt-get install -y iptables-persistent
apt-get install nftables -y

apt-get install -y ca-certificates apt-transport-https lsb-release screen unzip wget curl git netcat tcpd build-essential zlib1g-dev libsctp-dev cmake make gcc zlib1g-dev libwrap0-dev certbot perl libperl-dev libgd3 libgd-dev libgeoip1 libgeoip-dev geoip-bin libxml2 libxml2-dev libxslt1.1 libxslt1-dev build-essential git tree libpcre3-dev socket dh-autoreconf libssh-4 libssh-dev libconfig9 lolcat mercurial
