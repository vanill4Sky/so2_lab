#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [ "$#" -ne 2 ]; then
	echo "Wrong number of arguments!"
	echo "Usage: ${0} directory list_file"
	exit 1
elif [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
	exit 1
elif [ ! -r "${2}" ]; then
	echo "File \"${2}\" does not exist!"
	exit 1
fi

list=`cat "${2}"`

echo "Files not in the list:"
for file in "${1}/"*; do
	filename=$(basename -- "${file}")

	if [[ "${list}" != *"${filename}"* ]]; then
		echo "${filename}"
	fi
done

echo "Files not in the directory:"
for filename in ${list}; do
	if [[ ! -e "${1}/${filename}" ]]; then
		echo "${filename}"
	fi
done
