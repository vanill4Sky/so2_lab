#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	echo "Usage: ${0} directory"
	exit 1
elif [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
	exit 1
fi

i=0
for file in "${1}/"*; do
	if [[ -x "${file}" ]] && [[ ! -d "${file}" ]]; then
		((++i))
	fi
done

echo "Number of executable files in \"${1}\": ${i}"
