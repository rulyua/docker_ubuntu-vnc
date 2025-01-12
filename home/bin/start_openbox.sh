#!/bin/bash
echo "plank&openbox&xsetroot -solid darkgreen&xmodmap ~/.Xmodmap;tail -f ~/bin/xinitrc">/home/ubuntu/bin/xinitrc;
pkill -u ubuntu
