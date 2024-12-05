#!/bin/bash
echo "[Unit]
Description=Install dependencies (OpenCV, xdotool, Steam, scrot, python3, pip, xbindkeys) on boot
After=network.target

[Service]
Type=oneshot
ExecStart=/home/usr/FinalProjectUnix/installers.sh
RemainAfterExit=true

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/install_packages.service

sudo systemctl enable install_packages.service
sudo systemctl start install_packages.service
sudo systemctl status install_packages.service
sudo reboot
