#! /bin/sh

cd /opt/apparatus
runuser apparatus -c 'git pull --rebase'
runuser apparatus -c 'git rev-parse --short HEAD > VERSION'
runuser apparatus -c 'source venv/bin/activate && pip install -r requirements.txt'
systemctl daemon-reload
systemctl restart apparatus
