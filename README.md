## Script to install nginx and php on ubuntu

| Name | Version |
| ----------- | ----------- |
| php | ^8.4 |
| nginx | latest |
| composer | latest |
| nodejs | latest |
| MySQL | latest |
| redis | latest |


### Requirement
```
ubuntu >= 24.04
```

### Installation
```bash
bash <(curl -s https://raw.githubusercontent.com/PyaeSoneAungRgn/unp/main/install.sh)
```

### Optional

#### Generate ssh key

```bash
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
```

#### Update root password

```bash
sudo mysql
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

#### Laravel folder permission

```bash
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache
```

#### OPCache
Edit php-fpm/php.ini
```txt
opcache.enable=1
opcache.validate_timestamps=0
opcache.save_comments=0
```

#### Setup Supervisor
```bash
sudo apt-get install supervisor
cd /etc/supervisor/conf.d
vim laravel-queue.conf (can be any name with .conf extension)
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-queue:*
```

##### Example Queue Configuration
```txt
[program:laravel-queue]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/laravel-project/artisan queue:work redis --sleep=3 --tries=3 # 'redis', 'database', 'sqs'
autostart=true
autorestart=true
user=root #your system user
numprocs=2
redirect_stderr=true
stdout_logfile=/var/www/laravel-project/worker.log
stopwaitsecs=3600
```

```bash
sudo systemctl list-units --type=service | grep -i php # list the services
sudo systemctl restart php8.4-fpm.service # restart the service
```
