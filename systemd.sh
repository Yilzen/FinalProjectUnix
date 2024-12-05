#!/bin/bash
echo "[Unit]
Description=Install dependencies (OpenCV, xdotool, Steam, scrot) on boot
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/installers.sh
RemainAfterExit=true

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/install_packages.service

sudo systemctl enable install_packages.service
sudo systemctl start install_packages.service
sudo systemctl status install_packages.service
sudo reboot
