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

```
