#!/bin/sh
set -u

# example:
# cat ipz.txt | xargs ./sethostnamez.sh

host=${HOSTNAME%.local}

for arg in "$@"; do
    ssh ${arg} "ifconfig"
done
