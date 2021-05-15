require 'fileutils'
require 'colorize'

files = {
  '/home/brtsos/unix/files/httpd.conf' => '/etc/httpd/conf/httpd.conf',
  '/home/brtsos/unix/files/.xinitrc' => '/home/brtsos/.xinitrc',
  '/home/brtsos/unix/files/xorg.conf' => '/etc/X11/xorg.conf',
  '/home/brtsos/unix/files/nobeep.conf' => '/etc/modprobe.d/nobeep.conf',
  '/home/brtsos/unix/files/resolv.conf' => '/etc/resolv.conf',
  '/home/brtsos/unix/files/alsa.conf' => '/usr/share/alsa/alsa.conf',
}

files.each do |template, original|
  if !FileUtils.compare_file(template, original)
    puts "This files must be update: #{template} becaus #{original} changed!".red
  end
end

