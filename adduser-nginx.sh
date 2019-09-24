#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Adding nginx user on Ubuntu.

# Note        : Please run this file with root privilages.

# exits any line in the bash script fails.
set -e

# adding new user account on ubuntu.
useradd -m -c "NGINX Server" -s /bin/bash nginx

# adding new user account on rhel.
<<comment
adduser -m -c "NGINX Server" -s /bin/bash nginx
comment

# deleting user password access.
passwd -d nginx

# adding new user to sudoers.
chmod +w /etc/sudoers                                            && \
echo "nginx       ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers && \
chmod -w /etc/sudoers

# copying existing .ssh folder to new user.
cp -R $(pwd)/.ssh /home/nginx

# changing owner to .ssh directory.
chown -R nginx:nginx /home/nginx/.ssh

# switching to new usesr.
su - nginx
