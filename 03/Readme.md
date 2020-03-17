### Laboratorium 2 - lista zadań

- [Laboratorium 2 - lista zadań](#laboratorium-2---lista-zada%c5%84)
  - [Skrypt 1](#skrypt-1)
    - [Uwagi](#uwagi)
  - [Skrypt 2](#skrypt-2)

#### Skrypt 1
Napisać skrypt, który w zadanym katalogu(parametr wywołania skryptu):
1. Usunie zawartość tego katalogu -proszę uważać, żeby nie usunąć przypadkowo skryptu 
2. Stworzy strukturę katalogów i plików jak poniżej:
   ()
3. Każdy plik powinien w swojej treści zawierać treść "Test X", np. plik2.txt powinien mieć w treści "Test 2"
4. Utworzy dowiązania symboliczne:
   1. ze ścieżką bezwzględną(kanoniczną) ./E/link_bez_plik1 do plik1.txt
   2. ze ścieżką bezwzględną(kanoniczną) ./E/link_bez_plik4 do plik4.txt
   3. ze ścieżką względną ./A/B/link_plik1 do plik1.txt
   4. ze ścieżką względną ./E/link_plik2 do plik2.txt
   5. ze ścieżką względną ./E/link_plik3 do plik3.txt
   6. ze ścieżką względną ./A/C/D/link_plik4 do plik4.txt
   ()

##### Uwagi
1. Proszę nie używać komendy „cd” w skrypcie.
2. Osoby chcące dostać ocenę powyżej 3.0 nie powinny wpisywać ścieżki bezwzględnej ręcznie, ale użyć odpowiedniej komendy bash.
3. Proszę sprawdzić czy stworzone dowiązania są wykonane prawidłowo. Bardzo często wydaje się Państwu, że link jest prawidłowy, a w rzeczywistości tak nie jest. Komenda „tree” może ułatwić Państwu sprawę, gdyż potrafi zaznaczyć na czerwono błędne dowiązania. Ew. proszę po prostu wykonać komendę np. cat ./E/link_plik3. Gdy wszystko jest ok powinniśmy dostać w wyniku „Test 3”, czyli zawartość pliku plik3.txt
   ()

#### Skrypt 2
Napisać skrypt, który: 
1. wywoła skrypt z zadania 1
2.	zrobi kopię plików dowiązań symbolicznych ./E/link_bez_plik1 i ./E/link_plik3 do ./A/C/
3.	proszę napisać w komentarzu co nietypowego stanie się z jednym z tych linków
4.	zrobi kopię pliku na który wskazuje link ./E/link_bez_plik2 (czyli plik2.txt) do ./A/C/ 
5.	znajdzie wszystkie dowiązania symboliczne do pliku plik1.txt i wyświetli je jako ścieżki kanoniczne - można założyć, ze znamy strukturę katalogów
