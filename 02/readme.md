### Laboratorium 02 - lista zadań

- [Laboratorium 02 - lista zadań](#laboratorium-02---lista-zada%c5%84)
  - [Skrypt 1](#skrypt-1)
  - [Skrypt 2](#skrypt-2)
  - [Skrypt 3](#skrypt-3)
  - [Skrypt 4](#skrypt-4)
  - [Skrypt 5](#skrypt-5)
  - [Skrypt 6](#skrypt-6)
  - [Skrypt 7](#skrypt-7)
  - [Skrypt 8](#skrypt-8)
  - [Skrypt 9](#skrypt-9)
  - [Skrypt 10](#skrypt-10)
  - [Skrypt 11](#skrypt-11)
  - [Skrypt 12](#skrypt-12)
  - [Skrypt 13](#skrypt-13)
  - [Skrypt 14](#skrypt-14)
  - [Skrypt 15](#skrypt-15)

#### Skrypt 1
Zmiana  nazw  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu), do których mamy ustawione prawo zapisu, przez dopisanie dodatkowego członu .old. Wcześniej należy skasować wszystkie pliki, które już mają takie rozszerzenie. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	set -x #trace what gets executed
	
	if [ "$#" -ne 1 ]; then
		echo "Wrong number of arguments!"
		exit 1
	fi
	
	if [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	fi
	
	rm -f "${1}/"*.old
	for file_name in "${1}/"*; do
		if [ -w "${file_name}" ]; then
			mv "${file_name}" "${file_name}.old"
		fi
	done
```
#### Skrypt 2
Tworzenie nowych plików w zadanym katalogu (parametr wywołania skryptu), według listy umieszczonej  w  pliku  (drugi  parametr  wywołania  skryptu).  Nowe  pliki  mają  być  zerowej wielkości (puste). Jeżeli jakiś plik już istnieje, to nie powinien zostać zniszczony. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	set -x #trace what gets executed
	
	if [ "$#" -ne 2 ]; then
		echo "Wrong number of arguments!"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	elif [ ! -r "${2}" ]; then
		echo "File \"${2}\" does not exist!"
		exit 1
	fi
	
	files_list=`cat "${2}"`
	for file in ${files_list}; do
		if [ ! -e "${1}/${file}" ]; then
			touch "${1}/${file}"
		fi
	done
```
#### Skrypt 3
Kasowanie  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu),  poza plikami wykonywalnymi, mającymi ustawiony bit dostępu typu „execute”. 
```bash
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
	
	for file in "${1}/"*; do
		if [ ! -x "${file}" ]; then
			rm -f "${file}"
		fi
	done
```
#### Skrypt 4
Numerowanie  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu),  do których  mamy  ustawione  prawo  wykonywania    („execute”),  przez  dodanie  dodatkowego członu  rozszerzenia  o  postaci  .<numer kolejny>.  Numeracja  powinna  przebiegać  według 
wielkości plików.
```bash
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
```
#### Skrypt 5
Łączenie w jeden wszystkich plików należących do zadanego katalogu (parametr wywołania skryptu), o zadanym rozszerzeniu (drugi parametr skryptu). Kolejność, w jakiej pliki zostaną połączone  -  nieistotna.  Treść  każdego  pliku  powinna  być  poprzedzona  nagłówkiem  z  jego nazwą.
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	set -x #trace what gets executed
	
	if [ "$#" -eq 2 ]; then
		if [ ! -d "${1}" ]; then
			echo "Directory \"${1}\" does not exist!"
		fi
		extension=".${2}"
	elif [ "$#" -eq 1 ]; then
		if [ ! -d "${1}" ]; then
			echo "Directory \"${1}\" does not exist!"
		fi
		extension=.none
	else
		echo "Wrong number of arguments!"
		exit 1
	fi
	
	rm -f ${1}/merged${extension}
	bulk_file="${1}/merged${extension}"
	touch "${bulk_file}"
	
	if [ "${extension}" == .none ]; then
		files_list=`ls --ignore='*.*' ${1}`
		for file in ${files_list}; do
			echo "File: ${file}" >> "${bulk_file}"
			cat "${file}" >> "${bulk_file}"
			echo '' >> "${bulk_file}"
		done
	else
		for file in "${1}/"*${extension}; do
			echo "File: ${file}" >> "${bulk_file}"
			cat "${file}" >> "${bulk_file}"
			echo '' >> "${bulk_file}"
		done
	fi
	
```
#### Skrypt 6
Łączenie  w  jeden  plików  z  listy,  umieszczonej    w  pliku  o  zadanej  nazwie  (parametr wywołania skryptu. Kolejność, w jakiej pliki zostaną połączone - ściśle według listy. Treść każdego pliku powinna być poprzedzona nagłówkiem z jego nazwą. Plik wynikowy powinien mieć nazwę pliku pierwotnie zawierającego listę. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 1 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} list_path"
		exit 1
	elif [ ! -r "${1}" ]; then
		echo "File \"${1}\" does not exist!"
		exit 1
	fi
	
	files_list=`cat "${1}"`
	rm -f "${1}"
	bulk_file="${1}"
	touch "${bulk_file}"
	
	for file in ${files_list}; do
		if [ ! -r "${1}/${file}" ]; then
			echo "File: ${file}" >> "${bulk_file}"
			cat "${file}" >> "${bulk_file}"
			echo '' >> "${bulk_file}"
		else
			echo "Can't read file: ${file}"
		fi
	done
	
```
#### Skrypt 7
Przesuwanie wszystkich plików z ustawionym prawem wykonywania z jednego katalogu do drugiego.  Pozostałe  pliki  w  katalogu  nie  powinny  być  ruszane.  Nazwy  katalogów, źródłowego i docelowego, zadawane jako parametry skryptu.
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 2 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} source_dir destination_dir"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	elif [ ! -d "${2}" ]; then
		echo "Directory \"${2}\" does not exist!"
		exit 1
	fi
	
	for file in "${1}/"*; do
		if [ -x "${file}" ]; then
			filename=$(basename -- "${file}")
			new_path="${2}/${filename}"
			mv ${file} ${new_path}
		fi
	done
	
```
#### Skrypt 8
Listowanie  plików  z  zadanego  katalogu  (parametr  wywołania  skryptu),  wraz  z  jego podkatalogami.  Zawartość  podkatalogów  ma  być  listowana  w  postaci  <ścieżka dostępu względem listowanego katalogu>/<nazwa pliku>.  Ograniczyć  liczbę  zagnieżdżeń  podkatalogów (np. do dwóch).
```bash
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
		local dir_content=`ls "${1}"`
		
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
```
#### Skrypt 9
Kasowanie wszystkich plików pustych (o zerowej wielkości) w zadanym katalogu (parametr wywołania skryptu). Skrypt powinien tworzyć w zadanym pliku listę skasowanych plików. Nie powinien analizować dołączeń symbolicznych. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 1 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} directory"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	fi
	
	deleted_files_list="${1}/deleted_files.txt"
	rm -f ${deleted_files_list}
	touch ${deleted_files_list}
	
	for file in "${1}/"*; do
		if [ ! -h "${file}" ] && [ ! -s "${file}"  ]; then
			echo "${file}" >> "${deleted_files_list}"
			rm -f ${file}
		fi
	done
	
```
#### Skrypt 10
Porównanie  zawartości  dwóch  zadanych  katalogów  (argumenty  skryptu).  Przy  porównaniu należy ignorować podkatalogi. W wyniku wyświetlić na ekranie listę plików o identycznych nazwach w obu katalogach. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 2 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} dir_a dir_b"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	elif [ ! -d "${2}" ]; then
		echo "Directory \"${2}\" does not exist!"
		exit 1
	fi
	
	for file in "${1}/"*; do
		if [ ! -d "${file}" ]; then
			filename=$(basename -- "${file}")
			path_in_dir_b="${2}/${filename}"
			if [ ! -d "${path_in_dir_b}" ] && [ -e "${path_in_dir_b}" ]; then
				echo "${1}/${filename} --- ${path_in_dir_b}"
			fi
		fi
	done
	
```
#### Skrypt 11
Porównanie  zawartości  zadanego  katalogu  z  listą  plików  (nazwa  katalogu  i  pliku  z  listą zadawana  w  argumentach  skryptu).  Należy  wygenerować  listę  plików  brakujących  w katalogu i takich, które nie są na liście. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 2 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} directory list_file"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	elif [ ! -r "${2}" ]; then
		echo "File \"${2}\" does not exist!"
		exit 1
	fi
	
	list=`cat "${2}"`
	
	echo "Files not in the list:"
	for file in "${1}/"*; do
		filename=$(basename -- "${file}")
	
		if [[ "${list}" != *"${filename}"* ]]; then
			echo "${filename}"
		fi
	done
	
	echo "Files not in the directory:"
	for filename in ${list}; do
		if [[ ! -e "${1}/${filename}" ]]; then
			echo "${filename}"
		fi
	done
	
```
#### Skrypt 12
Usuwanie  wszystkich  podkatalogów  zadanego  katalogu  (parametr  wywołania  skryptu). Zawartość tych podkatalogów należy przenieść do katalogu nadrzędnego. Usuwanie dotyczy tylko jednego poziomu podkatalogów. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 1 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} directory"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	fi
	
	for file in "${1}/"*; do
		if [[ -d "${file}" ]]; then
			for inner_file in "${file}/"*; do
				echo "${file} --- ${inner_file}"
				mv "${inner_file}" "${1}"
			done
			rm -rf ${file}
		fi
	done
```
#### Skrypt 13
Usuwanie  z  zadanego  katalogu  (pierwszy  argument  skryptu)  wszystkich  plików,  których nazwy  pokrywają  się  z  nazwami  w  drugim  katalogu  (drugi  argument). Nie  usuwaj podkatalogów.  Nie  usuwaj  również  plików  o  nazwach  pokrywających  się  z  nazwami podkatalogów w drugim katalogu. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 2 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} dir_a dir_b"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	elif [ ! -d "${2}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	fi
	
	dir_b_content=`ls "${2}"`
	
	for file in ${dir_b_content}; do
		if [[ ! -d "${2}/${file}" ]] && 
		   [[ ! -d "${1}/${file}" ]] && [[ -e "${1}/${file}" ]]; then
		   rm -f "${1}/${file}"
		fi
	done
```
#### Skrypt 14
Ustawienie  na  aktualny  czasu  ostatniej  modyfikacji  wszystkich  plików  zadanego  katalogu (parametr wywołania skryptu), do których mamy prawo dostępu do zapisu/modyfikacji. 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 1 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} directory"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	fi
	
	for file in "${1}/"*; do
		if [[ -r "${file}" ]] && [[ -w "${file}" ]]; then
			touch "${file}"
		fi
	done
	
```
#### Skrypt 15
Policzenie wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do których ustawione jest prawo dostępu do wykonania („execute”). 
```bash
#!/usr/bin/env bash 
	set -e #exit on command fail
	set -u #exit on undefined variable use
	#set -x #trace what gets executed
	
	if [ "$#" -ne 1 ]; then
		echo "Wrong number of arguments!"
		echo "Usage: ${0} directory"
		exit 1
	elif [ ! -d "${1}" ]; then
		echo "Directory \"${1}\" does not exist!"
		exit 1
	fi
	
	i=0
	for file in "${1}/"*; do
		if [[ -x "${file}" ]] && [[ ! -d "${file}" ]]; then
			((++i))
		fi
	done
	
	echo "Number of executable files in \"${1}\": ${i}"
	
```