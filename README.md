docker-ubuntu-kvm
==============

Scripts used to create ibuildthecloud/ubuntu-kvm.  Since at the this script
was written Docker did not allow mknod or -privileged=true for "docker build,"
this script is written as a run and commit.

Usage
=====

For KVM

    docker run -privileged -i -t ibuildthecloud/ubuntu-kvm kvm ..

For QEMU

    docker run -i -t ibuildthecloud/ubuntu-kvm kvm ..


Example: Running Tiny Core
=========================

    wget http://distro.ibiblio.org/tinycorelinux/5.x/x86/release/Core-current.iso
    docker run -i -t -privileged=true -v $(pwd):$(pwd) ibuildthecloud/ubuntu-kvm kvm -cdrom $(readlink -f Core-current.iso) -curses

Run ```sudo poweroff``` in tinycore to exit
