#!/usr/bin/env bash
set -e

function _colored() {
	COLOR=${1?}
	TEXT=${2}

	if tty -s; then
		echo -e "\033[${COLOR}m${TEXT}\033[0m";
	else
		echo "${TEXT}"
	fi
}

function _confirm() {
	TEXT=${1?}
	read -p "${TEXT} [y/N]" -n 1 -r; echo
	[[ $REPLY =~ ^[Yy]$ ]]
}

function _print() { 
	_colored "1;37" "$1" 
}

read -e -i "server.yml" -p "Which playbook: " PLAYBOOK
read -e -i "vagrant" -p "Which host: " ENV
read -e -i "" -p "Extra arguments: " ARGS

CMD="ansible-playbook $PLAYBOOK -i inventory/$ENV --ask-sudo-pass $ARGS"

_print ">> $CMD"
_confirm "Run?" || {
	_print "Aborted."
	exit 1
}

eval "${CMD}"
