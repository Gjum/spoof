#!/bin/bash
# Yet another MAC address spoofing script.
# This one is written by Gjum.

interface=wlp7s0
address=`echo $RANDOM | openssl md5 | sed 's/\(..\)/\1:/g' | cut -b16-32`
c0="\e[0m"    # reset
c1="\e[1;94m" # from
c2="\e[1;92m" # to
c3="\e[1;96m" # interface

OPTIND=1
while getopts "a:i:ch" arg; do
case $arg in
	a) address=$OPTARG;;
	i) interface=$OPTARG;;
	c) c0=; c1=; c2=; c3= ;;
	h) echo "Usage: $(basename -- "$0") [-a address] [-i interface] [-c]"
		echo
		echo "-a address      The MAC address you want. Random by default."
		echo "-i interface    The interface to change the MAC address of."
		echo "-c              Do not color the output like a rainbow."
		echo
		exit 0;;
esac
done

oldaddr=`ip link show $interface|grep -oE '[0-9a-fA-F:]{17}'|grep -v ff:ff:ff:ff:ff:ff`
echo -e "From $c1$oldaddr$c0 to $c2$address$c0 on $c3$interface$c0"
sudo ip link set dev $interface down
sudo ip link set dev $interface address $address
#sudo macchanger -m $address $interface
sudo ip link set dev $interface up
newaddr=`ip link show $interface|grep -oE '[0-9a-fA-F:]{17}'|grep -v ff:ff:ff:ff:ff:ff`
echo -e "Your new MAC address is:  $c2$newaddr$c0"

