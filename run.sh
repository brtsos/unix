yes | sudo pacman -Syi curl docker docker-compose dmenu firefox git i3-gaps i3lock i3status nvidia nvidia-settings nvidia-utils npm mysql php7 php7-apache  openssh ttf-dejavu vagrant virtualbox virtualbox-guest-iso virtualbox-host-modules-arch wget xorg-xrandr zip &&

# create user bin folder
mkdir -p ~/bin

# install mysql
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql &&
sudo systemctl start mysqld &&
sudo systemctl enable mysqld &&
MYSQL=`which mysql`
Q0="CREATE USER 'brtsos'@'localhost' IDENTIFIED BY '123456789';"
Q1="GRANT ALL ON *.* TO 'brtsos'@'localhost';"
Q2="FLUSH PRIVILEGES;"
SQL="${Q0}${Q1}${Q2}"
sudo $MYSQL -u root -p -e "$SQL" && 

# copy configs 
sudo cp xorg.conf /etc/X11/xorg.conf  &&
sudo cp nobeep.conf /etc/modprobe.d/nobeep.conf &&
sudo cp .xinitrc ~/.xinitrc  &&

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

# install st console
cd ~ &&
mkdir -p code &&
cd code/ &&
rm -Rf st &&
git clone https://github.com/LukeSmithxyz/st.git &&
cd st &&
sudo make install &&

# install apache



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
