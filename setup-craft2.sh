#!/bin/bash

# Check if .env file exists
if [ -e .env ]; then
    source .env
else
    echo "Please set up your .env file before starting your enviornment."
    exit 1
fi

# Make directory if it does not exist.
mkdir -p $APACHE_BASE_PATH

# Change Working directory
cd $APACHE_BASE_PATH

# Download the latest version of Craft 3
wget https://craftcms.com/latest-v2.zip

# Unzip latest-v3.zip
unzip latest-v2.zip

# Remove Zip
rm latest-v2.zip

# Modified htaccess
mv ./public/htaccess ./public/.htaccess

# Change Working directory
cd ./craft/config

# Modified db.php
sed -i "" "s:'server' => 'localhost':'server' => '"$CONTAINER_BASE_NAME"-db':g" db.php
sed -i "" "s:'user' => 'root':'user' => '"$MYSQL_USER"':g" db.php
sed -i "" "s:'password' => '':'password' => '"$MYSQL_PASSWORD"':g" db.php
sed -i "" "s:'database' => '':'database' => '"$MYSQL_DATABASE"':g" db.php
sed -i "" "s:'tablePrefix' => 'craft':'tablePrefix' => '"${CRAFT_DB_TABLE_PREFIX}"':g" db.php

exit 0
