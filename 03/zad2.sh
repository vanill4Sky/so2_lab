#!/usr/bin/env bash 
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

if [ "$#" -ne 1 ]; then
	echo "Wrong number of arguments!"
	exit 1
fi

if [ ! -d "${1}" ]; then
	echo "Directory \"${1}\" does not exist!"
	exit 1
fi

if [ ! -e "./zad1.sh" ]; then
	echo "Script \"./zad1.sh\" does not exist!"
	exit 1
fi

#1
./zad1.sh "${1}"
#2, 3
cp -d "${1}/E/link_bez_plik1" "${1}/A/C/" 	#skopiowany link jest wciąż poprawny
cp -d "${1}/E/link_plik3" "${1}/A/C/"		#skopiowany link jest błędny 
											#ścieżka względna do plik3.txt z A/C/ jest inna niż z E/
#4
cp -L "${1}/E/link_plik2" "${1}/A/C/plik2.txt"
#5
all_symlinks=`find "${1}/" -type l`
for link in ${all_symlinks}; do
	canonical_path=`readlink -m "${link}"`
	if [[ $(basename -- "${canonical_path}") == "plik1.txt" ]]; then
		echo "${link} -> ${canonical_path}"
	fi
done