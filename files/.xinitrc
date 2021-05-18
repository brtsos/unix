xrdb -merge ~/.Xresources
feh --bg-max --randomize ~/unix/files/images/* &
# dissable middle touchpad click
xinput set-button-map 17 1 1 3 4 5 6 7
exec i3
