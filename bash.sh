#!/bin/bash -xe
apt-get update -y
apt install apache2 -y
sudo systemctl restart apache2
