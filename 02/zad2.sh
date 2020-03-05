#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
set -x #trace what gets executed

if [ "$#" -ne 2 ]; then
	echo "Wrong number of arguments!"
	exit 1
elif [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
	exit 1
elif [ ! -r "${2}" ]; then
	echo "File \"${2}\" does not exist!"
	exit 1
fi

files_list=`cat "${2}"`
for file in ${files_list}; do
	if [ ! -e "${1}/${file}" ]; then
		touch "${1}/${file}"
	fi
done