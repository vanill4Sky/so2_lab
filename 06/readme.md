### Laboratorium 4 - Potokowe przetwarzanie strumieni tekstowych (grep, awk)

- [Laboratorium 4 - Potokowe przetwarzanie strumieni tekstowych (grep, awk)](#laboratorium-4---potokowe-przetwarzanie-strumieni-tekstowych-grep-awk)
  - [Zad 1](#zad-1)
  - [Zad 2](#zad-2)

#### Zad 1
Proszę zapisać wyrażenia regularne, aby wykryć czy dowolny ciąg pasuje do poniższych problemów:
1. Imię i nazwisko - proszę uwzględnić: drugie imię, nazwisko z myślnikiem. Czyli wzorzec powinien wykryć zarówno: "Adam Nowak" i "Anna Maria Kowalska-Nowak". Niewymagane są polskie znaki.
2. kod pocztowy i miasto: proszę uwzględnić polskie znaki oraz uwzględnić też takie miejscowości jak: "Zielona Góra" czy "Bielsko-Biała"
3. e-mail - proszę uwzględnić również wiele "sub-domen" np. "student.pwr.edu.pl". Proszę nie korzystać z zaawansowanych gotowców (mimo iż w projektach komercyjnych jest to rekomendowane podejście).
4. deklaracje funkcji w C np: "void fun(int, *int);".

Proszę nie korzystać z gotowców. Nawet jak Państwa wyrażenia nie będą doskonałe to chodzi o ćwiczenie. Rozwiązania należy umieścić  w pliku *.txt. Wystarczą same wyrażenia(ew. można dodać testowane ciągi). Do testowania wyrażeń polecam używać stron typu: https://regex101.com/ np:

#### Zad 2
Napisać program w bash, który z wykorzystaniem wyrażeń regularnych przeanalizuje https://en.wikipedia.org/wiki/Wikipedia:10,000_most_common_passwords i z sekcji "Top-100" policzy ile jest haseł:
- zawierających tylko same cyfry
- zawierających tylko same małe litery
- składających się z powtórzonego tego samego znaku

W prostszej wersji proszę użyć: https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt