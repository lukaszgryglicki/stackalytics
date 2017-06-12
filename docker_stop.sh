#!/bin/sh
docker stop `docker ps | grep lukaszgryglicki-stackalytics | cut -f 1 -d " "`
