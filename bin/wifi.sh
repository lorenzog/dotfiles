#!/bin/sh
. ~/.functions
#amiroot || die "Must be root"

test -n "$1" || die "Must supply a configuration file"
test -r "$1" || die "Configuration file '$1' not found"
sudo pkill wpa_supplicant
sudo dhclient -r wlan0
sudo wpa_supplicant -Dnl80211 -i wlan0 -c "$1" -B || die "Error in wpa_supplicant"
sudo dhclient wlan0 || die "Can't dhclient"
say "Connected to wifi"
