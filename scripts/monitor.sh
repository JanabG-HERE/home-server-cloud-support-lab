#!/bin/bash

# Check if Nextcloud is running
if ! docker ps | grep -q nextcloud; then
  echo "Nextcloud container is down! Attempting restart..." >> /var/log/home-lab-monitor.log
  docker restart nextcloud
fi
