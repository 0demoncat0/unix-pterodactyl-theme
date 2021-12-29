#!/bin/bash
echo "Setting all up"
apt-get update && apt-get upgrade -y
echo "Installing tools..."
apt update
apt-get install unzip -y
echo "Settings it up"
unzip pterodactyl.zip
mv * /root
cd
mv -r * /var/www/pterodactyl
cd /var/www/pterodactyl
echo "Building the panel"
php artisan migrate --path=/database/migrations/2021_05_30_141248_create_unix_settings_table.php
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install -y nodejs
npm i -g yarn
yarn
cd /var/www/pterodactyl
yarn build:production
echo "Finishing it up"
php artisan view:clear
php artisan config:clear
echo "Everything is done"
