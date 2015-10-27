# openwrt-vagrant
Vagrant definition for a box that is ready to compile OpenWRT

Note
----
If you are using an older version of Vagrant (such as 1.4.3, which is the version in the Ubuntu 14.07 repos), you will need to explicitly retrieve the ubuntu/trusty64 box by running
```
vagrant box add ubuntu/trusty64 https://vagrantcloud.com/ubuntu/trusty64/version/20150609.0.10/provider/virtualbox.box
```
Be sure to use the URL for the current version of the base box.

Usage
-----
From the host machine, run:
```
vagrant up
vagrant ssh
```

Now inside the virtual machine, you will probably want to run:
```
cd /vagrant/openwrt
make menuconfig
make
cp -r bin /vagrant/openwrt-binaries-$(date +%s)
```

At this point, it is safe to destroy the virtual machine because the final images will be left in openwrt-binaries-*unix time*/*arch*/openwrt-*firmware-info*.bin
```
vagrant destroy
```

Bugs
----
Please send any bug reports to [the github issues page](https://github.com/whoisonmywifi/openwrt-vagrant/issues).

