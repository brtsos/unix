#!/bin/bash

# start wifi
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

# You have to connect manualy
#nmcli device wifi list
#nmcli device wifi connect SSID_or_BSSID password PASSWORD

# create user bin folder
mkdir -p ~/bin &&
mkdir -p ~/proj &&
mkdir -p ~/.local/share/gnupg &&
mkdir -p ~/.local/share/zsh &&
mkdir -p ~/.config/dunst &&
mkdir -p ~/.config/i3 &&
mkdir -p ~/.config/i3status &&
mkdir -p ~/.config/wget/wgetrc &&
mkdir -p ~/.config/zsh &&
sudo mkdir -p /etc/bluetooth &&

sudo chmod 700 ~/.local/share/gnupg &&

sudo pacman -S acpi alsa-utils blueman bluez bluez-libs bluez-utils composer curl docker docker-compose dmenu dunst feh firefox git gnome-keyring gvfs htop i3-gaps i3lock i3status networkmanager network-manager-applet nm-connection-editor npm man mysql pavucontrol php7 php7-apache php7-gd php7-sodium php7-sqlite pipewire pipewire-pulse ruby simplescreenrecorder openssh unzip thefuck thunar thunar-archive-plugin ttf-dejavu tumbler v4l-utils vagrant virtualbox virtualbox-guest-iso virtualbox-host-modules-arch wget xarchiver xautolock xorg-xinput xorg-xkill xorg-xrandr zip zsh

# copy configs
cp files/.zshenv ~/.zshenv &&
cp files/zsh/.zshrc ~/.config/zsh/.zshrc &&
cp files/config ~/.config/i3/config &&
cp files/i3status/config ~/.config/i3status/config &&
#cp /etc/dunst/dunstrc ~/.config/dunst/dunstrc &&
sudo cp files/mkinitcpio.conf /etc/mkinitcpio.conf &&
#sudo cp files/xorg.conf /etc/X11/xorg.conf &&
sudo cp files/nobeep.conf /etc/modprobe.d/nobeep.conf &&
sudo cp files/.xinitrc ~/.xinitrc &&
sudo cp files/.Xresources ~/.Xresources &&
sudo cp files/resolv.conf /etc/resolv.conf &&
sudo cp files/alsa.conf /usr/share/alsa/alsa.conf &&
sudo cp files/main.conf /etc/bluetooth/main.conf &&
sudo cp files/mkinitcpio.conf /etc/mkinitcpio.conf &&
sudo cp files/php.ini /etc/php7/php.ini &&
sudo cp files/usr/local/bin/* /usr/local/bin &&
sudo cp files/etc/pam.d/passwd /etc/pam.d/passwd &&
sudo cp files/etc/pam.d/login /etc/pam.d/login &&
sudo cp files/etc/systemd/logind.conf /etc/systemd/logind.conf &&
sudo cp files/etc/default/grub /etc/default/grub &&

# start bluetooth
sudo systemctl start bluetooth &&
sudo systemctl enable bluetooth &&
sudo rfkill unblock all &&
sudo systemctl restart bluetooth &&

# install oh-my-zsh
cp -r files/oh-my-zsh ~/.local/share/

#change default shell to zsh
chsh -s /usr/bin/zsh &&

# install game to colorize bach output
gem install colorize &&

# install git gem to check changes
gem install git &&

# set php7 default php
sudo ln /bin/php7 /usr/local/bin/php

# install mysql
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql &&
sudo systemctl start mysqld &&
sudo systemctl enable mysqld &&
MYSQL=`which mysql`
Q0="CREATE USER IF NOT EXISTS 'brtsos'@'localhost' IDENTIFIED BY '123456789';"
Q1="GRANT ALL ON *.* TO 'brtsos'@'localhost';"
Q2="FLUSH PRIVILEGES;"
SQL="${Q0}${Q1}${Q2}"
sudo $MYSQL -u root -p -e "$SQL" && 

# install apache
sudo cp files/httpd.conf /etc/httpd/conf/httpd.conf &&
sudo systemctl start httpd &&
sudo systemctl enable httpd &&

# set github user
git config --global user.email "brtsos@gmail.com" &&
git config --global user.name "Bartosz Sosna" &&

# install yay
cd /opt &&
sudo rm -Rf yay-git &&
sudo git clone https://aur.archlinux.org/yay-git.git &&
sudo chown -R brtsos:brtsos ./yay-git &&
cd /opt/yay-git &&
makepkg -si &&

# install AUR programs
yay -S 1password &&
yay -S auto-cpufreq-git &&
yay -S clipit &&
yay -S google-chrome --noanswerclean &&
yay -S i3exit &&
yay -S i3-scrot &&
yay -S jetbrains-toolbox &&
yay -S skypeforlinux-preview-bin &&
yay -S slack-desktop &&
yay -S symfony-cli &&
yay -S teams &&
yay -S xournal &&

# enable auto-cpufreq
sudo systemctl start auto-cpufreq &&
sudo systemctl enable auto-cpufreq &&

# install st console TODO Change to my repo
cd /usr/local/ &&
rm -Rf st &&
git clone https://github.com/LukeSmithxyz/st &&
cp ~/unix/files/st/config.h /usr/local/st/config.h &&
cd st &&
sudo make install &&

cd ~/code/ &&
rm -Rf sxiv &&
git clone https://github.com/muennich/sxiv.git &&
cd sxiv &&
sudo make install &&

# install composer packages
composer global require phpstan/phpstan &&
composer global require vimeo/psalm &&
composer global require symplify/easy-coding-standard &&
composer global require phpunit/phpunit

# docker
sudo usermod -aG docker brtsos

# install fonts
sudo pacman -S \
	noto-fonts \
	noto-fonts-emoji \
	ttf-croscore \
       	ttf-font-awesome

yay -S ttf-google-fonts-typewolf ttf-ms-fonts ttf-mac-fonts otf-san-francisco ttf-ancient-fonts
