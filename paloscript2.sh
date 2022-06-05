#!/bin/bash

#Aplicant fix del rellotge
echo "Aplicant fix del rellotge..."
sudo timedatectl set-local-rtc 1
echo "Fix del rellotge aplicat correctament."
clear
#Habilitant paqueteria Flatpak
echo "Habilitant paqueteria Flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak override --filesystem=~/.themes
echo "Paqueteria Flatpak habilitada correctament."
clear
#Preparant la instal·lació automàtica de múltiples programes i/o aplicacions
echo "Preparant la instal·lació automàtica de múltiples programes i/o aplicacions..."
sudo dnf copr enable -y refi64/webapp-manager
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/36/winehq.repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c "echo -e '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo"
sudo sh -c "echo -e '[teams]\nname=Microsoft Teams\nbaseurl=https://packages.microsoft.com/yumrepos/ms-teams\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/teams.repo"
sudo rpm --import https://rpm.opera.com/rpmrepo.key
sudo tee /etc/yum.repos.d/opera.repo <<RPMREPO
[opera]
name=Opera packages
type=rpm-md
baseurl=https://rpm.opera.com/rpm
gpgcheck=1
gpgkey=https://rpm.opera.com/rpmrepo.key
enabled=1
RPMREPO
git clone https://github.com/luisrguerra/wow64-icon-theme.git
cd wow64-icon-theme
sudo sh ./install.sh
cd
rm -rf wow64-icon-theme
git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
cd Colloid-gtk-theme
sudo sh ./install.sh --theme all --tweaks dracula rimless
cd
rm -rf Colloid-gtk-theme
sudo dnf check-update -y
echo "La instal·lació automàtica de múltiples programes i/o aplicacions està llesta."
clear
#Instal·lació automàtica de múltiples programes i/o aplicacions
echo "Instal·lació automàtica de múltiples programes i/o aplicacions..."
sudo dnf install -y libfreeaptx pipewire-codec-aptx code teams opera-stable neofetch screenfetch akmod-nvidia xorg-x11-drv-nvidia-cuda gimp google-chrome-stable dejavu-sans-fonts dejavu-sans-mono-fonts gnome-shell-extension-pop-shell liberation-narrow-fonts breeze-cursor-theme gtkhash-nautilus 'mozilla-fira-*' nautilus-image-converter nautilus-search-tool dejavu-serif-fonts webapp-manager megasync nautilus-megasync bpytop xclip filezilla gnome-chess fontawesome-fonts gnome-shell-extension-dash-to-dock gnome-themes-extra gtk-murrine-engine sassc gnome-shell-extension-netspeed micro papirus-icon-theme peek discord gnome-shell-extension-user-theme alien bleachbit torbrowser-launcher gparted vlc p7zip* gnome-tweaks aisleriot gnome-extensions-app chrome-gnome-shell lame gpart ffmpeg tree drawing telegram-desktop android-tools gnome-sound-recorder xournalpp* video-downloader dconf-editor kdenlive ffmpegthumbs htop qbittorrent curl git handbrake-gui tilix* obs-studio discord gstreamer-plugins* gstreamer1-plugins* pip google-chrome-stable kernel-headers kernel-devel gcc glibc-headers make dkms file-roller file-roller-nautilus vokoscreenNG cpu-x libretro-mgba variety xarchiver gnome-power-manager cabextract xorg-x11-font-utils fontconfig musescore pdfarranger youtube-dl xorg-x11-drv-amdgpu grub-customizer vim steam git mesa-libGLU.i686 timeshift htop lutris winehq-devel --allowerasing
sudo rpm -i https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
sudo rpm -i https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo rpm -i https://github.com/shiftkey/desktop/releases/download/release-3.0.0-linux2/GitHubDesktop-linux-3.0.0-linux2.rpm
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.github.muriloventuroso.pdftricks
flatpak install -y flathub io.gitlab.librewolf-community
flatpak install -y flathub com.github.robertsanseries.ciano
flatpak install -y flathub net.cozic.joplin_desktop
flatpak install -y flathub io.github.Soundux
flatpak install -y flathub com.mattjakeman.ExtensionManager
flatpak install -y flathub com.rafaelmardojai.Blanket
echo "Instal·lació automàtica realitzada correctament."
clear
#Desinstal·lació automàtica de múltiples programes i/o aplicacions
echo "Desinstal·lació automàtica de múltiples programes i/o aplicacions..."
sudo dnf remove -y gnome-tour gnome-contacts gnome-terminal libreoffice* rhythmbox* yelp fedora-chromium-config mediawriter gnome-maps gnome-weather gnome-photos totem
echo "Desinstal·lació automàtica realitzada correctament."
clear
#Settejant cosetes
echo "Ajustant paràmetres del sistema..."
gsettings set com.gexperts.Tilix.Settings theme-variant 'dark'
gsettings set org.gnome.desktop.interface icon-theme 'wow64'
gsettings set org.gnome.desktop.interface gtk-theme 'Colloid-Green-Dark-Dracula'
gsettings set org.gnome.shell.extensions.user-theme name 'Colloid-Green-Dark-Dracula'
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Semi-Bold 11'
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'adaptive'
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
echo "Fet!"
clear
#Actualitzant el equip i netejant la brossa
echo "Actualitzant el equip i netejant la brossa..."
flatpak update -y
flatpak uninstall -y --unused --delete-data
sudo dnf update -y --refresh
fc-cache -v
sudo dnf autoremove -y
sudo dnf clean all
echo "Fet!"
clear
#Reiniciant el sistema
echo "Actualitzant i reiniciant..."
sudo dnf -y update && sudo dnf -y upgrade --refresh
echo "Sistema actualitzat correctament. Reiniciant..."
sudo reboot now
