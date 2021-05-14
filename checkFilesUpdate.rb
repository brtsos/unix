require 'fileutils'
require 'colorize'

files = {
  '/home/brtsos/unix/httpd.conf' =>'/etc/httpd/conf/httpd.conf',
  '/home/brtsos/unix/.xinitrc' =>'/home/brtsos/.xinitrc',
  '/home/brtsos/unix/xorg.conf' =>'/etc/X11/xorg.conf',
  '/home/brtsos/unix/nobeep.conf' =>'/etc/modprobe.d/nobeep.conf',
}

files.each do |template, original|
  if !FileUtils.compare_file(template, original)
    puts "This files must be update: #{template} becaus #{original} changed!".red
  end
end

