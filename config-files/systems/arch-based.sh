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
#        FILE: arch-based.sh
#       USAGE: ./arch-based.sh | sub menu fo qitle-install.sh
#
# DESCRIPTION: install qtile in arch based systems
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-08-20 10:49
#
# -----------------------------------------------------------------

install_x_server() {
	echo ""
	echo " Start Here"
}

install_software() {
	echo " Installing system Utilities"
	echo ""
}

gui_applications() {
	echo ""
	echo " Installing CLI applications"
	echo ""

	sleep 2;

	# comment the software you don't need it or add more
	sudo pacman -S --noconfirm --needed pcmanfm
	sudo pacman -S --noconfirm --needed transmission-desktop
	sudo pacman -S --noconfirm --needed brave
	sudo pacman -S --noconfirm --needed mouspad
	sudo pacman -S --noconfirm --needed xfce-applinder
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
}

cli_applications() {
	echo ""
	echo " Installing CLI applications"
	echo ""

	sleep 2;

	# comment the software you don't need it or add more
	sudo pacman -S --noconfirm --needed ranger
	sudo pacman -S --noconfirm --needed vim
	sudo pacman -S --noconfirm --needed newsboat
	sudo pacman -S --noconfirm --needed w3m
	sudo pacman -S --noconfirm --needed
	sudo pacman -S --noconfirm --needed
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
	echo "                    _     ____                     _  "
	echo "     /\            | |   |  _ \                   | | "
	echo "    /  \   _ __ ___| |__ | |_) | __ _ ___  ___  __| | "
	echo "   / /\ \ | '__/ __| '_ \|  _ < / _' / __|/ _ \/ _' | "
	echo "  / ____ \| | | (__| | | | |_) | (_| \__ \  __/ (_| | "
	echo " /_/    \_\_|  \___|_| |_|____/ \__,_|___/\___|\__,_| "
	echo ""
	echo " Install the necessary utilities/software for a fresh install"
	echo ""
	echo " 1 - x server and login manager"
	echo " 2 - System Utilities"
	echo " 3 - GUI Applications"
	echo " 4 - CLI Applications"
	echo ""
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install_x_server ; press_enter ;;
		2) clear; install_software ; press_enter ;;
		3) clear; gui_applicatios  ; press_enter ;;
		4) clear; cli_applications ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
