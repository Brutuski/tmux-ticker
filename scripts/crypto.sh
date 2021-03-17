#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

crypto_ticker_name=$(get_tmux_option "@ticker_crypto" )
main() {
    online='wget -q --spider https://google.com'

    if [[ $? -eq 0 ]]; then
       get_crypto
    else
        echo "Error, No Internet"
    fi
}

get_crypto()
{
    value=$(curl -s "https://api.cryptonator.com/api/ticker/$crypto_ticker_name" | sed -E 's/.*"price":"?([^,"]*)"?.*/\1/' | xargs printf "%'.3f")

    if [[ ! -z "$value" ]]; then
        printf "$crypto_ticker_name: $value"
    fi
}

main

