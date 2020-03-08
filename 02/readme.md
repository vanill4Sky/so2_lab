# Laboratorium 02
## Lista zadań 1

1. Zmiana  nazw  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu), do których mamy ustawione prawo zapisu, przez dopisanie dodatkowego członu .old. Wcześniej należy skasować wszystkie pliki, które już mają takie rozszerzenie. 
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
2. Tworzenie nowych plików w zadanym katalogu (parametr wywołania skryptu), według listy umieszczonej  w  pliku  (drugi  parametr  wywołania  skryptu).  Nowe  pliki  mają  być  zerowej wielkości (puste). Jeżeli jakiś plik już istnieje, to nie powinien zostać zniszczony. 

3. Kasowanie  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu),  poza plikami wykonywalnymi, mającymi ustawiony bit dostępu typu „execute”. 

4. Numerowanie  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu),  do których  mamy  ustawione  prawo  wykonywania    („execute”),  przez  dodanie  dodatkowego członu  rozszerzenia  o  postaci  .<numer kolejny>.  Numeracja  powinna  przebiegać  według 
wielkości plików.

5. Łączenie w jeden wszystkich plików należących do zadanego katalogu (parametr wywołania skryptu), o zadanym rozszerzeniu (drugi parametr skryptu). Kolejność, w jakiej pliki zostaną połączone  -  nieistotna.  Treść  każdego  pliku  powinna  być  poprzedzona  nagłówkiem  z  jego nazwą.

6. Łączenie  w  jeden  plików  z  listy,  umieszczonej    w  pliku  o  zadanej  nazwie  (parametr wywołania skryptu. Kolejność, w jakiej pliki zostaną połączone - ściśle według listy. Treść każdego pliku powinna być poprzedzona nagłówkiem z jego nazwą. Plik wynikowy powinien mieć nazwę pliku pierwotnie zawierającego listę. 

7. Przesuwanie wszystkich plików z ustawionym prawem wykonywania z jednego katalogu do drugiego.  Pozostałe  pliki  w  katalogu  nie  powinny  być  ruszane.  Nazwy  katalogów, źródłowego i docelowego, zadawane jako parametry skryptu.

8. Listowanie  plików  z  zadanego  katalogu  (parametr  wywołania  skryptu),  wraz  z  jego podkatalogami.  Zawartość  podkatalogów  ma  być  listowana  w  postaci  <ścieżka dostępu względem listowanego katalogu>/<nazwa pliku>.  Ograniczyć  liczbę  zagnieżdżeń  podkatalogów (np. do dwóch).

9. Kasowanie wszystkich plików pustych (o zerowej wielkości) w zadanym katalogu (parametr wywołania skryptu). Skrypt powinien tworzyć w zadanym pliku listę skasowanych plików. Nie powinien analizować dołączeń symbolicznych. 

10. Porównanie  zawartości  dwóch  zadanych  katalogów  (argumenty  skryptu).  Przy  porównaniu należy ignorować podkatalogi. W wyniku wyświetlić na ekranie listę plików o identycznych nazwach w obu katalogach. 

11. Porównanie  zawartości  zadanego  katalogu  z  listą  plików  (nazwa  katalogu  i  pliku  z  listą zadawana  w  argumentach  skryptu).  Należy  wygenerować  listę  plików  brakujących  w katalogu i takich, które nie są na liście. 

12. Usuwanie  wszystkich  podkatalogów  zadanego  katalogu  (parametr  wywołania  skryptu). Zawartość tych podkatalogów należy przenieść do katalogu nadrzędnego. Usuwanie dotyczy tylko jednego poziomu podkatalogów. 

13. Usuwanie  z  zadanego  katalogu  (pierwszy  argument  skryptu)  wszystkich  plików,  których nazwy  pokrywają  się  z  nazwami  w  drugim  katalogu  (drugi  argument). Nie  usuwaj podkatalogów.  Nie  usuwaj  również  plików  o  nazwach  pokrywających  się  z  nazwami podkatalogów w drugim katalogu. 

14. Ustawienie  na  aktualny  czasu  ostatniej  modyfikacji  wszystkich  plików  zadanego  katalogu (parametr wywołania skryptu), do których mamy prawo dostępu do zapisu/modyfikacji. 

15. Policzenie wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do których ustawione jest prawo dostępu do wykonania („execute”). 