#!/bin/bash

echo "Aplicant fix del rellotge (dualboot)..."
sudo timedatectl set-local-rtc 1
echo "Fet! Fix del rellotge (dualboot) aplicat"

clear

echo "Habilitant la paqueteria Flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Fet! Paqueteria Flatpak habilitada."

clear

echo "Instal·lant drivers d'Nvidia..."
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
echo "Fet! Drivers d'Nvidia instal·lats."

clear

echo "Instal·lant VSCode..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c "echo -e '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo"
sudo dnf check-update -y
sudo dnf install -y code
echo "Fet! VSCode instal·lat."

clear

echo "Instal·lant neofetch i screenfetch..."
sudo dnf install -y neofetch screenfetch
echo "Fet! neofetch i screenfetch instal·lats."
neofetch

clear

echo "Instal·lant GIMP..."
sudo dnf install -y gimp
echo "Fet! GIMP instal·lat."

clear

echo "Instal·lant Google Chrome..."
sudo dnf install -y google-chrome-stable
echo "Fet! Google Chrome instal·lat."

clear

echo "Instal·lant ONLYOFFICE..."
sudo dnf install -y dejavu-sans-fonts dejavu-sans-mono-fonts liberation-narrow-fonts dejavu-serif-fonts
sudo rpm -i https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
echo "Fet! ONLYOFFICE instal·lat."

clear

echo "Instal·lant WebApp Manager..."
sudo dnf copr enable -y refi64/webapp-manager
sudo dnf install -y webapp-manager
echo "Fet! WebApp Manager instal·lat."