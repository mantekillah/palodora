#!/bin/bash

#Aplicant tweaks d'optimització
echo "Aplicant tweaks d'optimització..."
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf
echo "keepcache=True" | sudo tee -a /etc/dnf/dnf.conf
echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf
echo "Tweaks d'optimització aplicats correctament."
clear
#Actualitzant el sistema
echo "Actualitzant el sistema..."
sudo dnf -y update && sudo dnf -y upgrade --refresh
echo "Sistema actualitzat correctament."
clear
#Establint el nom de la màquina
echo "Establint el nom de la màquina..."
sudo hostnamectl set-hostname linux
echo "El nom de la màquina s'ha establert correctament."
clear
#Activant repositoris d'RPM Fusion (free i nonfree)
echo "Activant repositoris d'RPM Fusion (free i nonfree)..."
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core
sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf -y groupupdate sound-and-video
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y libdvdcss
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y \*-firmware
echo "Repositoris d'RPM Fusion (free i nonfree) activats correctament."
clear
#Instal·lant "Tilix"
echo "Instal·lant Tilix..."
sudo dnf install -y tilix*
echo "Tilix instal·lat correctament."
clear
#Reiniciant el sistema
echo "Actualitzant i reiniciant..."
sudo dnf -y update && sudo dnf -y upgrade --refresh
echo "Sistema actualitzat correctament. Reiniciant..."
sudo reboot now
