#!/usr/bin/env bash
set -e

## Script for setting root password and configuring
## ssh authorized_keys with vagrant image.
## 
## Run this script with new vagrant images in order
## to test ansible scripts.

ssh vagrant@192.168.33.10 "sudo passwd root"
ssh-copy-id -i root@192.168.33.10
echo -e "All done. Test using:\nssh root@192.168.33.10\n"
