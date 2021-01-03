apt update -y
apt upgrade -y
apt install nginx -y
apt install php-fpm -y
apt install php7.4-common php7.4-bcmath php7.4-json php7.4-mbstring php7.4-mysql php7.4-xml php7.4-zip php7.4-curl -y
apt install nodejs -y
apt install npm -y
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer