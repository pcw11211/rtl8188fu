#!/bin/bash

echo "First we need to compile the driver"
echo "Script will run \"make\" command"
#echo "Press any key to continue"

read -rsn1 -p"Press any key to continue..."

make clean
make

if [ ! -f rtl8188fu.ko ]; then 
  echo "Something went wrong"
  exit 1
fi

echo "Now script will install the driver"
echo "executing: \"install -p -m 644 rtl8188fu.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless/realtek\""
echo "executing: \"cp firmware/rtl8188fufw.bin /lib/firmware\""
read -rsn1 -p"Press any key to continue..."

install -p -m 644 rtl8188fu.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless/realtek
cp firmware/rtl8188fufw.bin /lib/firmware

echo "Now creating blacklist for r8188eu"
echo "and"
echo "Modprobe config for rtl8188fu"



echo 'alias usb:v0BDApF179d*dc*dsc*dp*icFFiscFFipFFin* rtl8188fu' | sudo tee /etc/modprobe.d/r8188eu-blacklist.conf
echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf
