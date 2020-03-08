#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
set -x #trace what gets executed

if [ "$#" -eq 2 ]; then
	if [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
	fi
	extension=".${2}"
elif [ "$#" -eq 1 ]; then
	if [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
	fi
	extension=.none
else
	echo "Wrong number of arguments!"
	exit 1
fi

rm -f ${1}/merged${extension}
bulk_file="${1}/merged${extension}"
touch "${bulk_file}"

if [ "${extension}" == .none ]; then
	files_list=`ls --ignore='*.*' ${1}`
	for file in ${files_list}; do
		echo "File: ${file}" >> "${bulk_file}"
		cat "${file}" >> "${bulk_file}"
		echo '' >> "${bulk_file}"
	done
else
	for file in "${1}/"*${extension}; do
		echo "File: ${file}" >> "${bulk_file}"
		cat "${file}" >> "${bulk_file}"
		echo '' >> "${bulk_file}"
	done
fi
