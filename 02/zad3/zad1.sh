#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
set -x #trace what gets executed

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	exit 1
fi

if [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
	exit 1
fi

rm -f "${1}/"*.old
for file_name in "${1}/"*; do
	if [ -w "${file_name}" ]; then
		mv "${file_name}" "${file_name}.old"
	fi
done