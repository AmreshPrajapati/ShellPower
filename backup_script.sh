#!/bin/bash
set -o errexit
mysqldump -u genome -pgenome@123 GenomeSmartStripe > /home/ubuntu/db_backup/genomePay_db_backup_$(date +%d%m%Y).sql
mongodump -d genomesmart-backend -o /home/ubuntu/db_backup/genomesmart_backend_$(date +%d%m%Y)
mongodump -d genomebrain -o /home/ubuntu/db_backup/genomebrain_$(date +%d%m%Y)
find /home/ubuntu/db_backup/ -name '*' -mtime +3 -exec rm -r {} \;

