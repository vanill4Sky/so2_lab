#!/usr/bin/env bash
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

temp_filename="temp.txt"
curl -L "https://en.wikipedia.org/wiki/Wikipedia:10,000_most_common_passwords" > "${temp_filename}"

temp_out_filename="temp_out.txt"
sed -n '/<div class="div-col columns column-width" style="-moz-column-width: 10em; -webkit-column-width: 10em; column-width: 10em;">/,/<\/div>/p' "${temp_filename}" | 
    sed 's/\(<ol>\|<\/ol>\)//g' |
    sed 's/\(<li>\|<\/li>\)//g' >> "${temp_out_filename}"

top100_list=`sed '1,1d' "${temp_out_filename}" | head -n 100` 

digits_only=0
lowercase_only=0
same_char=0

digits_only_regex='^[0-9]+$'
lowercase_only_regex='^[a-z]+$'
same_char_regex='^(.)\1+$'

for pass in ${top100_list}; do
    if [[ "${pass}" =~ ${digits_only_regex} ]]; then
        ((++digits_only))
    fi

    if [[ "${pass}" =~ ${lowercase_only_regex} ]]; then
        ((++lowercase_only))
    fi

    if [[ "${pass}" =~ ${same_char_regex} ]]; then
        ((++same_char))
    fi
done 

echo "Digits only: ${digits_only}"
echo "Lowercase letters only: ${lowercase_only}"
echo "Only one type of character: ${same_char}"

rm -f "${temp_out_filename}"
rm -f "$temp_filename"
