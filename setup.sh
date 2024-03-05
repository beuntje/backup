#!/bin/bash

BASEDIR=$(pwd)

if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ]; then
  echo "USAGE: "
  echo "setup.sh IP USERNAME PASSWORD"
  exit
fi

IP=$1
USERNAME=$2
PASSWORD=$3

# ADD MOUNT FOLDER
FOLDER="/mnt/backup"
FOLDER="/home/benedikt/web/woodwing/temp/test"
if [ ! -d "$FOLDER" ]; then
  sudo mkdir "$FOLDER"
  echo "Folder $FOLDER did not exist. "
fi

# MOUNT NAS
FSTABFILE="/etc/fstab"
FSTABFILE="/home/benedikt/web/woodwing/temp/test/fstab.txt"
if [ ! -n "$(grep -P "[[:space:]]/mnt/backup/[[:space:]]" $FSTABFILE)" ]; then
  sudo printf "\n//$IP/backups  /mnt/backup/  cifs  user=$USERNAME,password=$PASSWORD,vers=1.0,_netdev,x-systemd.automount  0  0" | sudo tee -a "$FSTABFILE" >/dev/null
  echo "Mount added "
  mount -o remount -a
fi

# FURTHER SETUP
sh /mnt/backup/makebackup.sh

