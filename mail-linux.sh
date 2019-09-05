#!/bin/bash
yum update -y

yum remove sendmail -y
yum install postfix -y
yum install cyrus-sasl-plain -y
yum install mailx -y

alternatives --set mta /usr/sbin/postfix

CA_FILE="/etc/ssl/certs/ca-bundle.crt"

# set variable values
EMAIL_SERVER_URL="email-smtp.us-east-1.amazonaws.com"
EMAIL_SERVER_PORT="25"
SMTP_USERNAME="AKIA3MDPWOFVWKEE22FK"
SMTP_PASSWORD="BBSs2kYfNiI8Se178QA73OqB+fTje6qdpV5N00HxOYZG"

echo "
relayhost = [${EMAIL_SERVER_URL}]:${EMAIL_SERVER_PORT}
smtp_tls_note_starttls_offer = yes
smtp_tls_security_level = encrypt
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_auth_enable = yes
smtp_use_tls = yes
smtp_tls_CAfile = ${CA_FILE}" >> /etc/postfix/main.cf

echo "[${EMAIL_SERVER_URL}]:${EMAIL_SERVER_PORT} ${SMTP_USERNAME}:${SMTP_PASSWORD}" > /etc/postfix/sasl_passwd

postmap hash:/etc/postfix/sasl_passwd
chown root:root /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
postfix stop
postfix start

#echo "Hello Nikhil,
#PFA.
#This is an auto generated email
#Contact: saeed.khan@coditas.com in case of any issue" | mailx -r "Saeed Khan <saeed.khan@coditas.com>" -a /home/file-name.ovpn -s "Write Subject Here" receiver-email@coditas.com
