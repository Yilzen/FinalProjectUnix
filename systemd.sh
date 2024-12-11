#!/bin/bash
echo "[Unit]
Description=Install dependencies (OpenCV, xdotool, Steam, scrot, python3, pip, xbindkeys) on boot
After=network.target

[Service]
Type=oneshot
<<<<<<< HEAD
ExecStart=/usr/local/bin/FinalProjectUnix/installers.sh
=======
ExecStart=/home/usr/FinalProjectUnix/installers.sh
>>>>>>> 0ae5c1fe74a0528e483d3d1db84b10c43d42f7e7
RemainAfterExit=true

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/install_packages.service

sudo systemctl enable install_packages.service
<<<<<<< HEAD
sydo systemctl start install_packages.service
=======
sudo systemctl start install_packages.service
>>>>>>> 0ae5c1fe74a0528e483d3d1db84b10c43d42f7e7
sudo systemctl status install_packages.service
sudo reboot
