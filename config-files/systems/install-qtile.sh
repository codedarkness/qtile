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
#        FILE: install-qtile.sh
#       USAGE: ./install-qtile.sh | sub menu of qtile.sh
#
# DESCRIPTION: install qtile in arch and debian besed systems
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-10-20 08:32
#
# -----------------------------------------------------------------

arch_based() {
	echo ""
	echo " Arch-Based"
	echo " Installing qtile from repositories"
	echo ""
	sleep 2;

	sudo pacman -S qtile &&
	echo " qtile has been installed" || echo " Upss!"
	echo ""
}

debian_based() {
	echo ""
	echo " Debian-Based"
	echo " Installing dependencies for qtile"
	echo ""
	sleep 2;

	#0
	sudo apt install -y python-pip
	sudo apt install -y python3-pip
	#1
	sudo apt install -y libxcb-render0-dev
	#2
	sudo apt install -y libffi-dev
	#3
	pip install xcffib
	#4
	sudo apt install -y libcairo2
	#5
	pip install --no-cache-dir cairocffi
	#6
	sudo apt install -y libpangocairo-1.0-0
	#7
	sudo apt install -y  python-dbus

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

change-terminal() {
	echo ""
	echo " Change terminal in qtile.py custom file"
	echo ""
	echo " If you want to change the terminal you can do it here"
	echo ""
	sleep 2

	while true; do
		read -p " Change Terminal [y - n] : " yn
		case $yn in
			[Yy]* )
				read -p " Which is your preffer terminal : " choice;
				sed -i 's+myTerm = ".*"+myTerm = "'$choice'"+g' config-files/configs/qtile.py &&
				echo " Your terminal ($choice) has been changed" || echo " Upsss!"; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
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
	echo "  _           _        _ _       _   _ _       "
	echo " (_)         | |      | | |     | | (_) |      "
	echo "  _ _ __  ___| |_ __ _| | | __ _| |_ _| | ___  "
	echo " | | '_ \/ __| __/ _' | | |/ _' | __| | |/ _ \ "
	echo " | | | | \__ \ || (_| | | | (_| | |_| | |  __/ "
	echo " |_|_| |_|___/\__\__,_|_|_|\__, |\__|_|_|\___| "
	echo "                              | |              "
	echo "                              |_|   	     "
	echo " install qtile from repos or from source"
	echo ""
	echo " 1 - Arch Based Systems (AUR Repos)"
	echo ""
	echo " 2 - Debian Besed Systems (Dependencies) "
	echo " 3 - Install qtile From Source (Arch, Debian)"
	echo " 4 - Install qtile using pip"
	echo ""
	echo " 5 - Change terminal"
	echo ""
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; arch_based          ; press_enter ;;
		2) clear; debian_based        ; press_enter ;;
		3) clear; install_from_source ; press_enter ;;
		4) clear; install_from_pip    ; press_enter ;;
		5) clear; chage-terminal     ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
