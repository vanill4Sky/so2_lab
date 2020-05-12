### Laboratorium 4 - Potokowe przetwarzanie strumieni tekstowych (grep, awk)

- [Laboratorium 4 - Potokowe przetwarzanie strumieni tekstowych (grep, awk)](#laboratorium-4---potokowe-przetwarzanie-strumieni-tekstowych-grep-awk)
  - [Zad 1](#zad-1)
  - [Zad 2](#zad-2)

#### Zad 1
Proszę zapisać wyrażenia regularne, aby wykryć czy dowolny ciąg pasuje do poniższych problemów:
1. Imię i nazwisko - proszę uwzględnić: drugie imię, nazwisko z myślnikiem. Czyli wzorzec powinien wykryć zarówno: "Adam Nowak" i "Anna Maria Kowalska-Nowak". Niewymagane są polskie znaki.
```
^[A-Z][a-z]+\s([A-Z][a-z]+)?\s*[A-Z][a-z]+(-[A-Z][a-z]+)?$
```
2. kod pocztowy i miasto: proszę uwzględnić polskie znaki oraz uwzględnić też takie miejscowości jak: "Zielona Góra" czy "Bielsko-Biała"
```
^\d{2}-\d{3} [-A-Za-z ĄĆĘŁŃÓŚŹŻąćęłńóśźż]+$
```
3. e-mail - proszę uwzględnić również wiele "sub-domen" np. "student.pwr.edu.pl". Proszę nie korzystać z zaawansowanych gotowców (mimo iż w projektach komercyjnych jest to rekomendowane podejście).
```
^[a-zA-Z!#$%&'*+\/=?^`{|}~][a-zA-Z\d!#$%&'*+\-\/=?^_`{|}~.]+@([a-z]+.[
```
4. deklaracje funkcji w C np: "void fun(int, *int);".
```
^\s*(typedef|extern|static|auto|register)*\s*([_a-zA-Z]\w*\s*[*]*)\s*\w*\([\w,\s*\.]*\);$
```

Proszę nie korzystać z gotowców. Nawet jak Państwa wyrażenia nie będą doskonałe to chodzi o ćwiczenie. Rozwiązania należy umieścić  w pliku *.txt. Wystarczą same wyrażenia(ew. można dodać testowane ciągi). Do testowania wyrażeń polecam używać stron typu: https://regex101.com/ np:

#### Zad 2
Napisać program w bash, który z wykorzystaniem wyrażeń regularnych przeanalizuje https://en.wikipedia.org/wiki/Wikipedia:10,000_most_common_passwords i z sekcji "Top-100" policzy ile jest haseł:
- zawierających tylko same cyfry
- zawierających tylko same małe litery
- składających się z powtórzonego tego samego znaku

W prostszej wersji proszę użyć: https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt

```bash
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

```