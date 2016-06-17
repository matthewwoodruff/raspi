#! /bin/bash

image=$1

set -xe

diskutil list

read -p "Enter disk num to format: /dev/disk<num>: " diskNum

diskutil unmountDisk /dev/disk${diskNum}
diskutil eraseDisk FAT32 UNTITLED /dev/disk${diskNum}
diskutil unmountDisk /dev/disk${diskNum}
sudo dd bs=1m if=${image} of=/dev/rdisk${diskNum}

