#!/usr/bin/bash

# Déclaration variable generiques
today=$(date +%Y-%m-%d)

destination_backup=/backup
vhost=/etc/apache2/sites-available

# Déclaration variable spécifiques
source $1

# Export DB
mysqldump -u $dblogin -p$dbpwd $dbname > $dbbackupfile

# Création archive
tar -czf $backup_file $vhost $website_files $dbbackupfile

# Clean export DB
rm $dbbackupfile
