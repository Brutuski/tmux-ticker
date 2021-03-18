#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

crypto_ticker_name=$(get_tmux_option "@ticker_crypto" )
main() {
    online='wget -q --spider https://google.com'

    if [[ $? -eq 0 ]]; then
        get_crypto_change
    else
        echo "Error, No Internet"
    fi
}

get_crypto_change()
{
    resp=$(curl -s "https://api.cryptonator.com/api/ticker/${crypto_ticker_name}")
    value=$((100/$(echo $resp | sed -E 's/.*"price":"?([^,"]*)"?.*/\1/')*$(echo $resp | sed -E 's/.*"change":"?([^,"]*)"?.*/\1/')))

    if [[ ! -z "$value" ]]; then
        printf "%'.2f%%" $value
    fi
}

main

