#!/usr/bin/env bash

HOST=$1
if [ -n $HOST ]; then
    HOST="vagrant"
fi

ansible-playbook -i hosts-$HOST bootstrap.yml --ask-sudo-pass
