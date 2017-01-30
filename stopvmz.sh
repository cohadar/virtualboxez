#!/bin/sh
set -u

# example:
# cat names.txt | xargs ./stopvmz.sh

host=${HOSTNAME%.local}

# we use ssh+shutdown instead of VBoxManage to let os shutdown gracefully.
for arg in "$@"; do
	ssh ${host}-${arg}.local "cat ${VM_SUDOPASS} | sudo --stdin shutdown"
done
