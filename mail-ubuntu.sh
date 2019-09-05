#!/bin/bash
apt-get update -y

echo "postfix postfix/mailname string $(hostname)" | debconf-set-selections
        echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

CA_FILE="/etc/ssl/certs/ca-certificates.crt"

apt-get remove sendmail -y
apt-get install postfix -y
apt-get install sasl2-bin -y
apt-get install s-nail -y

awk '!/relayhost/' /etc/postfix/main.cf > temp && mv temp /etc/postfix/main.cf

# set variable values
EMAIL_SERVER_URL="email-smtp.us-east-1.amazonaws.com"
EMAIL_SERVER_PORT="25"
SMTP_USERNAME="AKIAQ6ANXRU5B53KG6CO"
SMTP_PASSWORD="BN0U9DO78Ui11cryhCFrC+0juXdAFMvss43bKXFjsnuI"

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

echo "Hello Nikhil,
PFA.
This is an auto generated email
Contact: saeed.khan@coditas.com in case of any issue" | s-nail -r "amresh.kumar@coditas.com" -s "Write Subject Here" nikhil.tidke@coditas.com
