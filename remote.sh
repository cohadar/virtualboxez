#!/bin/sh

if [[ ! $VM_SUDOPASS ]]; then
	echo remote.sh: VM_SUDOPASS not set
	exit 2
fi

if [[ ! $VM_HOSTNAME ]]; then
	echo remote.sh: VM_HOSTNAME not set
	exit 3
fi

if [[ ! $1 ]]; then
	echo which vm- script do you want to run?
	exit 4
fi

# if you are running vm-init-hostname.sh make sure VM_URL is set
if [ $1 == "vm-init-hostname.sh" ]; then
	if [[ ! $VM_URL ]]; then
		echo remote.sh: VM_URL not set
		exit 5
	fi	
fi

if [[ $VM_URL ]]; then
	ssh $VM_URL "env VM_SUDOPASS=${VM_SUDOPASS} VM_HOSTNAME=${VM_HOSTNAME} bash -s" < $1
else
	ssh ${VM_HOSTNAME}.local "env VM_SUDOPASS=${VM_SUDOPASS} VM_HOSTNAME=${VM_HOSTNAME} bash -s" < $1
fi
