#!/bin/python3

import sys
import os

mode = sys.argv[1] if len(sys.argv) > 1 else None # internal/external

def main():
    if mode == "internal":
        dpi = 110
        os.system(rf"xrandr --output eDP1 --mode 1920x1080 --primary; xrandr --output DP1 --off; xrandr --dpi {dpi}")
        xft_dpi(dpi)
        alacritty(12)
        polybar(dpi, 27, -560)
        nitrogen()

    elif mode == "external":
        dpi = 230
        os.system(rf"xrandr --output DP1 --mode 3840x2160 --primary; xrandr --output eDP1 --off; xrandr --dpi {dpi}")
        xft_dpi(dpi)
        alacritty(15)
        polybar(dpi, 37, 700)
        nitrogen()

    else:
        print(f"Usage: {sys.argv[0]} <internal|external>")

def xft_dpi(dpi):
    # Update Xft DPI for apps that don't use gnome settings daemon.
    # Those apps will only get the new DPI when they restart.
    os.system(rf"echo Xft.dpi: {dpi} | xrdb -override -")

    # Update Xft DPI in xsettingsd which is a lightweight gnome settings daemon implementation.
    # The apps which query gsd for DPI will get updated on the fly.
    dpi_xsettingsd = dpi*1024
    os.system(rf"sed -i -E '/DPI/s/[0-9.]+/{dpi_xsettingsd}/' $HOME/.xsettingsd") # 130*1024
    os.system('killall -HUP xsettingsd')

def alacritty(font_size):
    os.system(rf"sed -i -E '/\s+size:/s/[0-9.]+/{font_size}/' $HOME/.config/alacritty/alacritty.yml")

def polybar(dpi, height, tray_offset):
    os.system(rf"sed -i -E '/dpi =/s/[0-9.]+/{dpi}/' $HOME/.config/polybar/config")
    os.system(rf"sed -i -E '/height =/s/[0-9.]+/{height}/' $HOME/.config/polybar/config")
    os.system(rf"sed -i -E '/tray-offset-x =/s/-?[0-9.]+/{tray_offset}/' $HOME/.config/polybar/config")
    os.system(rf"polybar-msg cmd restart")

def nitrogen():
    os.system("nitrogen --restore")

if __name__ == "__main__":
    main()
