if [ ! -f /usr/bin/startplasma-x11 ]; then
	xfce4-terminal -e "sudo apt install --no-install-recommends systemsettings kde-plasma-desktop kwin-x11 plasma-discover"
fi

echo 'dbus-launch;export $(dbus-launch);plasma_session &tail -f ~/bin/xinitrc'>/home/ubuntu/bin/xinitrc;
pkill -u ubuntu
