#!/bin/sh

# example:
# cat names.txt | xargs ./clone-ami.sh 

host=${HOSTNAME%.local}

for arg in "$@"; do
    VBoxManage clonevm ${host}-ami --name ${host}-${arg}
done
