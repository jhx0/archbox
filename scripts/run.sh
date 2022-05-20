#!/bin/sh

# Set your desired VNC resolution here
RESOLUTION='1920x1080'

Xvfb :3 -screen 0 ${RESOLUTION}x16 &

sudo /usr/sbin/sshd &

DISPLAY=:3 dbus-launch /usr/sbin/startxfce4 &

x11vnc -display :3 -forever &

wait $!
