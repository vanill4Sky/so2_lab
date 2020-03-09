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
	echo "Directory \"${1}\" does not exist!"
	exit 1
fi

dir_b_content=`ls "${2}"`

for file in ${dir_b_content}; do
	if [[ ! -d "${2}/${file}" ]] && 
	   [[ ! -d "${1}/${file}" ]] && [[ -e "${1}/${file}" ]]; then
	   rm -f "${1}/${file}"
	fi
done