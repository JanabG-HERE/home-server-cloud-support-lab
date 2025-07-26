#!/bin/bash

BACKUP_DIR="/home/amanps/backups/nextcloud"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p $BACKUP_DIR
rsync -a /var/lib/docker/volumes/home-server-cloud-support-lab_nextcloud_data/_data/ $BACKUP_DIR/nextcloud_backup_$TIMESTAMP

echo "Backup completed at $TIMESTAMP" >> $BACKUP_DIR/backup.log
