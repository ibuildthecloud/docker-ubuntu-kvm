#!/bin/bash
set -e -x

mknod kvm c 10 232
apt-get update
apt-get install -y kvm
apt-get clean
rm /ubuntu-kvm.sh
