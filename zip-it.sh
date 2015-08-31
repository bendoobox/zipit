#/bin/bash

# reset inittab
cp -v ./root/etc/inittab /etc/inittab
cp -v ./root/etc/profile.d/raspi-config.sh /etc/profile.d/raspi-config.sh

# get latest raspi-config
wget -O ./root/usr/bin/raspi-config https://raw.githubusercontent.com/bendoobox/raspi-config/master/raspi-config 
cp -v ./root/usr/bin/raspi-config /usr/bin/raspi-config

# disable lightdm from boot
update-rc.d lightdm disable 2

# tar all disk contents to tar file
sudo tar -cvpf root.tar /* --exclude=proc/* --exclude=sys/* --exclude=dev/pts/* --exclude=var/cache/* --exclude=var/swap --exclude=home/pi/.bootstrap/*

# tar all boot contents to tar file
sudo tar -cvpf boot.tar /boot/*

# disable lightdm from boot
update-rc.d lightdm enable 2

# xzip it
echo "Now scp the file and xzip the file: xz -1 -k -e -v root.tar;xz -1 -k -e -v boot.tar"
