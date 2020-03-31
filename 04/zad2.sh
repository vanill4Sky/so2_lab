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

#-----------------1-------------------
rm -rf "${1}/"*
mkdir -p "${1}/A/B" "${1}/A/C/D" "${1}/E"
paths=(
    "/A/pliktest1.dat"
    "/A/B/test.txt"
    "/A/C/D/t_est.dat"
    "/E/plik4.txt"
    "/Atesttest.dat"
    "/E/sdf_test_sdf.jpg"
    "/E/asd_test_asd.txt"
)

i=1
for path in ${paths[@]}; do
    echo "Test ${i}" > "${1}${path}"
    if [[ ${i} -gt 3 ]]; then
        truncate --size 1100 "${1}${path}"
    fi 
    ((++i))
done

tree -h -D "${1}/"

#-----------------2-------------------
result_file="./result.dat"
rm -f "${result_file}"
touch "${result_file}"

find "${1}/" \( \( -iname "*.dat" -o -iname "*.txt" \) -a -size +1k \) | 
    while read file
    do
        line=`readlink -f "${file}"``date +"|%d.%m.%Y|%H:%M:%S"`
        echo "${line}" >> "${result_file}"
        echo "${line}"
    done

#-----------------3-------------------
result=`cat "${result_file}"`
for line in ${result}; do
    filename=`echo "${line}" | 
        cut -d "|" -f 1  | 
        rev | 
        cut -d "/" -f 1 | 
        rev | 
        cut -d "." -f 1`
    minute=`echo "${line}" |
        cut -d "|" -f 3 |
        cut -d ":" -f 2`
        
    echo "$filename $minute"
done
