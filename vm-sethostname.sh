#!/bin/sh
set -u

host=`cat /etc/hostname`

echo $VM_SUDOPASS | sudo --stdin echo $'\n'changing hostname from: $host to: $VM_HOSTNAME
sudo hostname ${VM_HOSTNAME}
sudo sed -i "s/${host}/${VM_HOSTNAME}/g" /etc/hostname
sudo sed -i "s/${host}/${VM_HOSTNAME}/g" /etc/hosts
echo rebooting so hostname takes effect
sudo reboot
