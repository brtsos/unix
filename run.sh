yes | sudo pacman -Sy nvidia nvidia-utils nvidia-settings i3-gaps i3status i3lock git docker docker-compose dmenu firefox ttf-dejavu virtualbox virtualbox-host-modules-arch virtualbox-guest-iso vagrant openssh zip &&
sudo cp xorg.conf /etc/X11/xorg.conf  &&
sudo cp .xinitrc ~/.xinitrc  &&
git config --global user.email "brtsos@gmail.com" &&
git config --global user.name "Bartosz Sosna" &&
cd /opt &&
sudo rm -Rf yay-git &&
sudo git clone https://aur.archlinux.org/yay-git.git &&
sudo chown -R brtsos:brtsos ./yay-git &&
cd /opt/yay-git &&
makepkg -si &&
cd ~ &&
mkdir -p code &&
cd code/ &&
rm -Rf st &&
git clone https://github.com/LukeSmithxyz/st.git &&
cd st &&
sudo make install

