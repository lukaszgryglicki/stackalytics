#!/bin/sh
sed 's/# etc/etc/' ./.dockerignore > tmp && mv tmp ./.dockerignore
docker push lukaszgryglicki/stackalytics:tag
sed 's/etc/# etc/' ./.dockerignore > tmp && mv tmp ./.dockerignore
