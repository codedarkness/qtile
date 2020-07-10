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
#        FILE: debian-based.sh
#       USAGE: ./debian-based.sh | sub menu of qtile-install.sh
#
# DESCRIPTION: install qtile in debian based systems
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-09-20 10:46
#
# -----------------------------------------------------------------

install_x_server() {
	echo ""
	echo " Installing xorg display server"
	echo ""
	splep 2;

	PKGS=(xorg lightdm lightdm-gtk-greeter)

	sudo apt install -y "${PKGS[@]}" &&
	echo " xorg and lightdm successfully installed"
	echo ""
	echo " Do not restart you computer yet, first you need to install"
	echo " the desktop enviroment"
	echo ""
}

install_software() {
	echo ""
	echo " Installing dependencies and other essential software"
	splee 2;
	echo ""

	PKGS=(libdbus-1-dev
	libx11-dev
	libxinerama-dev
	libxrandr-dev
	libxss-dev
	libglib2.0-dev
	libpango1.0-dev
	libgtk-3-dev
	libxdg-basedir-dev
	gtk+3.0
	scrot
	xautolock
	suckless-tools
	i3lock
	wget
	curl)

	sudo apt install -y "${PKGS[@]}" &&
	echo " Everything looks good so far" || echo " Something goes wrong!"
	echo ""

	echo " Cloning and installing dunst notify deamon"
	echo ""
	sleep 1;

	git clone https://github.com/dunst-project/dunst.git
	cd dunst
	make
	sudo make install

}

gui-applications() {

#xfce4-notifyd

PKGS=(lxappearance
mousepad
xfce4-power-manager
xfce4-appfinder
pcmanfm
nitrogen)

sudo apt install -y "${PKGS[@]}"

}

cli-applications() {
	echo ""
	echo " Installing CLI Applications"
	echo ""
	sleep 2;

	PKGS=(vim
	ranger
	htop
	mplayer
	w3m
	w3m-img)

	sudo apt install -y "${PKGS[@]}" &&
	echo " Successfully installed"
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
	echo "  _____       _     _             ____                     _  "
	echo " |  __ \     | |   (_)           |  _ \                   | | "
	echo " | |  | | ___| |__  _  __ _ _ __ | |_) | __ _ ___  ___  __| | "
	echo " | |  | |/ _ \ '_ \| |/ _' | '_ \|  _ < / _' / __|/ _ \/ _' | "
	echo " | |__| |  __/ |_) | | (_| | | | | |_) | (_| \__ \  __/ (_| | "
	echo " |_____/ \___|_.__/|_|\__,_|_| |_|____/ \__,_|___/\___|\__,_| "
	echo ""
	echo " install qtile in debian based systems"
	echo ""
	echo " 1 - xorg and login manager"
	echo " 2 - System software"
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
		3) clear; gui-applications ; press_enter ;;
		4) clear; cli-applications ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
