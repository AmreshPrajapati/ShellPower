#!/bin/bash
set -o errexit
set -v
set -x
read -p "Enter Name:-	     " name
read -p "Enter IP Address:-   " ip
declare -l name
name=$name
n=$(echo $name | tr ' ' '.')
echo "$name
    IP Address      : $ip
    Subnetmask      : 255.255.0.0/16
    Default gateway : 192.168.1.10
    Primary DNS     : 192.168.1.21
    Secondary DNS   : 192.168.1.10
    Email Address   : $n@coditas.com
---------------------------------------------
    Sophos Credentials
    Username        : $n
    Password        : admin"
email=$(printf "
    $name
    IP Address	       : $ip
    Subnetmask       : 255.255.0.0/16
    Default gateway : 192.168.1.10
    Primary DNS      : 192.168.1.21
    Secondary DNS : 192.168.1.10
    Email Address    : $n@coditas.com
---------------------------------------------
    Sophos Credentials
    Username        : $n
    Password        : admin")
echo $email
printf "Subject: Internet Credentials\n\n$email" | ssmtp amresh.aaa@gmail.com
