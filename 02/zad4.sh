#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
set -x #trace what gets executed

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	exit 1
elif [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
fi

sorted_files_list=`ls -S --reverse "${1}"`

i=0
for file_name in ${sorted_files_list}; do
    file_path="${1}/${file_name}"
    
	if [ -x "${file_path}" ]; then
        mv "${file_path}" "${file_path}.${i}"
        ((++i))
	fi
done