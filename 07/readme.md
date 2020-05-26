### Laboratorium 7 - Skrypty  w języku Python

- [Laboratorium 7 - Skrypty  w języku Python](#laboratorium-7---skrypty-w-j%c4%99zyku-python)
  - [Wstęp](#wst%c4%99p)
  - [Zad 9](#zad-9)
  - [Zad 13](#zad-13)
  - [Zad 1](#zad-1)

#### Wstęp
W ramach ćwiczenia z Pythona, będą Państwo pracować na tej samej liście zadań co w przypadku bash - lab 2. Aby dostać ocenę pozytywną należy zrobić przynajmniej 1 zadanie całkowicie poprawnie.

Laboratorium składa się z trzech zadań z listy dostępnej tutaj: http://www.zsk.iiar.pwr.edu.pl/zsk/repository/dydaktyka/so/so_lab1.pdf

Zad 1 (numer_indeksu+2)%15+1
Zad 2 (numer_indeksu+ostatnia_cyfra_indeksu)%15+1
Zad 3 (numer_indeksu+przedostatnia_cyfra_indeksu)%15+1

W przypadku powtórzenia zadania należy wziąć następne w kolejności.

Czyli np. dla osoby o numerze indeksu 222120:
zad1: (222120+2)%15+1 = skrypt nr 3
zad2: (222120+0)%15+1 = skrypt nr 1
zad3: (222120+2)%15+1 = skrypt nr 3(powtórzenie!), czyli następne niepowtórzone zadanie to skrypt nr 4

Uwagi:
- dla każdego skryptu proszę dopisać dokładne sprawdzenie parametrów - czy podany argument jest plikiem, katalogiem, itd.

#### Zad 9
Kasowanie wszystkich plików pustych (o zerowej wielkości) w zadanym katalogu (parametr wywołania skryptu). Skrypt powinien tworzyć w zadanym pliku listę skasowanych plików. Nie powinien analizować dołączeń symbolicznych.
```bash
```

#### Zad 13
Usuwanie z zadanego katalogu (pierwszy argument skryptu) wszystkich plików, których nazwy pokrywają się z nazwami w drugim katalogu (drugi argument). Nie usuwaj podkatalogów. Nie usuwaj również plików o nazwach pokrywających się z nazwami podkatalogów w drugim katalogu.
```bash
```

#### Zad 1
Zmiana nazw wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do których mamy ustawione prawo zapisu, przez dopisanie dodatkowego członu .old. Wcześniej należy skasować wszystkie pliki, które już mają takie rozszerzenie.
```bash
```