echo "Updating and upgrading"
apt-get update && apt-get upgrade -y

sleep 2

echo "Cloning into repository"

git clone https://github.com/Antoniovbn000/Unix-pterodactyl-theme.git
cd Unix-pterodactyl-theme

sleep 2

ls

sleep 3

echo "Installing tools please wait..."
apt install unzip -y
apt update

sleep 2

echo "Setting it up"
unzip pterodactyl.zip
cd pterodactyl

echo "1 more minute"
cp -r * /var/www/pterodactyl
cd /var/www/pterodactyl
php artisan migrate --path=/database/migrations/2021_05_30_141248_create_unix_settings_table.php
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install -y nodejs
npm i -g yarn
yarn
cd /var/www/pterodactyl
yarn build:production
php artisan view:clear
php artisan config:clear

sleep 2

echo "Everything is done"