#!/usr/bin/env bash 
#set -e #exit on command fail  <--- ???
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [[ "$#" -ne 1 ]]; then
	echo "Wrong number of arguments!"
	echo "Usage: ${0} directory"
	exit 1
elif [[ ! -d "${1}" ]]; then
	echo "Directory \"${1}\" does not exist!"
fi

depth=1
function list_files {
	dir_content=`ls "${1}"`
	
	for file in ${dir_content}; do
		local file_path="${1}/${file}"
		if [[ -d "${file_path}" ]] && [[ "${depth}" -ne 0 ]]; then
			((--depth))
			echo "${file_path}"
			list_files "${file_path}"
			((++depth))
		else
			echo "${file_path}"
		fi
	done
}

list_files "${1}"