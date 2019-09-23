#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 12 August 2019,
# Description : Installing / Compiling NGINX from Source Code.

# update package repositories.
sudo apt -y update

# build essentials installing.
sudo apt -y install build-essential gcc g++ make autoconf automake

# zlib downloading and extracting.
curl -JL https://zlib.net/zlib-1.2.11.tar.gz -o $HOME/zlib.tar.gz && \
tar -xzf $HOME/zlib.tar.gz -C $HOME                               && \
rm  -rf  $HOME/zlib.tar.gz                                        && \
mv       $HOME/zlib-* $HOME/zlibsrc

# pcre downloading and extracting.
curl -JL https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.gz -o $HOME/pcre.tar.gz && \
tar -xzf $HOME/pcre.tar.gz -C $HOME                                          && \
rm  -rf  $HOME/pcre.tar.gz                                                   && \
mv       $HOME/pcre-* $HOME/pcresrc

# libressl downloading and extracting.
curl -JL https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.6.1.tar.gz -o $HOME/libressl.tar.gz && \
tar -xzf $HOME/libressl.tar.gz -C $HOME                                                              && \
rm  -rf  $HOME/libressl.tar.gz                                                                       && \
mv       $HOME/libressl-* $HOME/libresslsrc

# nginx downloading, extracting and compiling.
curl -JL  https://nginx.org/download/nginx-1.17.3.tar.gz -o $HOME/nginx.tar.gz && \
tar  -xzf $HOME/nginx.tar.gz -C $HOME                                          && \
rm   -rf  $HOME/nginx.tar.gz                                                   && \
mv        $HOME/nginx-* $HOME/nginxsrc                                         && \
cd        $HOME/nginxsrc                                                       && \
./configure --prefix=$HOME/nginx                                                  \
            --sbin-path=$HOME/nginx/bin/nginx                                     \
            --conf-path=$HOME/nginx/conf/nginx.conf                               \
            --error-log-path=$HOME/nginx/log/error.log                            \
            --http-log-path=$HOME/nginx/log/access.log                            \
            --pid-path=$HOME/nginx/log/nginx.pid                                  \
            --lock-path=$HOME/nginx/log/nginx.lock                                \
            --with-cpu-opt='generic'                                              \
            --with-cc-opt='-static -static-libgcc'                                \
            --with-ld-opt='-lrt -static'                                          \
            --with-pcre=$HOME/pcresrc                                             \
            --with-pcre-jit                                                       \
            --with-zlib=$HOME/zlibsrc                                             \
            --with-openssl=$HOME/libresslsrc                                      \
            --with-http_ssl_module                                             && \
make                                                                           && \
make install
