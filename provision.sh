#!/usr/bin/env bash

set -e

DEFAULT="vagrant"
echo -en "Which hosts file? [$DEFAULT] \n> "
read HOST

echo -en "Anything else? \n> "
read EXTRA_ARGS

ansible-playbook -i inventory/${HOST:-$DEFAULT} server.yml --ask-sudo-pass $EXTRA_ARGS
