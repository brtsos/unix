#!/bin/bash

if pacmd ls | grep "active profile: <a2dp_sink>"; then
	    pacmd set-card-profile bluez_card.4C_87_5D_0D_AD_01 headset_head_unit

    else
	    pacmd set-card-profile bluez_card.4C_87_5D_0D_AD_01 a2dp_sink
fi
