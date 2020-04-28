### Laboratorium 4 - Potokowe przetwarzanie strumieni tekstowych (grep, awk)

- [Laboratorium 4 - Potokowe przetwarzanie strumieni tekstowych (grep, awk)](#laboratorium-4---potokowe-przetwarzanie-strumieni-tekstowych-grep-awk)
  - [Zad](#zad)

#### Zad
Proszę wpisać polecenie `ps aux` dostaną Państwo "tabelkę" z aktualnie uruchomionymi poleceniami. Celem ćwiczenia jest odpowiednie sparsowanie tej tabelki używając komendy `awk`:

1. Dla każdego procesu, który zużywa więcej pamięci niż 0.1% wyświetlić: *Użytkownik ____ ma uruchomiony proces o PID ____ - CPU = ___, MEM = ___*.
2. Dla każdego procesu, który trwa dłużej niż 0:05 wyświetlić: *Proces o PID ___ trwa: ___ *- przy czym czas zawsze wyświetlać w minutach(nawet jeśli powyżej 59)
3. Suma zużycia CPU i osobno MEM: *Suma CPU: ___, Suma MEM: ___*
4. Podobnie co c, ale suma dla wszystkich użytkowników np: *Użytkownik ____ łącznie zużywa CPU: ___ i MEM: ___*
5. Znajdzie użytkownika, który zużywa najwięcej CPU i takiego, który zużywa najwięcej MEM: *Użytkownik ___ zużywa najwięcej CPU: ___. Użytkownik ___ zużywa najwięcej MEM: __*_

**Uwaga:** W miejscach ___ należy wpisać oczywiście odpowiednie wartości.

   
```bash

```