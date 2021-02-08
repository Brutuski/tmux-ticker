#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

stock_ticker_name=$(get_tmux_option "@ticker_stock" )
main() {
    online='wget -q --spider https://google.com'

    if [[ $? -eq 0 ]]; then
        get_stock
    else
        echo "Error, No Internet"
    fi
}

get_stock()
{
    value=$(curl -s https://www.marketwatch.com/investing/stock/${stock_ticker_name} | grep '<meta name="price" content="' | cut -d'"' -f4)

    if [[ ! -z "$value" ]]; then
        printf "$stock_ticker_name: $value"
    fi
}

main

