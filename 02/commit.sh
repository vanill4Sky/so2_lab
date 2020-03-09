#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	echo "Usage: ${0} message"
	exit 1
fi

python3 update_readme.py
git add *
git commit -m "${1}"
git push