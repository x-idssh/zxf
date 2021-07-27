#!/bin/bash
# Permission badvpn
chmod +x /usr/local/bin/badvpn-udpgw
# Create udpgw.service
cat > /etc/systemd/system/udpgw.service << "EOF"
[Unit]
Description=UDP forwarding for badvpn-tun2socks [IDSSH]
After=nss-lookup.target

[Service]
ExecStart=/usr/local/bin/badvpn-udpgw --loglevel none --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 1000
User=udpgw

[Install]
WantedBy=multi-user.target
EOF

chmod +x /etc/systemd/system/udpgw.service
# Enable & Start udpgw.service
sudo useradd -m udpgw
sudo systemctl daemon-reload
sudo systemctl enable udpgw
sudo systemctl start udpgw