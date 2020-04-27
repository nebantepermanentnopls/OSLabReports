#!/bin/bash
cd /
cd /usr/local/man/man8
gunzip diary.1.gz
cat diary.1
# man diary | grep -o '[a-z0-9A-Z]\{28\}'
