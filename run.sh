#!/bin/bash

# create user bin folder
mkdir -p ~/bin &&
mkdir -p ~/.local/share/zsh &&
mkdir -p ~/.config/wget/wgetrc &&
mkdir -p ~/.config/zsh &&

sudo chmod 755 -R  ~/.config/wget

yes | sudo pacman -Syi curl docker docker-compose dmenu firefox git i3-gaps i3lock i3status nvidia nvidia-settings nvidia-utils npm mysql php7 php7-apache ruby openssh ttf-dejavu vagrant virtualbox virtualbox-guest-iso virtualbox-host-modules-arch wget xorg-xrandr zip zsh

# copy configs
cp files/.zshenv ~/.zshenv &&
cp files/zsh/.zshrc ~/.config/zsh/.zshrc &&
sudo cp files/xorg.conf /etc/X11/xorg.conf &&
sudo cp files/nobeep.conf /etc/modprobe.d/nobeep.conf &&
sudo cp files/.xinitrc ~/.xinitrc &&
sudo cp files/resolv.conf /etc/resolv.conf &&
touch ~/.config/zsh/.zshrc &&

# install oh-my-zsh
cp -R files/oh-my-zsh ~/.local/share/oh-my-zsh

#change default shell to zsh
chsh -s /usr/bin/zsh &&

# install game to colorize bach output
gem install colorize &&

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
yay -S google-chrome --noanswerclean &&
yay -S slack-desktop &&
yay -S teams &&
yay -S skypeforlinux-preview-bin &&

# install st console TODO Change to my repo
cd ~ &&
mkdir -p code &&
cd code/ &&
rm -Rf st &&
git clone https://github.com/LukeSmithxyz/st.git &&
cd st &&
sudo make install &&

# install apache
sudo cp files/httpd.conf /etc/httpd/httpd.conf &&
sudo systemctl start apache &&
sudo systemctl enable apache &&

# install phpstorm
cd /tmp/ &&
sudo curl -L "https://download.jetbrains.com/product?code=PS&latest&distribution=linux" --output phpstorm.tar.gz &&
mkdir -p ~/bin/phpstorm && 
tar -xf phpstorm.tar.gz -C ~/bin/phpstorm/ --strip 1 &&
sudo ln -sf ~/bin/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm &&

# install composer
cd ~/bin &&
wget https://getcomposer.org/composer.phar &&
sudo ln -sf ~/bin/composer.phar /usr/local/bin/composer
