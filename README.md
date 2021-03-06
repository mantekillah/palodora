<p align="center"><a href="https://github.com/mantekillah/palodora" target="_blank"><img src="./palodora-logo.png" height="66" /></a></p>

[![MIT License][license-shield]][license-url]

<p align="center">Instruccions i/o scripts de post-instal路laci贸 per a Fedora Workstation 36.</p>

<details>
  <summary><b>馃毀 Explicaci贸 en detall</b> (per fer-ho manualment)</summary>
  
---
  
1) [**Primera part de la post-instal路laci贸:**](#part-i---palodora-1sh)
- [Aplicar tweaks d'optimitzaci贸](#aplicant-tweaks-doptimitzaci贸) (millora les actualitzacions)
- [Actualitzar el sistema](#actualitzant-el-sistema)
- [Establir el nom de la m脿quina](#establint-el-nom-de-la-m脿quina) (pots posar el nom que vulguis a la teva m脿quina)
- [Activant repos d'RPM Fusion: *free* i *nonfree*](#activant-repos-drpm-fusion-free-i-nonfree) (pots editar les ordres si, per exemple, nom茅s vols activar els *free*)
- [Instal路lar 'Tilix'](#installant-tilix) (una terminal millorada)
- [Reiniciar el sistema](#reiniciant-el-sistema)
2) [**Segona part de la post-instal路laci贸:**](#part-ii---palodora-2sh)
- [Aplicant fix del rellotge](#aplicant-fix-del-rellotge) (nom茅s per usuaris amb *dual boot* de Windows + Fedora)
- [Habilitar la paqueteria *Flatpak*](#habilitant-la-paqueteria-flatpak)
- [Instal路laci贸 autom脿tica de m煤ltiples programes i/o aplicacions](#installaci贸-autom脿tica-de-m煤ltiples-programes-io-aplicacions)
- [Desinstal路laci贸 autom脿tica de m煤ltiples programes i/o aplicacions](#desinstallaci贸-autom脿tica-de-m煤ltiples-programes-io-aplicacions)
- [Actualitzar el equip i netejar brossa](#actualitzant-el-equip-i-netejant-la-brossa)
- [Reiniciar el sistema](#reiniciant-el-sistema-1)

---

# Part I - **`paloscript1.sh`**
  
<div align="center">
  
Obrir la Terminal i anar copiant i enganxant les ordres.
  
## Aplicant tweaks d'optimitzaci贸:

**`echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "keepcache=True" | sudo tee -a /etc/dnf/dnf.conf`**

**`echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf`**

## Actualitzant el sistema:

**`sudo dnf update -y --refresh`**

**`sudo dnf upgrade -y`**

## Establint el nom de la m脿quina:

En aquest cas, l'anomenar茅 "**linux**"
  
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
  
## Instal路lant 'Tilix':
  
**`sudo dnf install -y tilix*`**

## Reiniciant el sistema:

**`sudo reboot now`**
  
</div>

---

# Part II - **`paloscript2.sh`**
  
<div align="center">
  
Despr茅s del reinici, cal obrir **Tilix** (traurem *gnome-terminal*) i continuar copiant i enganxant les ordres.
  
## Aplicant fix del rellotge:
  
**`sudo timedatectl set-local-rtc 1`**
  
## Habilitant la paqueteria *Flatpak*:
  
**`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`**
  
**`sudo flatpak override --filesystem=~/.themes`**
  
## Instal路laci贸 autom脿tica de m煤ltiples programes i/o aplicacions:
  
**`sudo dnf copr enable -y refi64/webapp-manager`**
  
**`sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/36/winehq.repo`**
  
**`sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc`**
  
**`sudo sh -c "echo -e '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo"`**
  
**`sudo sh -c "echo -e '[teams]\nname=Microsoft Teams\nbaseurl=https://packages.microsoft.com/yumrepos/ms-teams\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/teams.repo"`**
  
**`sudo rpm --import https://rpm.opera.com/rpmrepo.key`**
  
**`sudo tee /etc/yum.repos.d/opera.repo <<RPMREPO`**
  
**`[opera]`**
  
**`name=Opera packages`**
  
**`type=rpm-md`**
  
**`baseurl=https://rpm.opera.com/rpm`**
  
**`gpgcheck=1`**
  
**`gpgkey=https://rpm.opera.com/rpmrepo.key`**
  
**`enabled=1`**
  
**`RPMREPO`**
  
**`git clone https://github.com/luisrguerra/wow64-icon-theme.git`**

**`cd wow64-icon-theme`**

**`sudo sh ./install.sh`**

**`cd`**

**`rm -rf wow64-icon-theme`**
  
**`git clone https://github.com/vinceliuice/Colloid-gtk-theme.git`**

**`cd Colloid-gtk-theme`**

**`sudo sh ./install.sh --theme all --tweaks dracula rimless`**

**`cd`**

**`rm -rf Colloid-gtk-theme`**

**`sudo dnf check-update -y`**
  
**`sudo dnf install -y libfreeaptx pipewire-codec-aptx code teams opera-stable neofetch screenfetch akmod-nvidia xorg-x11-drv-nvidia-cuda gimp google-chrome-stable dejavu-sans-fonts dejavu-sans-mono-fonts gnome-shell-extension-pop-shell liberation-narrow-fonts breeze-cursor-theme gtkhash-nautilus 'mozilla-fira-*' nautilus-image-converter nautilus-search-tool dejavu-serif-fonts webapp-manager megasync nautilus-megasync bpytop xclip filezilla gnome-chess fontawesome-fonts gnome-shell-extension-dash-to-dock gnome-themes-extra gtk-murrine-engine sassc gnome-shell-extension-netspeed micro papirus-icon-theme peek discord gnome-shell-extension-user-theme alien bleachbit torbrowser-launcher gparted vlc p7zip* gnome-tweaks aisleriot gnome-extensions-app chrome-gnome-shell lame gpart ffmpeg tree drawing telegram-desktop android-tools gnome-sound-recorder xournalpp* video-downloader dconf-editor kdenlive ffmpegthumbs htop qbittorrent curl git handbrake-gui tilix* obs-studio discord gstreamer-plugins* gstreamer1-plugins* pip google-chrome-stable kernel-headers kernel-devel gcc glibc-headers make dkms file-roller file-roller-nautilus vokoscreenNG cpu-x libretro-mgba variety xarchiver gnome-power-manager cabextract xorg-x11-font-utils fontconfig musescore pdfarranger youtube-dl xorg-x11-drv-amdgpu grub-customizer vim steam git mesa-libGLU.i686 timeshift htop lutris winehq-devel --allowerasing`**
  
**`sudo rpm -i https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm`**

**`sudo rpm -i https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm`**
  
**`sudo rpm -i https://github.com/shiftkey/desktop/releases/download/release-3.0.0-linux2/GitHubDesktop-linux-3.0.0-linux2.rpm`**
  
**`sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm`**

**`flatpak install -y flathub com.github.tchx84.Flatseal`**

**`flatpak install -y flathub com.github.muriloventuroso.pdftricks`**
  
**`flatpak install -y flathub io.gitlab.librewolf-community`**

**`flatpak install -y flathub com.github.robertsanseries.ciano`**
  
**`flatpak install -y flathub net.cozic.joplin_desktop`**
  
**`flatpak install -y flathub io.github.Soundux`**

**`flatpak install -y flathub com.mattjakeman.ExtensionManager`**
  
**`flatpak install -y flathub com.rafaelmardojai.Blanket`**

## Desinstal路laci贸 autom脿tica de m煤ltiples programes i/o aplicacions:  

**`sudo dnf remove -y gnome-tour gnome-contacts gnome-terminal libreoffice* rhythmbox* yelp fedora-chromium-config mediawriter gnome-maps gnome-weather gnome-photos totem`**
  
## Settejant cosetes:

**`gsettings set com.gexperts.Tilix.Settings theme-variant 'dark'`**

**`gsettings set org.gnome.desktop.interface icon-theme 'wow64'`**

**`gsettings set org.gnome.desktop.interface gtk-theme 'Colloid-Green-Dark-Dracula'`**
	
**`gsettings set org.gnome.shell.extensions.user-theme name 'Colloid-Green-Dark-Dracula'`**
	
**`gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Semi-Bold 11'`**

**`gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'adaptive'`**
	
**`gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true`**

**`gsettings set org.gnome.desktop.calendar show-weekdate true`**

**`gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true`**

**`gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'`**

**`gsettings set org.gnome.shell.overrides workspaces-only-on-primary false`**
	
## Actualitzant el equip i netejant la brossa:

**`flatpak update -y`**

**`flatpak uninstall -y --unused --delete-data`**

**`sudo dnf update -y --refresh`**

**`fc-cache -v`**

**`sudo dnf autoremove -y`**

**`sudo dnf clean all`**

## Reiniciant el sistema:

**`sudo reboot now`**

</div>

---
  
</details>

<details>
  <summary><b>Descarrega els scripts</b></summary>

<div align="center">

Obre la Terminal:
	
`sudo dnf install -y git`
	
`git clone https://github.com/mantekillah/palodora.git`
	
`cd palodora`
	
`sudo chmod +x paloscript1.sh`
	
`sudo chmod +x paloscript2.sh`

`sudo sh ./paloscript1.sh`

**Reinici.**

Obre la Terminal:
	
`cd palodora`
	
`sudo sh ./paloscript2.sh`

**Reinici.**

Obre la Terminal:
	
`rm palodora`
	
</div>
  
---

</details>

<details>
	<summary><b>馃毀 Per fer manualment</b> (s铆 o s铆)</summary>

- **Afegir extensions** manualment (utilitzant el ***Gestor d'extensions*** que hem instal路lat abans):
	- `Blur my Shell` - *aunetx* / `Color Picker` - *grroot* / `Desktop Icons NG (DING)` - *rastersoft* / `Espresso` - *tharbold* / `GSConnect` - *dlandau* / `Impatience` - *gfxmonk* / `Screenshot Tool` - *oal* / `Sound Input & Output Device Chooser` - *kgshank* / `Tiling Assistant` - *Leleat* / `Tray Icons: Reloaded` - *MartinPL* / `Pop Shell` - *System76* (instal路lada previament amb `sudo dnf gnome-shell-extension-pop-shell`)
- **Extensions** `AppIndicator and KStatusNotifierItem Support`, `Dash to Dock` & `User Themes` **activades**.
- **WebApps** (a trav茅s de *Chrome*):
	- `Drive` `Campus Virtual` `Twitter` `Netflix` `Movistar Plus` `Amazon Prime` `WhatsApp Web` `Instagram` `Mastodon` `Pixelfed`

</details>

### To-Do-List

- **Refer de zero els dos scripts** perque he canviat masses coses mentres feia tota l'explicaci贸.
- **Provar el jove Frankenstein by mantekillah** en una instal路laci贸 i m脿quina real.

[license-shield]: https://img.shields.io/github/license/mantekillah/palodora.svg
[license-url]: https://github.com/mantekillah/palodora/blob/master/LICENSE
