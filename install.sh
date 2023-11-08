#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt -y update
apt -y upgrade

apt -y install ca-certificates curl gnupg

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

mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt -y update
apt -y install nodejs

unset DEBIAN_FRONTEND
