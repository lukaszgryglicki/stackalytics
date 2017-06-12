#!/bin/sh
rm -i ~/.ssh/known_hosts
ssh -o "Port=10022" stackalytics@localhost
