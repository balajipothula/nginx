#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 02 May 2020,
# Description : Installing OpenResty on RedHat8.

# exit immediately if a command exits with a non-zero exit status.
set -e

# debugging shell script.
set -x

# updating apt index.
sudo yum -y update

# upgrading packages.
sudo yum -y upgrade

# installing prerequisites packages,
# needed by adding gpg public keys.
sudo yum -y install wget

# importing openresty gpg key.
wget https://openresty.org/package/rhel/openresty.repo && \
sudo mv openresty.repo /etc/yum.repos.d/

# updating apt index.
sudo yum -y update

# installing openresty.
# resty command-line utility: openresty-resty
sudo yum -y install openresty
