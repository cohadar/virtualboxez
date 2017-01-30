#!/bin/sh

#TODO: make more modular 

scp -r ~/.aws piglet-alfa.local:~/.aws
scp -r ~/.mighty piglet-alfa.local:~/.mighty
scp -r ~/.git piglet-alfa.local:~/.git
scp ~/.gitignore piglet-alfa.local:~/.gitignore
scp ~/.bash_profile piglet-alfa.local:~/.bash_profile
