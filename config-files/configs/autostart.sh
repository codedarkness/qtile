#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _` | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _` |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: autostart.sh
#       USAGE: qtile/autostart.sh
#
# DESCRIPTION: autostart file for qtile
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-05-2020 04:22
#
# -----------------------------------------------------------------

compton &
nitrogen --restore &
volumeicon &
nm-applet &
xfce4-power-manager &
pamac-tray &
xautolock -time 10 -locker blurlock &
ff-theme-util &
fix_xcursor &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
