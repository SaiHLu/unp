#!/bin/bash

apt -y update
apt -y upgrade
apt -y install nginx
apt -y install software-properties-common
add-apt-repository -y ppa:ondrej/php
apt -y install php8.0-fpm
apt -y install php8.0-common php8.0-bcmath php8.0-json php8.0-mbstring php8.0-mysql php8.0-xml php8.0-zip php8.0-curl
curl -sL https://deb.nodesource.com/setup_14.x | -E bash -
apt -y install nodejs
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/bin --filename=composer
cd -