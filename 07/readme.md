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
```python
import argparse, os

# argument parser setup

def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"directory:{path} is not a valid path")

def file_path(path):
    if os.path.isfile(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"deleted_list:{path} is not a valid path")

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument(
    "directory", 
    help="target directory path.", 
    type=dir_path)
arg_parser.add_argument(
    "deleted_list", 
    help="path to file in which list of deleted files will be stored.", 
    type=file_path)

args = arg_parser.parse_args()

# rest
os.remove(args.deleted_list)
inner_files = os.listdir(args.directory)

with open(args.deleted_list, "w") as deleted_list:
    for inner_file in inner_files:
        inner_file_path = args.directory + "/" + inner_file
        if (os.path.isfile(inner_file_path) and not os.path.islink(inner_file_path) and os.stat(inner_file_path).st_size == 0):
            deleted_list.write(f"{inner_file_path}\n")
            os.remove(inner_file_path)
```

#### Zad 13
Usuwanie z zadanego katalogu (pierwszy argument skryptu) wszystkich plików, których nazwy pokrywają się z nazwami w drugim katalogu (drugi argument). Nie usuwaj podkatalogów. Nie usuwaj również plików o nazwach pokrywających się z nazwami podkatalogów w drugim katalogu.
```python
import argparse, os

# argument parser setup

def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"directory:{path} is not a valid path")

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument(
    "dir_a", 
    help="target directory path.", 
    type=dir_path)
arg_parser.add_argument(
    "dir_b", 
    help="target directory path.", 
    type=dir_path)

args = arg_parser.parse_args()

# rest
def filter_only_files(parent_path, file_list):
    filtered = []
    for file in file_list:
        full_path = parent_path + "/" + file
        if os.path.isfile(full_path):
            filtered.append(file)

    return filtered

dir_a_content = os.listdir(args.dir_a)
dir_a_files = filter_only_files(args.dir_a, dir_a_content)
dir_b_content = os.listdir(args.dir_b)
dir_b_files = filter_only_files(args.dir_b, dir_b_content)

for file_a in dir_a_files:
    full_path = args.dir_a + "/" + file_a
    if file_a in dir_b_files:
        print(full_path)
        os.remove(full_path)
```

#### Zad 1
Zmiana nazw wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do których mamy ustawione prawo zapisu, przez dopisanie dodatkowego członu .old. Wcześniej należy skasować wszystkie pliki, które już mają takie rozszerzenie.
```python
import argparse, os

# argument parser setup

def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"directory:{path} is not a valid path")

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument(
    "directory", 
    help="target directory path.", 
    type=dir_path)

args = arg_parser.parse_args()

# rest
inner_files = os.listdir(args.directory)

for inner_file in inner_files:
    inner_file_path = args.directory + "/" + inner_file
    
    if os.path.isfile(inner_file_path) and os.access(inner_file_path, os.W_OK):
        if inner_file_path[len(inner_file_path)-4:] == ".old":
            os.remove(inner_file_path)
        else:
            os.rename(inner_file_path, inner_file_path+".old")
```