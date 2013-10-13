#!/bin/bash
set -e -x

apt-get update
apt-get install -y kvm
apt-get clean
mknod /dev/kvm c 10 232
chmod 660 /dev/kvm
chown root:kvm /dev/kvm
rm /ubuntu-kvm.sh
