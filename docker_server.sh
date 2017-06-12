#!/bin/sh
docker run -p 18080:8080 -p 10022:22 lukaszgryglicki-stackalytics 1>./server1.log 2>./server2.log &
