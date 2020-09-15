#!/bin/bash
#wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-key adv - keyserver hkp://keyserver.ubuntu.com:80 - recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-3.4.list
apt-get update && apt-get install apt-transport-https
apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod
