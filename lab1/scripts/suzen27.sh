#!/bin/bash
tail -f diary | grep -o '[0-9a-zA-Z]\{28\}'
