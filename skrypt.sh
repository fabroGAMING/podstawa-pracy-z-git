#!/bin/bash

echo "Wywołanie skryptu"

export LC_TIME=pl_PL.UTF-8

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    echo "Dzisiejsza data: $(date)"
fi

if [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    count=100
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi
    echo "Tworzenie $count plików log"
    for ((i=1; i<=count; i++)); do
        filename="log${i}.txt"
        echo -e "Nazwa pliku: $filename\nNazwa skryptu: $(basename "$0")\nData utworzenia: $(date)" > "$filename"
    done
fi

if [[ "$1" == "--init" ]]; then
    repo_url=$(git config --get remote.origin.url)
    if [[ -z "$repo_url" ]]; then
        echo "Nie znaleziono adresu repozytorium git w bieżącym katalogu."
        exit 1
    fi
    git clone "$repo_url" .
    export PATH="$PWD:$PATH"
    echo "Repozytorium sklonowane do $(pwd) i dodane do PATH."
fi

if [[ "$1" == "--error" || "$1" == "-e" ]]; then
    count=100
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi
    echo "Tworzenie $count plików i folderów error"
    for ((i=1; i<=count; i++)); do
        mkdir -p "error${i}"
        filename="error${i}/error${i}.txt"
        echo -e "Nazwa pliku: $filename\nNazwa skryptu: $(basename "$0")\nData utworzenia: $(date)" > "$filename"
    done
fi

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Dostępne opcje:"
    echo "  --date, -d        Wyświetla dzisiejszą datę"
    echo "  --logs [N], -l    Tworzy N plików log (domyślnie 100)"
    echo "  --init            Klonuje repozytorium git i dodaje do PATH"
    echo "  --error [N], -e   Tworzy N plików i folderów error (domyślnie 100)"
    echo "  --help, -h        Wyświetla tę pomoc"
fi