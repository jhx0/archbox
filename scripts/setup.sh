#!/bin/sh

pacman -Syyu --noconfirm
pacman -S --noconfirm - < /packages.list
pacman -Runc --noconfirm xfce4-power-manager
pacman -Scc --noconfirm

# generate host keys for sshd
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

mv /sshd_config /etc/ssh/sshd_config
mv /pacman.conf /etc/pacman.conf

chown root:root /usr/bin/run.sh
chmod 755 /usr/bin/run.sh

useradd -m -s /bin/bash archbox
echo -e "archbox\narchbox" | passwd archbox

mkdir -p /etc/sudoers.d
echo "archbox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/archbox