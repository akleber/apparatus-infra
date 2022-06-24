# apparatus-infra

## Server settings


### pubkey login only

/etc/ssh/sshd_config

PermitRootLogin prohibit-password
PasswordAuthentication no

### set hostname

hostnamectl set-hostname apparatus

### additional packages

apt install htop

