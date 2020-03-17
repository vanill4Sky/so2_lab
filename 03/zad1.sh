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
#1
rm -rf "${1}/"*
#2
mkdir -p "${1}/A/B" "${1}/A/C/D" "${1}/E"
#3
paths=(
	"/A/plik1.txt"
	"/A/B/plik2.txt"
	"/A/C/D/plik3.txt"
	"/E/plik4.txt"
)

i=1
for path in ${paths[@]}; do
	echo "Test ${i}" > "${1}${path}"
	((++i))	
done
#4
ln -s `readlink -f ${1}${paths[0]}` "${1}/E/link_bez_plik1"
ln -s `readlink -f ${1}${paths[3]}` "${1}/E/link_bez_plik4"
ln -s "../../${paths[0]}" "${1}/A/B/link_plik1"
ln -s "../${paths[1]}" "${1}/E/link_plik2"
ln -s "../${paths[2]}" "${1}/E/link_plik3"
ln -s "../../../${paths[3]}" "${1}/A/C/D/link_plik4"