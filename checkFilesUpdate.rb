require 'fileutils'
require 'colorize'

files = {
  '/home/brtsos/unix/files/httpd.conf' => '/etc/httpd/conf/httpd.conf',
  '/home/brtsos/unix/files/.xinitrc' => '/home/brtsos/.xinitrc',
  '/home/brtsos/unix/files/.Xresources' => '/home/brtsos/.Xresources',
  '/home/brtsos/unix/files/xorg.conf' => '/etc/X11/xorg.conf',
  '/home/brtsos/unix/files/nobeep.conf' => '/etc/modprobe.d/nobeep.conf',
  '/home/brtsos/unix/files/mkinitcpio.conf' => '/etc/mkinitcpio.conf',
  '/home/brtsos/unix/files/main.conf' => '/etc/bluetooth/main.conf',
  '/home/brtsos/unix/files/alsa.conf' => '/usr/share/alsa/alsa.conf',
  '/home/brtsos/unix/files/.zshenv' => '/home/brtsos/.zshenv',
  '/home/brtsos/unix/files/zsh/.zshrc' => '/home/brtsos/.config/zsh/.zshrc',
  '/home/brtsos/unix/files/config' => '/home/brtsos/.config/i3/config',
  '/home/brtsos/unix/files/config.h' => '/home/brtsos/code/st/config.h',
}

files.each do |template, original|
  if !FileUtils.compare_file(template, original)
    puts "This files must be update: #{template} becaus #{original} changed!".red
  end
end

