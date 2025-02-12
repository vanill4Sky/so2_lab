### Laboratorium 3 - lista zadań

- [Laboratorium 3 - lista zadań](#laboratorium-3---lista-zada%c5%84)
  - [Skrypt 1](#skrypt-1)
    - [Uwagi](#uwagi)
  - [Skrypt 2](#skrypt-2)

#### Skrypt 1
Napisać skrypt, który w zadanym katalogu(parametr wywołania skryptu):
1. Usunie zawartość tego katalogu -proszę uważać, żeby nie usunąć przypadkowo skryptu 
2. Stworzy strukturę katalogów i plików jak poniżej:  
   ![alt text](https://github.com/vanill4Sky/so2_lab/blob/master/03/img/zad_1_tree.png)
3. Każdy plik powinien w swojej treści zawierać treść "Test X", np. plik2.txt powinien mieć w treści "Test 2"
4. Utworzy dowiązania symboliczne:
   1. ze ścieżką bezwzględną(kanoniczną) ./E/link_bez_plik1 do plik1.txt
   2. ze ścieżką bezwzględną(kanoniczną) ./E/link_bez_plik4 do plik4.txt
   3. ze ścieżką względną ./A/B/link_plik1 do plik1.txt
   4. ze ścieżką względną ./E/link_plik2 do plik2.txt
   5. ze ścieżką względną ./E/link_plik3 do plik3.txt
   6. ze ścieżką względną ./A/C/D/link_plik4 do plik4.txt  
   ![alt text](https://github.com/vanill4Sky/so2_lab/blob/master/03/img/zad_1_tree_with_links.png)

##### Uwagi
1. Proszę nie używać komendy „cd” w skrypcie.
2. Osoby chcące dostać ocenę powyżej 3.0 nie powinny wpisywać ścieżki bezwzględnej ręcznie, ale użyć odpowiedniej komendy bash.
3. Proszę sprawdzić czy stworzone dowiązania są wykonane prawidłowo. Bardzo często wydaje się Państwu, że link jest prawidłowy, a w rzeczywistości tak nie jest. Komenda „tree” może ułatwić Państwu sprawę, gdyż potrafi zaznaczyć na czerwono błędne dowiązania. Ew. proszę po prostu wykonać komendę np. cat ./E/link_plik3. Gdy wszystko jest ok powinniśmy dostać w wyniku „Test 3”, czyli zawartość pliku plik3.txt  
   ![alt text](https://github.com/vanill4Sky/so2_lab/blob/master/03/img/zad_1_wrong_link.png)
   
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
```

#### Skrypt 2
Napisać skrypt, który: 
1. wywoła skrypt z zadania 1
2.	zrobi kopię plików dowiązań symbolicznych ./E/link_bez_plik1 i ./E/link_plik3 do ./A/C/
3.	proszę napisać w komentarzu co nietypowego stanie się z jednym z tych linków
4.	zrobi kopię pliku na który wskazuje link ./E/link_bez_plik2 (czyli plik2.txt) do ./A/C/ 
5.	znajdzie wszystkie dowiązania symboliczne do pliku plik1.txt i wyświetli je jako ścieżki kanoniczne - można założyć, ze znamy strukturę katalogów
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
```
