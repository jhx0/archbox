#!/bin/sh

RESOLUTION='1366x768'

Xvfb :3 -screen 0 ${RESOLUTION}x16 &

sudo /usr/sbin/sshd &

DISPLAY=:3 dbus-launch /usr/sbin/startxfce4 &

x11vnc -display :3 -forever &

wait $!
