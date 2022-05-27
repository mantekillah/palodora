<p align="center"><a href="https://github.com/mantekillah/palodora" target="_blank"><img src="./palodora-logo.png" height="66" /></a></p>

[![MIT License][license-shield]][license-url]

<p align="center">Instruccions i/o scripts de post-instal·lació per a Fedora Workstation 36.</p>

<details>
  <summary><b>🚧 Explicació en detall</b> (per fer-ho manualment)</summary>
  
---
  
1) [**Primera part de la post-instal·lació:**](#part-i-palodora-1sh)
- [Aplicar tweaks d'optimització](#aplicant-tweaks-doptimització)
- [Actualitzar el sistema](#actualitzant-el-sistema)
- [Establir el nom de la màquina](#establint-el-nom-de-la-màquina) (pots posar el nom que vulguis a la teva màquina)
- [Activant repos d'RPM Fusion (*free* i *nonfree*)](#activant-repos-drpm-fusion-free-i-nonfree) (pots editar les ordres si, per exemple, només vols activar els *free*)
- [Instal·lar *Tilix*](#installant-tilix)
- [Reiniciar el sistema](#reiniciant-el-sistema)
2) [**Segona part de la post-instal·lació:**](#part-ii-palodora-2sh)
- [Aplicant fix del rellotge](#aplicant-fix-del-rellotge) (només per usuaris amb *dual boot* de Windows + Fedora)
- [Habilitar la paqueteria *Flatpak*](#habilitant-la-paqueteria-flatpak)
- [Instal·lació automàtica de múltiples programes i/o aplicacions](#installació-automàtica-de-múltiples-programes-io-aplicacions)
- [Desinstal·lació automàtica de múltiples programes i/o aplicacions](#desinstallació-automàtica-de-múltiples-programes-io-aplicacions)
- [Actualitzar el equip i netejar brossa](#actualitzant-el-equip-i-netejant-la-brossa)
- [Reiniciar el sistema](#reiniciant-el-sistema-1)

---

# Part I (**`palodora-1.sh`**)
  
<div align="center">
  
Obrir la Terminal i anar copiant i enganxant les ordres.
  
## Aplicant tweaks d'optimització:

**`echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "keepcache=True" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf`**

## Actualitzant el sistema:

**`sudo dnf update -y --refresh`**

**`sudo dnf upgrade -y`**

## Establint el nom de la màquina:

En aquest cas, l'anomenaré "**linux**"
  
**`sudo hostnamectl set-hostname linux`**

## Activant repos d'RPM Fusion (*free* i *nonfree*):

**`sudo dnf install -y fedora-workstation-repositories`**
  
**`sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`**
  
**`sudo dnf -y groupupdate core`**
  
**`sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin`**
  
**`sudo dnf -y groupupdate sound-and-video`**
  
**`sudo dnf install -y rpmfusion-free-release-tainted`**
  
**`sudo dnf install -y libdvdcss`**
  
**`sudo dnf install -y rpmfusion-nonfree-release-tainted`**
  
**`sudo dnf install -y \*-firmware`**
  
## Instal·lant *Tilix*
  
**`sudo dnf install -y tilix*`**

## Reiniciant el sistema:

**`sudo reboot now`**
  
</div>

---

# Part II (**`palodora-2.sh`**)
  
<div align="center">
  
Després del reinici, cal obrir **Tilix** i continuar copiant i enganxant les ordres.
  
## Aplicant fix del rellotge*:
  
**`sudo timedatectl set-local-rtc 1`**

*- fix necessàri per als que tenen un Dual Boot de Fedora amb Windows.
  
## Habilitant la paqueteria *Flatpak*:
  
**`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`**
  
**`sudo flatpak override --filesystem=~/.themes`**
  
## Instal·lació automàtica de múltiples programes i/o aplicacions:
  
**`sudo dnf copr enable -y refi64/webapp-manager`**
  
**`sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc`**
  
**`sudo sh -c "echo -e '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo"`**

**`sudo dnf check-update -y`**
  
**`sudo dnf install -y libfreeaptx pipewire-codec-aptx code neofetch screenfetch akmod-nvidia xorg-x11-drv-nvidia-cuda gimp google-chrome-stable dejavu-sans-fonts dejavu-sans-mono-fonts liberation-narrow-fonts dejavu-serif-fonts webapp-manager bpytop xclip filezilla fontawesome-fonts gnome-shell-extension-dash-to-dock gnome-shell-extension-netspeed micro papirus-icon-theme discord gnome-pomodoro gnome-shell-extension-user-theme alien bleachbit gparted vlc p7zip* gnome-tweaks gnome-extensions-app chrome-gnome-shell lame gpart ffmpeg tree drawing telegram-desktop android-tools gnome-sound-recorder dconf-editor kdenlive ffmpegthumbs htop qbittorrent curl git handbrake-gui tilix* obs-studio discord gstreamer-plugins* gstreamer1-plugins* pip google-chrome-stable kernel-headers kernel-devel gcc glibc-headers make dkms file-roller file-roller-nautilus cpu-x gnome-power-manager cabextract xorg-x11-font-utils fontconfig musescore pdfarranger youtube-dl xorg-x11-drv-amdgpu grub-customizer vim steam git mesa-libGLU.i686 timeshift htop lutris`**
  
**`sudo rpm -i https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm`**
  
**`sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm`**

**`flatpak install -y flathub com.github.muriloventuroso.pdftricks`**

**`flatpak install -y flathub com.github.tchx84.Flatseal`**

**`flatpak install -y flathub com.mattjakeman.ExtensionManager`**

## Desinstal·lació automàtica de múltiples programes i/o aplicacions:  

**`sudo dnf remove -y gnome-terminal libreoffice* rhythmbox* fedora-chromium-config`**
  
## Actualitzant el equip i netejant la brossa

**`flatpak update -y`**

**`flatpak uninstall -y --unused --delete-data`**

**`sudo dnf update -y --refresh`**

**`fc-cache -v`**

**`sudo dnf autoremove -y`**

**`sudo dnf clean all`**

## Reiniciant el sistema:

**`sudo reboot now`**

# HAN

*`sudo dnf remove -y [Per desinstal·lar folder]`*
  
</div>

---
  
</details>

<details>
  <summary><b>🚧 Descarrega l'script</b></summary>

<p align="center"><b>L'script encara no està disponible.</b></p>

</details>

[license-shield]: https://img.shields.io/github/license/mantekillah/palodora.svg
[license-url]: https://github.com/mantekillah/palodora/blob/master/LICENSE
