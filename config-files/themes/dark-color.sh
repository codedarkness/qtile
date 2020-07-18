#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: dark-color.sh
#       USAGE: ./dark-color.sh | sub menu of themes.sh
#
# DESCRIPTION: change qtile color to a dark theme
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-07-20 09:45
#
# -----------------------------------------------------------------

echo " Changing qtile color to Darkn them"
echo ""

# Border focus window
sed -i 's/"border_focus": ".*",/"border_focus": "808080",/g' $HOME/.config/qtile/config.py &&
echo " Border focus color has been changed" || echo " Upsss! We have a problems"

echo ""

# Border unfocus window
sed -i 's/"border_normal": ".*"/"border_normal": "34495E"/g' $HOME/.config/qtile/config.py &&
echo " Border normal color has been changed" || echo " Upssssss! Not again!"

echo ""

# TreeTab layout colors
sed -i 's/bg_color = ".*",/bg_color = "14161B",/g' $HOME/.config/qtile/config.py &&
sed -i 's/active_bg = ".*",/active_bg = "14161B",/g' $HOME/.config/qtile/config.py &&
sed -i 's/active_fg = ".*",/active_fg = "34495E",/g' $HOME/.config/qtile/config.py &&
sed -i 's/inactive_gb = ".*",/inactive_bg = "14161B",/g' $HOME/.config/qtile/config.py &&
sed -i 's/inactive_fg = ".*",/inactive_fg = "808080",/g' $HOME/.config/qtile/config.py &&
echo " TreeTab layout colors had been change" || echo " Someting is wrong with you!"

echo ""

# Bar and Widgets colors
sed -i '/#startColors/,/#endColors/c\
\#startColors\
colors = [["#14161B", "#14161B"], # color 0 background\
          ["#81A1C1", "#81A1C1"], # color 1 screen tab\
          ["#808080", "#808080"], # color 2 font group names\
          ["#AF601A", "#AF6015"], # color 3 widget cpu\
          ["#5DADE2", "#5DADE2"], # color 4 widget tem\
          ["#D7BDE2", "#D7BDE2"], # color 5 widget men\
          ["#73C6B6", "#73C6B6"], # color 6 widget hdd\
          ["#E59866", "#E59866"], # color 7 widget vol\
          ["#E1ACFF", "#E1ACFF"], # color 8 widget bat\
          ["#81A1C1", "#81A1C1"]] # color 9 widget date\
\#endColors' $HOME/.config/qtile/config.py &&
echo " Bar and Widgets colos had been change!" || echo " Shhh... Problems problems..."

## dmenu custom
sed -i 's/nb="-nb #.*"/nb="-nb #14161B"/g' ~/.config/qtile/sysact.sh &&
sed -i 's/sb="-sb #.*"/sb="-sb #14161B"/g' ~/.config/qtile/sysact.sh &&
sed -i 's/nf="-nf #.*"/nf="-nf #D5656"/g' ~/.config/qtile/sysact.sh &&
echo " dmenu (sysact) colors has canged"
echo ""
