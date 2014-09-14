#!/usr/bin/env bash

set -e

DEFAULT="vagrant"
echo "Which hosts file? [$DEFAULT]"
read HOST

ansible-playbook -i inventory/${HOST:-$DEFAULT} bootstrap.yml --ask-sudo-pass
