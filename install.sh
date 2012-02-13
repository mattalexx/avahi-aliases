#!/bin/sh

if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

SCRIPT_PATH=${0%/*}
. $SCRIPT_PATH/lib/coloured_messages.sh

message "Install Avahi Aliases Manager" "header"
for file in `ls ./package/*`;do
	message "${file}"
	chmod 777 ${file}
	chmod +x ${file}
	chown root:root ${file}
	cp ${file} /usr/bin/
done

message "Making avahi-aliases list directory" "header"
message "Use this directory to place individual lists of avahi-aliases."
mkdir /etc/avahi/aliases.d/

message "Making central avahi-aliases file" "header"
touch /etc/avahi/aliases

message "Installation of Avahi-Aliases Done" "success"

