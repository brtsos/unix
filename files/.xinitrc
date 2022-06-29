xrdb -merge ~/.Xresources
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
feh --bg-max --randomize ~/unix/files/images/* &
# dissable middle touchpad click - 17 is touchpad you can get it to run xinput command
xinput set-button-map 17 1 1 3 4 5 6 7
# enable touch as click
xinput set-prop 17 "libinput Tapping Enabled" 1
setxkbmap pl
xsettingsd &
exec i3
