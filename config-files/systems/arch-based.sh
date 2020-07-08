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

first-option() {
	echo " Start Here";
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
	echo " ----------------------------------------------"
	echo " ### Title here                             ###"
	echo " ----------------------------------------------"
	echo ""
	echo " 1 - Name/Options"
	echo " 2 - Name/Options"
	echo " 3 - Name/Options"
	echo " 4 - Name/Options"
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; Name/Options ; press_enter ;;
		2) clear; Name/Options ; press_enter ;;
		3) clear; Name/Options ; press_enter ;;
		4) clear; Name/Options ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
