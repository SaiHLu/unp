#!/bin/bash
apt -y update
apt -y upgrade
apt -y install nginx
apt -y install software-properties-common
add-apt-repository -y ppa:ondrej/php
apt -y install php8.1-fpm
apt -y install php8.1-common php8.1-bcmath php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip php8.1-curl
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/bin --filename=composer
cd -