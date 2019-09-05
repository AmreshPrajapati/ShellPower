#!/bin/bash
cd /etc/openvpn/easy-rsa/
source ./vars
EMAIL=$1
export KEY_EMAIL=${EMAIL}
NAME="${EMAIL::-12}"
CERTNAME="gcp."${NAME}
(echo -en "\n\n\n\n\n\n\n\n"; sleep 1; echo -en "\n"; sleep 1; echo -en "\n"; sleep 3; echo -en "y"; echo -en "\n"; sleep 3; echo -en "y"; echo -en "\n") | ./build-key ${CERTNAME}
cd /root/openvpn-clients/
./create-client-config.sh ${CERTNAME}
echo "Hello ${NAME},
PFA.
This is an auto generated email
Contact: varun.elavia@coditas.com in case of any issue" | s-nail -r "Varun Elavia <varun.elavia@coditas.com>" -a /root/openvpn-clients/${CERTNAME}.ovpn -s "New VPN Certificate for GCP" ${EMAIL}
