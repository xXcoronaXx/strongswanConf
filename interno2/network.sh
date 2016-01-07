#!/bin/bash

#####################
# network interno 2 #
#####################

[ -f ifcfg-eth1 ] || exit 0

echo 'Configurando eth1 de equipo interno...'

cp -f ifcfg-eth1 /etc/sysconfig/network-scripts/ifcfg-eth1

echo 'eth1 configurado!'

service network restart
ifdown eth0
echo 'eth0 down!'
ifup eth1
echo ' eth1 up!!'