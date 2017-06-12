#!/bin/sh
# service ssh start && service apache2 start && service mysql start
service ssh start && memcached -u memcache -d
