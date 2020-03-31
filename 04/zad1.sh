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
    "/A/pliktest1.txt"
    "/A/B/test.txt"
    "/A/C/D/t_est.txt"
    "/E/plik4.txt"
    "/Atesttest.txt"
    "/E/sdf_test_sdf.jpg"
    "/E/asd_test_asd.png"
)

i=1
for path in ${paths[@]}; do
    echo "Test ${i}" > "${1}${path}"
    if [[ ${i} -gt 3 ]]; then
        touch --date "10 minutes ago" ${1}${path} 
    fi 
    ((++i))
done

tree "${1}/"

#-----------------2--------------------
echo -e "\nTop 3 files with name containing \"test\" from sorted list:"
find "${1}/" -name "*test*" -print |
    sort --dictionary-order | 
    head --lines 3

#-----------------3--------------------
echo -e "\nCanonical paths to files with extension .jpg or .png:"
find "${1}/" \( -iname "*.jpg" -o -iname "*.png" \) | 
    while read file; do
        echo `readlink -f "${file}" | tr "/" "|"` 
    done

#-----------------4--------------------
echo -e "\nFiles older than 1 minute"
find "${1}/" -maxdepth 2 -mmin +1 -print
find "${1}/" -maxdepth 2 -mmin +1 -exec rm {} \;