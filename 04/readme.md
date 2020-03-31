### Laboratorium 4 - Operacje na drzewach katalogów, przetwarzanie potokowe (skrypty z wykorzystaniem FIND

- [Laboratorium 4 - Operacje na drzewach katalogów, przetwarzanie potokowe (skrypty z wykorzystaniem FIND](#laboratorium-4---operacje-na-drzewach-katalog%c3%b3w-przetwarzanie-potokowe-skrypty-z-wykorzystaniem-find)
  - [Skrypt 1](#skrypt-1)
  - [Skrypt 2](#skrypt-2)
    - [Uwagi](#uwagi)

#### Skrypt 1
Napisać skrypt, który w zadanym katalogu(parametr wywołania skryptu):
- w zadanym katalogu stworzy strukturę plików pozwalającą na przetestowanie zadania
- a) znajdzie pliki, które w nazwie zawierają słowo "test" - posortuje je i wyświetli ograniczając ich liczbę do pierwszych trzech
- b) znajdzie pliki z rozszerzeniem *.jpg lub *.png i z wykorzystaniem pętli while wyświetli ścieżki kanoniczne do tych plików zamieniając "/" na "|"
- c) usunie (zanim zaczną państwo usuwać pliki proponuję je wyświetlić!) wszystkie pliki starsze niż 1 min - ograniczyć wyszukiwanie plików do 2 podkatalogów w głąb - wykorzystaj flagę exec 

   
```bash
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
```

#### Skrypt 2
Napisać skrypt, który w zadanym katalogu(parametr wywołania skryptu):
- w zadanym katalogu stworzy strukturę plików pozwalającą na przetestowanie zadania
- a) zapisze do pliku ./result.dat i wyświetli na ekranie pliki, które mają rozszerzenie (*.txt lub *.dat) i są większe niż 1 kilobajt w formacie: "ścieżka_kanoniczna|data|czas" np. "/home/x/y/z/test.txt|31.03.2020|10:30:12"
- b) z pliku ./result.dat dla każdego wiersza wydobędzie samą nazwę pliku(bez rozszerzenia) i minutę: np. "test 30

##### Uwagi
- w zad 2. a) - proponuję użyć komendy `date`
- w zad 2. b) - proponuję użyć prostych komend typu `cut`
- proszę NIE używać bardziej zaawansowanych komend bash - grep, awk, itd. Są to zadania głównie find i przetwarzania potokowego(|)

```bash
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

```
