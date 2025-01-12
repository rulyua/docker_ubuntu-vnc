#!/bin/bash
if [ ! -f /usr/bin/mate-session ]; then
	xfce4-terminal -e "sudo apt install  --no-install-recommends mate-desktop-environment"
fi

echo "mate-session;xmodmap ~/.Xmodmap;tail -f ~/bin/xinitrc">/home/ubuntu/bin/xinitrc;
pkill -u ubuntu
