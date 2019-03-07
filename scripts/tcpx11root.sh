#!/bin/sh
sudo tcpdump | root-tail -g 1045x800+75+50 -fn fixed -,green /var/log/Xorg.0.log,red,ALERT >/dev/null 2>&1 &
