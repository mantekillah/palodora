<p align="center"><a href="https://github.com/mantekillah/palodora" target="_blank"><img src="./palodora-logo.png" height="66" /></a></p>

[![MIT License][license-shield]][license-url]

<p align="center">Instruccions i/o scripts de post-instal·lació per a Fedora Workstation 36.</p>

<details>
  <summary><b>🚧 Explicació en detall</b> (per fer-ho manualment)</summary>
  
---
  
1) Índex
  
---
  
Obrir la Terminal i anar copiant i enganxant les ordres:
  
<h3 align="center">Aplicar tweaks d'optimització</h3>

`echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf`

`echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf`

`echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf`

`echo "keepcache=True" | sudo tee -a /etc/dnf/dnf.conf`

`echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf`

<h3 align="center">Actualitzar el sistema</h3>

`sudo dnf update -y --refresh`

`sudo dnf upgrade -y`

<h3 align="center">Establir el nom de la màquina</h3>

`sudo hostnamectl set-hostname linux` (en aquest cas, l'anomeno "***linux***")

<h3 align="center">Activar RPM Fusion (*free* i *nonfree*)</h3>

`sudo dnf install -y fedora-workstation-repositories`
  
`sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`
  
`sudo dnf -y groupupdate core`
  
`sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin`
  
`sudo dnf -y groupupdate sound-and-video`
  
`sudo dnf install -y rpmfusion-free-release-tainted`
  
`sudo dnf install -y libdvdcss`
  
`sudo dnf install -y rpmfusion-nonfree-release-tainted`
  
`sudo dnf install -y \*-firmware`

  <h3 align="center">Instal·lar alguns còdecs</h3>

`sudo dnf mark -y install libfreeaptx pipewire-codec-aptx`
  
<h3 align="center">Reiniciar el sistema</h3>
<p align="center">
  
  `sudo reboot now`
  
  </p>
  
## Fix del rellotge
  
`sudo timedatectl set-local-rtc 1`

## Habilitar Flatpak

`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

## Instal·lar el que vulguis
  
### Preparant la descarrega del *Visual Studio Code*
  
`sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc`

`sudo sh -c "echo -e '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo"`
  
`sudo dnf check-update -y`

### Instal·lo *neofetch*, *screenfetch*, *GIMP*, drivers d'*Nvidia*, *VSCode*, *Google Chrome* i dependències de l'*ONLYOFFICE*
  
`sudo dnf install -y neofetch screenfetch gimp akmod-nvidia xorg-x11-drv-nvidia-cuda code google-chrome-stable dejavu-sans-fonts dejavu-sans-mono-fonts liberation-narrow-fonts dejavu-serif-fonts`
  
### Instal·lo *ONLYOFFICE*
  
`sudo rpm -i https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm`
  
`https://download.opera.com/download/get/?partner=www&opsys=Linux&package=RPM`
`https://go.microsoft.com/fwlink/p/?LinkID=2112907&clcid=0x409&culture=en-us&country=US`
  
`sudo dnf install -y fedora-workstation-repositories`
  
`sudo dnf config-manager --set-enabled google-chrome`

`sudo dnf install -y google-chrome-stable`
  
`sudo dnf copr enable -y refi64/webapp-manager`

`sudo dnf install -y webapp-manager`

`sudo dnf install -y bpytop xclip filezilla fontawesome-fonts gnome-shell-extension-dash-to-dock gnome-shell-extension-netspeed gnome-shell-extension-gpaste micro papirus-icon-theme discord gnome-pomodoro gnome-shell-extension-user-theme simplescreenrecorder alien bleachbit gparted vlc p7zip* gnome-tweaks gnome-extensions-app chrome-gnome-shell lame gpart ffmpeg tree telegram-desktop android-tools gnome-sound-recorder supertux dconf-editor kdenlive ffmpegthumbs htop qbittorrent curl git handbrake-gui obs-studio discord gstreamer-plugins* gstreamer1-plugins* pip google-chrome-stable kernel-headers kernel-devel gcc glibc-headers make dkms file-roller file-roller-nautilus cpu-x gnome-power-manager cabextract xorg-x11-font-utils fontconfig musescore pdfarranger youtube-dl xorg-x11-drv-amdgpu grub-customizer vim steam git mesa-libGLU.i686 timeshift htop lutris`
  
`sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm`
  
`flatpak install -y flathub com.github.muriloventuroso.pdftricks`

`flatpak install -y flathub com.github.tchx84.Flatseal`
  
`flatpak install -y flathub com.mattjakeman.ExtensionManager`
  
`sudo flatpak override --filesystem=~/.themes`

`flatpak update -y`
  
`flatpak uninstall -y --unused --delete-data`
  
`sudo dnf update -y --refresh`
  
`fc-cache -v`
  
`sudo dnf autoremove -y`

## Eliminar el que no vulguis

`sudo dnf remove -y libreoffice* rhythmbox rhythmbox-alternative-toolbar fedora-chromium-config`
`[Per desinstal·lar folder]`

`sudo dnf autoremove`

`sudo dnf clean all`

---
  
</details>

<details>
  <summary><b>🚧 Descarrega l'script</b></summary>

<p align="center"><b>L'script encara no està disponible.</b></p>

</details>

[license-shield]: https://img.shields.io/github/license/mantekillah/palodora.svg
[license-url]: https://github.com/mantekillah/palodora/blob/master/LICENSE
