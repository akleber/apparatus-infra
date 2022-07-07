#! /bin/sh

cd /opt/apparatus
runuser apparatus -c 'git pull --rebase'
runuser apparatus -c 'git rev-parse --short HEAD > VERSION'
systemctl daemon-reload
systemctl restart apparatus
