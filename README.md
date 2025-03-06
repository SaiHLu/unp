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

```txt
opcache.enable=1
opcache.validate_timestamps=0
opcache.save_comments=0
```
