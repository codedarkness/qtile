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
#        FILE: green-color.sh
#       USAGE: ./green-color.sh | sub file of theme.sh
#
# DESCRIPTION: change qtile color to a green color
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-07-20 09:58
#
# -----------------------------------------------------------------

echo " Changing qtile color to Green them"
echo ""
sleep 2;

# Border focus window
sed -i 's/"border_focus": ".*",/"border_focus": "556064",/g' $HOME/.config/qtile/config.py &&
echo " Border focus color has been changed" || echo " Upsss! We have a problems"
echo ""

# Border unfocus window
sed -i 's/"border_normal": ".*"/"border_normal": "2F3D44"/g' $HOME/.config/qtile/config.py &&
echo " Border normal color has been changed" || echo " Upssssss! Not again!"
echo ""

# TreeTab layout colors
sed -i 's/bg_color = ".*",/bg_color = "222D31",/g' $HOME/.config/qtile/config.py &&
sed -i 's/active_bg = ".*",/active_bg = "222D31",/g' $HOME/.config/qtile/config.py &&
sed -i 's/active_fg = ".*",/active_fg = "1F618D",/g' $HOME/.config/qtile/config.py &&
sed -i 's/inactive_gb = ".*",/inactive_bg = "222D31",/g' $HOME/.config/qtile/config.py &&
sed -i 's/inactive_fg = ".*",/inactive_fg = "839192",/g' $HOME/.config/qtile/config.py &&
echo " TreeTab layout colors had been change" || echo " Someting is wrong with you!"
echo ""

# Bar and Widgets colors
sed -i '/#startColors/,/#endColors/c\
\#startColors\
colors = [["#222D31", "#222D31"], # color 0 background\
          ["#1F618D", "#1F618D"], # color 1 screen tab\
          ["#839192", "#839192"], # color 2 font group names\
          ["#AF601A", "#AF6015"], # color 3 widget cpu\
          ["#5DADE2", "#5DADE2"], # color 4 widget tem\
          ["#D7BDE2", "#D7BDE2"], # color 5 widget men\
          ["#73C6B6", "#73C6B6"], # color 6 widget hdd\
          ["#E59866", "#E59866"], # color 7 widget vol\
          ["#E1ACFF", "#E1ACFF"], # color 8 widget bat\
          ["#81A1C1", "#81A1C1"]] # color 9 widget date\
\#endColors' $HOME/.config/qtile/config.py &&
echo " Bar and Widgets colos had been change!" || echo " Shhh... Problems problems..."
echo ""

## dmenu custom
sed -i 's/nb="-nb #.*"/nb="-nb #222D31"/g' ~/.config/qtile/sysact.sh &&
sed -i 's/sb="-sb #.*"/sb="-sb #222D31"/g' ~/.config/qtile/sysact.sh &&
sed -i 's/nf="-nf #.*"/nf="-nf #4D5656"/g' ~/.config/qtile/sysact.sh &&
echo " dmenu (sysact) colors has canged"
echo ""

## dmenu custom
sed -i 's/nb="-nb #.*"/nb="-nb #222D31"/g' $HOME/.config/qtile/dmenu-programs.sh &&
sed -i 's/sb="-sb #.*"/sb="-sb #222D31"/g' $HOME/.config/qtile/dmenu-programs.sh &&
sed -i 's/nf="-nf #.*"/nf="-nf #4D5656"/g' $HOME/.config/qtile/dmenu-programs.sh &&
echo " dmenu programs colors has canged" || echo " Upssss!!!!"
echo ""

## change background color dnustrc
sed -i 's/background\ = .*/background\ = \"#222D31"/g' $HOME/.config/dunst/dunstrc &&
echo " dnust color scheme has been applied" || echo " No way!!!!"
echo ""

## change the background colo in nitrogen
sed -i 's/bgcolor=.*/bgcolor=#222D31/g' $HOME/.config/nitrogen/bg-saved.cfg &&
echo " nitrogen background color has been applied" || echo " Maybe is you!!!!"
echo ""

## change background color in slick-greeter lightdm
sudo sed -i 's/background-color=.*/background-color=#222D31/g' /etc/lightdm/slick-greeter.conf &&
sudo sed -i 's/theme-name=.*/theme-name=Adapta-Nokto-Eta-Maia/g' /etc/lightdm/slick-greeter.conf &&
sudo sed -i 's/icon-theme-name=.*/icon-theme-name=Adapta-Maia/g' /etc/lightdm/slick-greeter.conf &&
echo " Slick-Greeter has been changed" || echo " Upsss!!!!"
echo ""

while true; do
	read -p " Do you want to copy Xresources [y - n] : " yn
	case $yn in
		[Yy]* )
			cp -af config-files/themes/xresources/Xresources-green $HOME/.Xresources &&
			echo " Xresources has been copy" || echo " Upsss! we have a problem here" ; break ;;
		[Nn]* )
			break ;;
		* ) echo "Please answer yes or no." ;;
	esac
done

echo ""
echo " Restart qtile (Mod+Control+r)"
echo " If did you copy xresources do you need to exit and login back."
