#!/bin/sh
set -u

# example:
# cat names.txt | xargs ./startvmz.sh 

host=${HOSTNAME%.local}

for arg in "$@"; do
    VBoxManage startvm ${host}-${arg} --type headless
done
