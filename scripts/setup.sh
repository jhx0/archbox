#!/bin/sh

# setting up keys
pacman-key --init
pacman-key --populate
# upgrading system
pacman -Syyu --noconfirm
# installing packages
pacman -S --noconfirm - < /packages.list
# remove xfce4-power-manager
pacman -Runc --noconfirm xfce4-power-manager
# clear package cache
pacman -Scc --noconfirm

# generate host keys for sshd
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

# copy configs over
mv /sshd_config /etc/ssh/sshd_config
mv /pacman.conf /etc/pacman.conf

chown root:root /usr/bin/run.sh
chmod 755 /usr/bin/run.sh

# default user: archbox/archbox
useradd -m -s /bin/bash archbox
echo -e "archbox\narchbox" | passwd archbox

# allow archbox to run sudo without entering
# a password
mkdir -p /etc/sudoers.d
echo "archbox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/archbox