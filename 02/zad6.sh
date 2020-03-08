#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	echo "Usage: ${0} list_path"
	exit 1
elif [ ! -r "${1}" ]; then
	echo "File \"${1}\" does not exist!"
	exit 1
fi

files_list=`cat "${1}"`
rm -f "${1}"
bulk_file="${1}"
touch "${bulk_file}"

for file in ${files_list}; do
	if [ ! -r "${1}/${file}" ]; then
		echo "File: ${file}" >> "${bulk_file}"
		cat "${file}" >> "${bulk_file}"
		echo '' >> "${bulk_file}"
	else
		echo "Can't read file: ${file}"
	fi
done
