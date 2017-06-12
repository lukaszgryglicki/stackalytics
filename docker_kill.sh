#!/bin/sh
docker kill `docker ps | grep lukaszgryglicki-stackalytics | cut -f 1 -d " "`
