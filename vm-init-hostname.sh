#!/bin/sh
if [[ ! $VM_SUDOPASS ]]; then
	echo VM_SUDOPASS not set	
	exit 2
fi

if [[ ! $VM_HOSTNAME ]]; then
	echo VM_HOSTNAME not set
	exit 3
fi

echo $VM_SUDOPASS | sudo --stdin echo $'\n'changing hostname from: $HOSTNAME to: $VM_HOSTNAME
sudo hostname ${VM_HOSTNAME}
sudo sed -i "s/piglet-ami/${VM_HOSTNAME}/g" /etc/hostname
sudo sed -i "s/piglet-ami/${VM_HOSTNAME}/g" /etc/hosts
echo rebooting so hostname takes effect
sudo reboot
