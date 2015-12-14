#!/bin/bash

###################
# install Gateway #
###################

[ -f ipsec.conf ] || exit 0
[ -f ipsec.secrets ] || exit 0
[ -f strongswan.conf ] || exit 0

echo ' Descargando strongswan...'
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/s/strongswan-5.3.2-1.el7.x86_64.rpm

echo ' Instalando strongswan...'
rpm -i strongswan-5.3.2-1.el7.x86_64.rpm

echo ' Configurando...'
cp -f ipsec.conf /etc/strongswan/ipsec.conf
cp -f ipsec.secrets /etc/strongswan/ipsec.secrets
cp -f strongswan.conf /etc/strongswan/strongswan.conf

echo '  Strongswan instalado y configurado!'