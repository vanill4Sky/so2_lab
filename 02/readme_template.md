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
{{{zad1.sh}}}
```
#### Skrypt 2
Tworzenie nowych plików w zadanym katalogu (parametr wywołania skryptu), według listy umieszczonej  w  pliku  (drugi  parametr  wywołania  skryptu).  Nowe  pliki  mają  być  zerowej wielkości (puste). Jeżeli jakiś plik już istnieje, to nie powinien zostać zniszczony. 
```bash
{{{zad2.sh}}}
```
#### Skrypt 3
Kasowanie  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu),  poza plikami wykonywalnymi, mającymi ustawiony bit dostępu typu „execute”. 
```bash
{{{zad3.sh}}}
```
#### Skrypt 4
Numerowanie  wszystkich  plików  w  zadanym  katalogu  (parametr  wywołania  skryptu),  do których  mamy  ustawione  prawo  wykonywania    („execute”),  przez  dodanie  dodatkowego członu  rozszerzenia  o  postaci  .<numer kolejny>.  Numeracja  powinna  przebiegać  według 
wielkości plików.
```bash
{{{zad4.sh}}}
```
#### Skrypt 5
Łączenie w jeden wszystkich plików należących do zadanego katalogu (parametr wywołania skryptu), o zadanym rozszerzeniu (drugi parametr skryptu). Kolejność, w jakiej pliki zostaną połączone  -  nieistotna.  Treść  każdego  pliku  powinna  być  poprzedzona  nagłówkiem  z  jego nazwą.
```bash
{{{zad5.sh}}}
```
#### Skrypt 6
Łączenie  w  jeden  plików  z  listy,  umieszczonej    w  pliku  o  zadanej  nazwie  (parametr wywołania skryptu. Kolejność, w jakiej pliki zostaną połączone - ściśle według listy. Treść każdego pliku powinna być poprzedzona nagłówkiem z jego nazwą. Plik wynikowy powinien mieć nazwę pliku pierwotnie zawierającego listę. 
```bash
{{{zad6.sh}}}
```
#### Skrypt 7
Przesuwanie wszystkich plików z ustawionym prawem wykonywania z jednego katalogu do drugiego.  Pozostałe  pliki  w  katalogu  nie  powinny  być  ruszane.  Nazwy  katalogów, źródłowego i docelowego, zadawane jako parametry skryptu.
```bash
{{{zad7.sh}}}
```
#### Skrypt 8
Listowanie  plików  z  zadanego  katalogu  (parametr  wywołania  skryptu),  wraz  z  jego podkatalogami.  Zawartość  podkatalogów  ma  być  listowana  w  postaci  <ścieżka dostępu względem listowanego katalogu>/<nazwa pliku>.  Ograniczyć  liczbę  zagnieżdżeń  podkatalogów (np. do dwóch).
```bash
{{{zad8.sh}}}
```
#### Skrypt 9
Kasowanie wszystkich plików pustych (o zerowej wielkości) w zadanym katalogu (parametr wywołania skryptu). Skrypt powinien tworzyć w zadanym pliku listę skasowanych plików. Nie powinien analizować dołączeń symbolicznych. 
```bash
{{{zad9.sh}}}
```
#### Skrypt 10
Porównanie  zawartości  dwóch  zadanych  katalogów  (argumenty  skryptu).  Przy  porównaniu należy ignorować podkatalogi. W wyniku wyświetlić na ekranie listę plików o identycznych nazwach w obu katalogach. 
```bash
{{{zad10.sh}}}
```
#### Skrypt 11
Porównanie  zawartości  zadanego  katalogu  z  listą  plików  (nazwa  katalogu  i  pliku  z  listą zadawana  w  argumentach  skryptu).  Należy  wygenerować  listę  plików  brakujących  w katalogu i takich, które nie są na liście. 
```bash
{{{zad11.sh}}}
```
#### Skrypt 12
Usuwanie  wszystkich  podkatalogów  zadanego  katalogu  (parametr  wywołania  skryptu). Zawartość tych podkatalogów należy przenieść do katalogu nadrzędnego. Usuwanie dotyczy tylko jednego poziomu podkatalogów. 
```bash
{{{zad12.sh}}}
```
#### Skrypt 13
Usuwanie  z  zadanego  katalogu  (pierwszy  argument  skryptu)  wszystkich  plików,  których nazwy  pokrywają  się  z  nazwami  w  drugim  katalogu  (drugi  argument). Nie  usuwaj podkatalogów.  Nie  usuwaj  również  plików  o  nazwach  pokrywających  się  z  nazwami podkatalogów w drugim katalogu. 
```bash
{{{zad13.sh}}}
```
#### Skrypt 14
Ustawienie  na  aktualny  czasu  ostatniej  modyfikacji  wszystkich  plików  zadanego  katalogu (parametr wywołania skryptu), do których mamy prawo dostępu do zapisu/modyfikacji. 
```bash
{{{zad14.sh}}}
```
#### Skrypt 15
Policzenie wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do których ustawione jest prawo dostępu do wykonania („execute”). 
```bash
{{{zad15.sh}}}
```