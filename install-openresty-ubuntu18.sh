#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 10 May 2020,
# Description : Installing OpenResty.

# exit immediately if a command exits with a non-zero exit status.
set -e

# debugging shell script.
set -x

# updating apt index.
sudo apt -y update

# upgrading packages.
sudo apt -y upgrade

# installing prerequisites packages,
# needed by adding gpg public keys.
sudo apt -y install wget  \
                    gnupg \
                    ca-certificates

# importing openresty gpg key.
wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -

# adding openresty official apt repo.
echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
| sudo tee /etc/apt/sources.list.d/openresty.list

# updating apt index.
sudo apt -y update

# installing openresty.
sudo apt -y install openresty
