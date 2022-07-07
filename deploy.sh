#! /bin/sh

cd /opt/apparatus
runuser -l apparatus -c 'git pull --rebase'
runuser -l apparatus -c 'git rev-parse --short HEAD > VERSION'
systemctl daemon-reload
systemctl restart apparatus
