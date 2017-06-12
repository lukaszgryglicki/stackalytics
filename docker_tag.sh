#!/bin/sh
sed 's/# etc/etc/' ./.dockerignore > tmp && mv tmp ./.dockerignore
docker tag lukaszgryglicki-stackalytics lukaszgryglicki/stackalytics:tag
sed 's/etc/# etc/' ./.dockerignore > tmp && mv tmp ./.dockerignore
