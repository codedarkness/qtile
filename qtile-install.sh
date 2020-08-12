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

install_qtile() {
	config-files/systems/install-qtile.sh
}

config_files() {
	echo ""
	echo " Copy config files to your system"
	echo ""
	echo " Copy this files just one time in your system"
	sleep 2;

	### Check for dir, if not found create it using the mkdir ###
	dldir="$HOME/.config/qtile"
	[ ! -d "$dldir" ] && mkdir -p "$dldir" &&
	echo " qtile directory was created in .config/qtile" || echo " Qtile .config/qtile already exist!"
	echo ""

	cp -af config-files/configs/autostart.sh $HOME/.config/qtile/ &&
	echo " Autostart file has been copied" || echo " Hooooooo!"
	echo ""

	cp -af config-files/configs/config.py $HOME/.config/qtile/ &&
	echo " qtile config file has been copied" || echo " Uppssss!"
	echo ""

	cp -af config-files/configs/sysact.sh $HOME/.config/qtile/ &&
	echo " system account file has been copied" || echo " Not again!!"
	echo ""

	cp -af config-files/configs/dmenu-programs.sh $HOME/.config/qtile/ &&
	echo " dmenu custom file has been copied" || echo " It's happened again!!"
	echo ""

	cp -af config-files/configs/qtile.png $HOME/.config/qtile/ &&
	echo " qtile.png logo has been copied" || echo " It's not you! is the system..."
	echo ""

	while true; do
		read -p " Copy (custome) Xresources [y - n] : " yn
		case $yn in
			[Yy]* )
				cp -af config-files/configs/Xresources $HOME/.Xresources &&
				echo " Xresourses has been copied" || echo " Something is not well!" ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done

	echo ""
}

themes() {
	config-files/themes/themes.sh
}

keybindings() {
	less config-files/keybindings
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
	echo "   ____  _   _ _       "
	echo "  / __ \| | (_) |      "
	echo " | |  | | |_ _| | ___  "
	echo " | |  | | __| | |/ _ \ "
	echo " | |__| | |_| | |  __/ "
	echo "  \___\_\\__|_|_|\___| "
	echo ""
	echo " hackable tiling window manager written in Python"
	echo ""
	echo " 1 - Install qtile"
	echo " 2 - Copy config file (new installation)"
	echo " 3 - Themes"
	echo " 4 - Keybindings"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install_qtile ;;
		2) clear; config_files   ; press_enter ;;
		3) clear; themes        ;;
		4) clear; keybindings   ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
