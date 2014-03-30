#!/usr/bin/env bash

read -e -p "Which hosts file? " -i "hosts-vagrant" HOST

ansible-playbook -i $HOST bootstrap.yml --ask-sudo-pass
