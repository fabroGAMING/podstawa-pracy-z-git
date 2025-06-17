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

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Dostępne opcje:"
    echo "  --date        Wyświetla dzisiejszą datę"
    echo "  --logs [N]    Tworzy N plików log (domyślnie 100)"
    echo "  --help        Wyświetla tę pomoc"
fi