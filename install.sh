echo "Setting all up"
apt-get update && apt-get upgrade -y
sleep 2
echo "Giving permissions"
chmod 777 pterodactyl.zip
chmod 777 install.sh
sleep 2
echo "Installing tools..."
apt update
apt-get install unzip -y
sleep 2
echo "Settings it up"
cp pterodactyl.zip /var/www/pterodactyl
unzip -r pterodactyl.zip
cd 
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