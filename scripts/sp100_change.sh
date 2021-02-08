#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

main() {
    online='wget -q --spider https://google.com'

    if [[ $? -eq 0 ]]; then
        get_oex_change
    else
        echo "Error, No Internet"
    fi
}

get_oex_change()
{
    value=$(curl -s https://www.marketwatch.com/investing/index/oex | grep '<meta name="priceChangePercent" content="' | cut -d'"' -f4)


    if [[ ! -z "$value" ]]; then
        printf "$value%"
    fi
}

main

