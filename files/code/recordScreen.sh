#!/bin/bash

pactl set-card-profile alsa_card.pci-0000_01_00.1 off &&
pactl set-card-profile alsa_card.pci-0000_05_00.6 off && 
pactl set-card-profile bluez_card.4C_87_5D_0D_AD_01 headset-head-unit-msbc &&
ffmpeg -y -f x11grab -i :0.0 -f pulse -i default ~/Videos/test.mkv
#PID=$!
#pacmd set-card-profile bluez_card.4C_87_5D_0D_AD_01 a2dp_sink && 
#pacmd set-card-profile alsa_card.pci-0000_05_00.6 output:analog-stereo
#sleep 2
# Kill it
#kill $PID

