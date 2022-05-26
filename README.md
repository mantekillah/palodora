<h1 align="center">PALODORA 36</h1>

<p align="center"><a href="https://github.com/mantekillah/palodora" target="_blank"><img src="./palodora-logo.png" width="100" /></a></p>

<details>
  <summary><b>Explicació en detall</b> (per fer-ho manualment)</summary>

### Taula de continguts
  
1. [Optimitza les velocitats](#--optimitzar-velocitats)
2. [Actualitza el sistema](#--actualitzar-el-sistema)

3. [Defineix el nom de la màquina](#--definir-el-nom-de-la-màquina)

4.[Reinicia el sistema](#--reiniciar-el-sistema)
- [Activa els repositoris d'RPM Fusion](#--activar-rpm-fusion-free-i-nonfree)
- [Activa la paqueteria Flatpak](#--activar-flatpak)
- [Instal·la el que vulguis](#--installar-el-que-vulguis)
- [Elimina el que no vulguis](#--eliminar-el-que-no-vulguis)
  
---
  
### - Optimitzar velocitats:

Obrir la Terminal i posar la següent ordre per editar l'arixu **dnf.conf**:

`sudo nano /etc/dnf/dnf.conf`

Introdueixo les següents línies noves:

`fastestmirror=True`

`max_parallel_downloads=10`

`defaultyes=True`

`keepcache=True`

### - Actualitzar el sistema

`sudo dnf update -y --refresh`

`sudo dnf upgrade -y`

### - Definir el nom de la màquina

`sudo hostnamectl set-hostname linux`

### - Reiniciar el sistema

`sudo reboot now`

### - Activar RPM Fusion (*free* i *nonfree*)

`sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`

`sudo dnf -y groupupdate core`

`sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin`

`sudo dnf -y groupupdate sound-and-video`

`sudo dnf install -y rpmfusion-free-release-tainted`

`sudo dnf install -y libdvdcss`

`sudo dnf install -y rpmfusion-nonfree-release-tainted`

`sudo dnf install -y \*-firmware`

### - Activar Flatpak

`flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

### - Instal·lar el que vulguis

`sudo dnf install -y neofetch screenfetch gimp`

### - Eliminar el que no vulguis

`sudo dnf remove -y [Per desinstal·lar folder]`

`sudo dnf autoremove`

`sudo dnf clean all`

</details>

<details>
  <summary><b>Descarrega l'script</b></summary>

<h3 align="center">L'script encara no està disponible.</h3>

</details>
