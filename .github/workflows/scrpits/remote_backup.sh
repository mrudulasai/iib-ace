#!/bin/bash

# Load properties from the config file
source remote_backup.properties

# SSH into the remote server and run the backup command
ssh -t ${REMOTE_USER}@${REMOTE_HOST} << EOF
  sudo su - mqm
  mqsibackupbroker $BROKER_NAME -a $BACKUP_FILE -d $BACKUP_DIR
EOF

echo "Backup process completed."
