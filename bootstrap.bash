#!/usr/bin/env bash

OPENWRT_VERSION="15.05"
#OPENWRT_VERSION=""

OPENWRT_SUBDIR="/$OPENWRT_VERSION"
if [ "x$OPENWRT_BRANCH" -eq "x" ]
then
	OPENWRT_BRANCH=""
else
	OPENWRT_BRANCH=";for-$OPENWRT_VERSION"
fi

apt-get update
apt-get install -y g++ git subversion zlib1g-dev libncurses5-dev unzip libssl-dev
su - vagrant
git clone git://git.openwrt.org$OPENWRT_SUBDIR/openwrt.git /home/vagrant/openwrt
mv /home/vagrant/openwrt/feeds.conf{.default,}
echo "src-git wiomw https://github.com/whoisonmywifi/wiomw-openwrt-feed.git$OPENWRT_BRANCH" >> /home/vagrant/openwrt/feeds.conf
/home/vagrant/openwrt/scripts/feeds update
/home/vagrant/openwrt/scripts/feeds install -a
cd /home/vagrant/openwrt && make clean && cd
chown -R vagrant:vagrant /home/vagrant/openwrt
exit

