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

### Caddy

apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
apt update
apt install caddy


scp -i ~/.ssh/id_ed25519.apparatus Caddyfile root@event-apparatus.de:/etc/caddy/
caddy fmt --overwrite


### user

adduser apparatus
apt install git


runuser -l apparatus -c 'git clone https://github.com/akleber/apparatus.git'
