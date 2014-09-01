spoof.sh
========

Basic MAC address spoofing script for Arch Linux.

Should also work on other systems, but Arch Linux uses different default names for its network devices.

Requires `openssl` for randomness and `sudo`.

Usage
-----

`$ ./spoof.sh`

Generate a random MAC address and assign it to the default device (`wlp7s0`).

`$ ./spoof.sh -i wlan -a dead:beef:face:b00c:cafe:babe -c`

Set the MAC address of `wlan` to `dead:beef:face:b00c:cafe:babe` and do not color the output.

`$ ./spoof.sh -h`

Output command usage.
