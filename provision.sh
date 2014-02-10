#!/usr/bin/env bash

ansible-playbook -i hosts-vagrant bootstrap.yml --ask-sudo-pass
