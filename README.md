# apparatus-infra

## Server settings

### pubkey login only

/etc/ssh/sshd_config

PermitRootLogin prohibit-password
PasswordAuthentication no

ssh -i ~/.ssh/id_ed25519.apparatus root@event-apparatus.de

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

### apparatus

adduser apparatus
apt install git python3-venv sqlite3

mkdir /opt/apparatus
cd /opt/apparatus

runuser apparatus -c 'git clone https://github.com/akleber/apparatus.git'
runuser apparatus -c 'python3 -m venv venv'
runuser apparatus -c 'source venv/bin/activate && pip install -r requirements.txt'
runuser apparatus -c 'sqlite3 apparatus.db < apparatus.sql'

ln -s /opt/apparatus-infra/apparatus.service /etc/systemd/system/apparatus.service
