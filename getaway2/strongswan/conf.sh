#!/bin/bash

#######################
# configure Gateway 2 #
#######################

[ -f ipsec.conf ] || exit 0
[ -f ipsec.secrets ] || exit 0
[ -f strongswan.conf ] || exit 0

strongswan stop

echo ' Configurando...'
cp -f ipsec.conf /etc/strongswan/ipsec.conf
cp -f ipsec.secrets /etc/strongswan/ipsec.secrets
cp -f strongswan.conf /etc/strongswan/strongswan.conf

echo '  Strongswan configurado!'