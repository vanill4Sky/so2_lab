#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [ "$#" -ne 2 ]; then
	echo "Wrong number of arguments!"
	echo "Usage: ${0} source_dir destination_dir"
	exit 1
elif [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
	exit 1
elif [ ! -d "${2}" ]; then
	echo "Directory \"${2}\" does not exist!"
	exit 1
fi

for file in "${1}/"*; do
	if [ -x "${file}" ]; then
		filename=$(basename -- "${file}")
		new_path="${2}/${filename}"
		mv ${file} ${new_path}
	fi
done
