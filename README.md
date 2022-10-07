For Kernel 4.15.x ~ 5.17.x (Linux Mint, Ubuntu or Debian Derivatives)

------------------

## How to install (for arm devices)

`ln -s /lib/modules/$(uname -r)/build/arch/arm /lib/modules/$(uname -r)/build/arch/armv7l`
or
`ln -s /lib/modules/$(uname -r)/build/arch/arm /lib/modules/$(uname -r)/build/arch/armv6`

`apt-get install build-essential git dkms linux-headers-$(uname -r)`

`git clone https://github.com/pcw11211/rtl8188fu`

`cd ./rtl8188fu`

`make rtl8188fu`

`install -p -m 644 rtl8188fu.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless/realtek`

`sudo cp firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/`

------------------

## Configuration

#### Disable Power Management

Run following commands for disable power management and plugging/replugging issues.

`sudo touch /etc/modprobe.d/rtl8188fu.conf`

`echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf`

#### Blacklist for kernel 5.15 and newer (No needed for kernel 5.17 and up)

If you are using kernel 5.15 and newer, you must create a configuration file with following commands for preventing to conflict rtl8188fu module with built-in r8188eu module.

`echo 'alias usb:v0BDApF179d*dc*dsc*dp*icFFiscFFipFFin* rtl8188fu' | sudo tee /etc/modprobe.d/r8188eu-blacklist.conf`

#### Disable MAC Address Spoofing

Run following commands for disabling MAC Address Spoofing (Note: This is not needed on Ubuntu based distributions. MAC Address Spoofing is already disable on Ubuntu base).

`sudo mkdir -p /etc/NetworkManager/conf.d/`

`sudo touch /etc/NetworkManager/conf.d/disable-random-mac.conf`

`echo -e "[device]\nwifi.scan-rand-mac-address=no" | sudo tee /etc/NetworkManager/conf.d/disable-random-mac.conf`


------------------

## How to uninstall

`sudo dkms remove rtl8188fu/1.0 --all`

`sudo rm -f /lib/firmware/rtlwifi/rtl8188fufw.bin`

`sudo rm -f /etc/modprobe.d/rtl8188fu.conf`


