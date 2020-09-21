#!/bin/bash
cd /usr/local/bin
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
mv /tmp/puma.service /etc/systemd/system/
systemctl start puma
systemctl enable puma