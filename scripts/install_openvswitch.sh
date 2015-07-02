#!/bin/bash

OPENVSWITCH='openvswitch-2.3.2'

sudo yum -y install wget openssl-devel gcc make python-devel openssl-devel kernel-devel graphviz kernel-debug-devel autoconf automake rpm-build redhat-rpm-config libtool

mkdir -p ~/rpmbuild/SOURCES
wget http://openvswitch.org/releases/$OPENVSWITCH.tar.gz
cp $OPENVSWITCH.tar.gz ~/rpmbuild/SOURCES/
tar xfz $OPENVSWITCH.tar.gz
sed 's/openvswitch-kmod, //g' $OPENVSWITCH/rhel/openvswitch.spec > $OPENVSWITCH/rhel/openvswitch_no_kmod.spec
rpmbuild -bb --nocheck ~/$OPENVSWITCH/rhel/openvswitch_no_kmod.spec
sudo yum -y localinstall /home/$USER/rpmbuild/RPMS/x86_64/$OPENVSWITCH-1.x86_64.rpm
