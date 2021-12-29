echo "Setting all up"
apt-get update && apt-get upgrade -y

sleep 2

echo "Cloning into repository"
wget https://github.com/Antoniovbn000/unix-pterodactyl-theme/blob/main/pterodactyl.zip

sleep 2

echo "Installing tools..."
apt update
apt-get install unzip -y

sleep 2

echo "Settings it up"
unzip pterodactyl.zip
cd pterodactyl

sleep 2

echo "1 more minute"
cp -r * /var/www/pterodactyl
cd /var/www/pterodactyl

sleep 2

echo "Building the panel"
php artisan migrate --path=/database/migrations/2021_05_30_141248_create_unix_settings_table.php
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install -y nodejs
npm i -g yarn
yarn
cd /var/www/pterodactyl
yarn build:production


sleep 2

echo "Finishing it up"
php artisan view:clear
php artisan config:clear

sleep 2

echo "Everything is done"