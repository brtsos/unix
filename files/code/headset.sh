#!/bin/bash

if pactl list | grep 'api.bluez5.profile = "a2dp-sink"'; then
	    pactl set-card-profile bluez_card.4C_87_5D_0D_AD_01 headset-head-unit-msbc

    else
	    pactl set-card-profile bluez_card.4C_87_5D_0D_AD_01 a2dp-sink
fi
