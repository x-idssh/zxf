#!/bin/bash
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/demonk1992/down/main/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by Demonk</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/demonk1992/down/main/vps.conf"
/etc/init.d/nginx restart