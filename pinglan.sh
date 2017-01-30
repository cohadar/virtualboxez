#!/bin/sh

pingasync() { 
	ping -t 5 192.168.0.$1
};

for i in {1..254}; do
	pingasync $i &
done
