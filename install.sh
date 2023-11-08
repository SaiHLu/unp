#!/bin/bash

apt -y update
apt upgrade --assume-yes

apt -y install curl

apt -y install nginx

apt -y install software-properties-common
add-apt-repository -y ppa:ondrej/php
apt -y install php8.2-fpm
apt -y install php8.2-common php8.2-bcmath php8.2-mbstring php8.2-mysql php8.2-xml php8.2-zip php8.2-curl php8.2-gd

cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/bin --filename=composer
cd -

apt -y install mysql-server
systemctl start mysql.service

cd ~
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt -y install nodejs
cd -

