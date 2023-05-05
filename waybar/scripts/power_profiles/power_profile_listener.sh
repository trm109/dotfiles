#!/bin/bash

stringContain() { [ -z "$1" ] || { [ -z "${2##*$1*}" ] && [ -n "$2" ];};}

_get_icon () {
	case "$(asusctl profile -p)" in
		*"Performance"*)
			echo '{"text": "󱓞", "class":"Performance"}'
			;;
		*"Balanced"*)
			echo '{"text": "", "class":"Balanced"}'
			;;
		*"Quiet"*)
			echo '{"text": "󰒲", "class":"Quiet"}'
			;;
	esac
}


PROFILES='net.hadess.PowerProfiles'
BAL=''
QUIET=''



dbus-monitor --system "type=signal,interface=org.freedesktop.DBus.Properties,member=PropertiesChanged,path=/net/hadess/PowerProfiles" | while read -r line; do
	_get_icon
done
