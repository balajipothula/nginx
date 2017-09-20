#!/bin/bash

# Author      : BALAJI POTHULA <balan.pothula@gmail.com>,
# Date        : 08 September 2017,
# Description : Installing nginx from Source on Ubuntu.

readonly PCRE_VER=8.41
readonly ZLIB_VER=1.2.11
readonly NGINX_VER=1.12.1
readonly LIBRESSL_VER=2.6.1
readonly ROOT=~/nginx-root

# Updating repo.
sudo apt-get update

# Installing build tools.
sudo apt-get install -y build-essential make

# Downloading necessary src.
sudo wget https://zlib.net/zlib-$ZLIB_VER.tar.gz && tar -zxf zlib-$ZLIB_VER.tar.gz
sudo wget http://nginx.org/download/nginx-$NGINX_VER.tar.gz && tar -zxf nginx-$NGINX_VER.tar.gz
sudo wget https://ftp.pcre.org/pub/pcre/pcre-$PCRE_VER.tar.gz && tar -zxf pcre-$PCRE_VER.tar.gz
sudo wget https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$LIBRESSL_VER.tar.gz && tar -zxf libressl-$LIBRESSL_VER.tar.gz

# Removing src .tar.gz files.
sudo rm -rf *.tar.gz

# Installing zlib.
cd ~/zlib-$ZLIB_VER
./configure
sudo make
sudo make install

# Installing pcre.
cd ~/pcre-$PCRE_VER
./configure
sudo make
sudo make install

# Installing libressl.
cd ~/libressl-$LIBRESSL_VER
sudo ./configure
sudo make
sudo make install

# Changing nginx version header.
# Hiding nginx name, version and build version.
sudo sed -i -e 's/NGINX_VER_BUILD//g' ~/nginx-$NGINX_VER/src/http/ngx_http_header_filter_module.c
sudo sed -i -e 's/NGINX_VER//g' ~/nginx-$NGINX_VER/src/http/ngx_http_header_filter_module.c
sudo sed -i -e 's/Server: nginx/Server : Florence/g' ~/nginx-$NGINX_VER/src/http/ngx_http_header_filter_module.c
sudo sed -i -e 's/Server: /Server: Florence 1.0/g' ~/nginx-$NGINX_VER/src/http/ngx_http_header_filter_module.c

# Installing nginx.
cd ~/nginx-$NGINX_VER
sudo ./configure --prefix=$ROOT                           \
                 --without-http_scgi_module               \
                 --without-http_uwsgi_module              \
                 --without-http_fastcgi_module            \
                 --with-cc-opt='-static -static-libgcc'   \
                 --with-cpu-opt=generic                   \
                 --with-pcre=../pcre-$PCRE_VER            \
                 --with-pcre-jit                          \
                 --with-zlib=../zlib-$ZLIB_VER            \
                 --with-openssl=../libressl-$LIBRESSL_VER \
                 --with-http_ssl_module
sudo make
sudo make install

# Removing src folders.
sudo rm -rf ~/pcre-$PCRE_VER ~/zlib-$ZLIB_VER ~/libressl-$LIBRESSL_VER ~/nginx-$NGINX_VER

