#!/usr/bin/env bash

# get package name
if [ $# -eq 0 ]
then
	echo 'package name ?'
	read $pkgname
else
	pkgname=$1
fi


# download package and uncompress
cd /tmp
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$pkgname.tar.gz
tar zxvf $pkgname.tar.gz
cd $pkgname


# install package
makepkg -s
ls -al
echo $pkgname*.pkg.tar.xz
sudo pacman -U --noconfirm $pkgname*.pkg.tar.xz
