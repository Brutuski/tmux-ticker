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
    value=$(curl -s https://www.marketwatch.com/investing/cryptocurrency/${crypto_ticker_name} | grep '<meta name="priceChangePercent" content="' | cut -d'"' -f4)

    if [[ ! -z "$value" ]]; then
        printf "$value%"
    fi
}

main

