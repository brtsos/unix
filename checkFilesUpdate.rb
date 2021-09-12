require 'fileutils'
require 'colorize'
require 'git'


g = Git.open('/home/brtsos/unix')
diff = g.diff

puts diff.to_s.length

if diff != ''
  puts "Repository must be pushed!".red
end

codeFiles = Dir.entries("/home/brtsos/code/scripts/")

files = {
  '/home/brtsos/unix/files/httpd.conf' => '/etc/httpd/conf/httpd.conf',
  '/home/brtsos/unix/files/.xinitrc' => '/home/brtsos/.xinitrc',
#  '/home/brtsos/unix/files/.Xresources' => '/home/brtsos/.Xresources',
  '/home/brtsos/unix/files/xorg.conf' => '/etc/X11/xorg.conf',
  '/home/brtsos/unix/files/nobeep.conf' => '/etc/modprobe.d/nobeep.conf',
  '/home/brtsos/unix/files/mkinitcpio.conf' => '/etc/mkinitcpio.conf',
  '/home/brtsos/unix/files/main.conf' => '/etc/bluetooth/main.conf',
  '/home/brtsos/unix/files/alsa.conf' => '/usr/share/alsa/alsa.conf',
  '/home/brtsos/unix/files/.zshenv' => '/home/brtsos/.zshenv',
  '/home/brtsos/unix/files/zsh/.zshrc' => '/home/brtsos/.config/zsh/.zshrc',
  '/home/brtsos/unix/files/config' => '/home/brtsos/.config/i3/config',
  '/home/brtsos/unix/files/i3status/config' => '/home/brtsos/.config/i3status/config',
  '/home/brtsos/unix/files/config.h' => '/home/brtsos/code/st/config.h',
  '/home/brtsos/unix/files/php.ini' => '/etc/php7/php.ini',
  '/home/brtsos/unix/files/etc/pam.d/passwd' => '/etc/pam.d/passwd',
  '/home/brtsos/unix/files/etc/pam.d/login' => '/etc/pam.d/login',
  '/home/brtsos/unix/files/etc/systemd/logind.conf' => '/etc/systemd/logind.conf',
}

codeFiles.each do |file|
   if file != '.' and file != '..'
      if File.exist? "/home/brtsos/unix/files/code/#{file}"
        files.merge!({"/home/brtsos/code/scripts/#{file}" => "/home/brtsos/unix/files/code/#{file}"})
      else
        FileUtils.cp("/home/brtsos/code/scripts/#{file}", "/home/brtsos/unix/files/code/#{file}")
      end
   end
end  

files.each do |template, original|
  if !FileUtils.compare_file(template, original)
    puts "This files must be update: #{template} becaus #{original} changed!".red
    puts "To update: 'sudo cp #{original} #{template}'".green
  end
end
