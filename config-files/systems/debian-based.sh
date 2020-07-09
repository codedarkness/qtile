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

install_software() {
sudo apt install xorg
sudo apt install lightdm lightdm-gtk-greeter

# Dunst
sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev

git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

# GUI Apps
sudo apt install lxappearance mousepad xfce4-power-manager xfce4-notifyd xfce4-appfinder pcmanfm
nitrogen

# CLI Apps
sudo apt install vim ranger htop mplayer w3m w3m-img

# System software
gtk+3.0
scrot
xautolock
suckless-tools
i3lock
wget







}

install_dependencies() {
	echo ""
	echo " Installing dependencies for qtile"
	echo ""
	sleep 2;
sudo apt install python-pip
sudo apt install python3-pip
	#1
	sudo apt-get install libxcb-render0-dev
	#2
	sudo apt-get install libffi-dev
	#3
	pip install xcffib
	#4
	sudo apt-get install libcairo2
	#5
	pip install --no-cache-dir cairocffi
	#6
	sudo apt-get install libpangocairo-1.0-0
	#7
	sudo apt-get install python-dbus

	echo ""
	echo " Now you can install qtile; from source or via pip"
	echo ""
}

install_from_source() {
	echo ""
	echo " Installing qtile from source"
	echo ""
	sleep 2;

	echo " Cloning qtile repo"
	git clone git://github.com/qtile/qtile.git
	cd qtile
	pip install .
}

install_from_pip() {
	echo ""
	echo " Instaling qtile using pip"
	echo ""
	sleep 2;

	pip install qtile
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
	echo " 2 - Qtile Dependencies"
	echo " 3 - Install qtile from source"
	echo " 4 - Install qtile (pip)"
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install_dependencies ; press_enter ;;
		2) clear; install_from_sources ; press_enter ;;
		3) clear; install_from_pip     ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
