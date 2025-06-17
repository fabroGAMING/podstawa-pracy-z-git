#!/bin/bash

echo "Wywołaniie skryptu"

export LC_TIME=pl_PL.UTF-8
if [[ "$1" == "--date" ]]; then
    echo "Dzisiejsza data: $(date)"
fi

if [[ "$1" == "--logs" ]]; then
    echo "Tworzenie plików log"
    for i in {1..100}; do
        filename="log${i}.txt"
        echo -e "Nazwa pliku: $filename\nNazwa skryptu: $(basename "$0")\nData utworzenia: $(date)" > "$filename"
    done
fi