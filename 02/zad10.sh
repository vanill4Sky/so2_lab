#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [ "$#" -ne 2 ]; then
	echo "Wrong number of arguments!"
	echo "Usage: ${0} dir_a dir_b"
	exit 1
elif [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
	exit 1
elif [ ! -d "${2}" ]; then
	echo "Directory \"${2}\" does not exist!"
	exit 1
fi

for file in "${1}/"*; do
	if [ ! -d "${file}" ]; then
		filename=$(basename -- "${file}")
		path_in_dir_b="${2}/${filename}"
		if [ ! -d "${path_in_dir_b}" ] && [ -e "${path_in_dir_b}" ]; then
			echo "${1}/${filename} --- ${path_in_dir_b}"
		fi
	fi
done
