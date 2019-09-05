#!/bin/bash
set -o errexit
find /home/amresh/Documents/test -name '*' -mmin +3  -delete
touch /home/amresh/Documents/test/hello_$(date +%d%m%Y_%H%M%S)

