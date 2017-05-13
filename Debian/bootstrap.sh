#!/usr/bin/env bash
set -e
set -u
set -x

exit_trap() {
	exit_code=$?
	if [ "$exit_code" != "0" ]; then
		echo "$0: line $1: exit code $exit_code"
	fi
}
trap 'exit_trap $LINENO' EXIT

printf "hello $(hostname)!\n"

## create user cohadar
useradd -m -s /bin/bash -p '$6$.Ig2q1Lw$mZIft1YFD3WZCfcZxgV/bJ5Snb4IXHYIQUYaoxlGbc2WU/7.vTaJ8D3p2lGtOl3z5aPBX.3609heAT3RR8mHS/' cohadar

## nopass sudo for cohadar
echo 'cohadar ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/cohadar

## copy uploaded user files
cp /home/vagrant/.gitconfig /home/cohadar/.gitconfig
cp /home/vagrant/.bash_profile /home/cohadar/.bash_profile
chown cohadar:cohadar /home/cohadar/*
