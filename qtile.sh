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
#        FILE: qtile.sh
#       USAGE: ./qtile.sh
#
# DESCRIPTION: install and configure a minimal installation of qtile
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-05-20 1:14
#
# -----------------------------------------------------------------

arch_based() {
	echo ""
	echo " Arch-Based"
	echo " Installing qtile from repositories"
	echo ""
	sleep 1;

	sudo pacman -S qtile &&
	echo " qtile has been installed" || echo " Upss!"
	echo ""
}

debian_based() {
	config-files/systems/debian-based.sh
}

config_files() {
	echo ""
	echo " Copy config files to your system"
	sleep 2;
	mkdir ~/.config/qtile
	cp -af config-files/configs/autostart.sh ~/.config/qtile &&
	echo " Autostart file has been copied" || echo " Hooooooo!"
	echo ""

	cp -af config-files/configs/config.py ~/.config/qtile &&
	echo " qtile config file has been copied" || echo " Uppssss!"
	echo ""

	cp -af config-files/configs/original_config.py ~/.config/qtile &&
	echo " Everything looks Good" || echo " Did you brake something!"
	echo ""
}

themes() {
	config-files/themes/themes.sh
}

press_enter() {
	echo ""
	echo -n " Press Enter To Continue"
	read
	clear
}

incorrect_selection() {
	echo " Incorrect selection! try again"
}

until [ "$selection" = "0" ]; do
	clear
	echo ""
	echo " DarknessCode"
	echo "        _   _ _       "
	echo "       | | (_) |      "
	echo "   __ _| |_ _| | ___  "
	echo "  / _' | __| | |/ _ \ "
	echo " | (_| | |_| | |  __/ "
	echo "  \__, |\__|_|_|\___| "
	echo "     | |              "
	echo "     |_|              "
	echo ""
	echo " hackable tiling window manager written in Python"
	echo ""
	echo " 1 - Arch Based-Systems"
	echo " 2 - Debian Based-Systems"
	echo " 3 - Copy config file (new installation)"
	echo " 4 - Themes"
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; arch_based   ;;
		2) clear; debian_based ;;
		3) clear; config_files  ; press_enter ;;
		4) clear; themes       ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
