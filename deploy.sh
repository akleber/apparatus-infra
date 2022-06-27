#! /bin/sh

cd /opt/apparatus
runuser -l apparatus -c 'git pull --rebase'
systemctl restart apparatus
