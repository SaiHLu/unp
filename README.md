## Script to install nginx and php on ubuntu

| Name | Version |
| ----------- | ----------- |
| php | ^8.2 |
| nginx | latest |
| composer | latest |
| nodejs | latest |
| MySQL | latest |
| redis | latest |


### Requirement
```
ubuntu >= 22.04
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
