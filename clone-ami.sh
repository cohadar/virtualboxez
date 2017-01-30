#!/bin/sh

# example:
# cat names.txt | xargs -n 1 ./clone-ami.sh 

host=${HOSTNAME%.local}

VBoxManage clonevm ${host}-ami --name ${host}-$1
