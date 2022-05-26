#!/bin/bash

echo "Aplicant tweaks d'optimització..."
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf
echo "keepcache=True" | sudo tee -a /etc/dnf/dnf.conf
echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf
echo "Fet! Tweaks d'optimització aplicats."

clear

echo "Actualitzant el sistema..."
sudo dnf update -y --refresh
sudo dnf upgrade -y
echo "Fet! Sistema actualitzat."

clear

echo "Establint el nom de la màquina..."
sudo hostnamectl set-hostname linux
echo "Fet! Nom de la màquina establert."

clear

echo "Activant els repos d'RPM Fusion..."
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core
sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf -y groupupdate sound-and-video
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y libdvdcss
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y \*-firmware
echo "Fet! Repos d'RPM Fusion activats."

clear

echo "Instal·lant alguns còdecs..."
sudo dnf mark -y install libfreeaptx pipewire-codec-aptx
echo "Fet! Alguns còdecs instal·lats."

clear

echo "Reiniciant..."
sudo reboot now
