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
#        FILE: themes.sh
#       USAGE: ./themes.sh | sub menu of qtile.sh
#
# DESCRIPTION: change color scheme of qtile
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 07-07-20 09:45
#
# -----------------------------------------------------------------

dark-color() {
	config-files/themes/qtile-dark-color.sh
}

dracula-color() {
	config-files/themes/qtile-dracula-color.sh
}

green-color() {
	config-files/themes/qtile-green-color.sh
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
	echo " DarnessCode"
	echo "        _   _ _       _____      _                 "
	echo "       | | (_) |     / ____|    | |                "
	echo "   __ _| |_ _| | ___| |     ___ | | ___  _ __ ___  "
	echo "  / _' | __| | |/ _ \ |    / _ \| |/ _ \| '__/ __| "
	echo " | (_| | |_| | |  __/ |___| (_) | | (_) | |  \__ \ "
	echo "  \__, |\__|_|_|\___|\_____\___/|_|\___/|_|  |___/ "
	echo "     | |                                           "
	echo "     |_|                                           "
	echo " apply some diferent color to qtile"
	echo ""
	echo " 1 - Dark Color Scheme"
	echo " 2 - Dracula Color Scheme"
	echo " 3 - Green Color Scheme"
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; dark-color    ; press_enter ;;
		2) clear; dracula-color ; press_enter ;;
		3) clear; green-color   ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
