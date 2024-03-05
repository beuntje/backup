# Backup installer

This script will mount nas and install backup script

## Install
To run this script on your device, first make sure you've got git installed:
```
sudo apt-get install git
```

Then download this repo:
```
git clone https://github.com/beuntje/backup 
```

Make the installer executable:
```
chmod +x backup/setup.sh
```

Finally, run the installer:
```
backup/setup.sh IP USERNAME PASSWORD
```
