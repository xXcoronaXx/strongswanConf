#!/bin/bash

###################
# network Gateway #
###################

[ -f ifcfg-eth1 ] || exit 0

echo 'Configurando eth1 de equipo Gateway...'

cp -f ifcfg-eth1 /etc/sysconfig/network-scripts/ifcfg-eth1

echo 'eth1 configurado!'

service network restart
ifdown eth0
ifdown eth1
ifup eth1
ifup eth0
echo ' Network ready!'