#!/bin/sh
rm -i ~/.ssh/known_hosts
sftp -o "Port=10022" stackalytics@localhost
