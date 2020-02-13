#!/bin/sh
set -e

if ! yum repolist | grep 'epel'
then
  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  yum-config-manager --enable epel
fi

if ! yum repolist | grep 'remi'
then
  yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
  yum-config-manager --enable remi-php73
fi

if ! yum list installed "scl-utils" >/dev/null 2>&1
then
  yum install -y https://rpmfind.net/linux/centos/7.7.1908/os/x86_64/Packages/scl-utils-20130529-19.el7.x86_64.rpm
fi

if ! yum list installed "libedit" >/dev/null 2>&1
then
  yum install -y https://rpmfind.net/linux/centos/7.7.1908/os/x86_64/Packages/libedit-3.0-12.20121213cvs.el7.x86_64.rpm
fi

if ! yum list installed "php73-php-pecl-apcu" >/dev/null 2>&1
then
  yum install -y php73-php-pecl-apcu
fi
