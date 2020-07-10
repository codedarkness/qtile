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
	config-files/systems/arch-based.sh
}

debian_based() {
	config-files/systems/debian-based.sh
}

install_qtile() {
	config-files/systems/install-qtile.sh
}

config_files() {
	echo ""
	echo " Copy config files to your system"
	sleep 2;

	mkdir $HOME/.config/qtile

	cp -af config-files/configs/autostart.sh $HOME/.config/qtile &&
	echo " Autostart file has been copied" || echo " Hooooooo!"
	echo ""

	cp -af config-files/configs/config.py $HOME/.config/qtile &&
	echo " qtile config file has been copied" || echo " Uppssss!"
	echo ""

	cp -af config-files/configs/original_config.py $HOME/.config/qtile &&
	echo " Everything looks Good" || echo " Did you brake something!"
	echo ""

	cp -af config-files/configs/sysact.sh $HOME/.config/qtile &&
	echo " system account file has been copied" || echo " Not again!!"
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
	echo " 3 - Install qtile"
	echo " 4 - Copy config file (new installation)"
	echo " 5 - Themes"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; arch_based    ;;
		2) clear; debian_based  ;;
		3) clear; install_qtile ;;
		4) clear; config_files  ; press_enter ;;
		5) clear; themes       ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
