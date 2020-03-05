#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
set -x #trace what gets executed

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	exit 1
elif [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
fi

for file in "${1}/"*; do
	if [ ! -x "${file}" ]; then
		rm -f "${file}"
	fi
done