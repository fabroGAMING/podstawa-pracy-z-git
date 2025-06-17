#!/bin/bash

echo "Wywołaniie skryptu"
export LC_TIME=pl_PL.UTF-8
if [[ "$1" == "--date" ]]; then
    echo "Dzisiejsza data: $(date)"
fi