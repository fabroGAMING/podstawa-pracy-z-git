#!/bin/bash

echo "Wywołanie skryptu"

export LC_TIME=pl_PL.UTF-8

if [[ "$1" == "--date" ]]; then
    echo "Dzisiejsza data: $(date)"
fi

if [[ "$1" == "--logs" ]]; then
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