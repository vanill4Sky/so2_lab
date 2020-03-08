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

deleted_files_list="${1}/deleted_files.txt"
rm -f ${deleted_files_list}
touch ${deleted_files_list}

for file in "${1}/"*; do
	if [ ! -h "${file}" ] && [ ! -s "${file}"  ]; then
		echo "${file}" >> "${deleted_files_list}"
		rm -f ${file}
	fi
done
