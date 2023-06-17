#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

stock_ticker_name=$(get_tmux_option "@ticker_stock" )

positive_style=$(get_tmux_option "@ticker_positive_style" "#[fg=#00FF00]")
negative_style=$(get_tmux_option "@ticker_negative_style" "#[fg=#FF0000]")

main() {
    online='wget -q --spider https://google.com'

    if [[ $? -eq 0 ]]; then
        get_stock
    else
        echo "Error, No Internet"
    fi
}

get_stock() {
    response=$(curl -s https://www.marketwatch.com/investing/stock/${stock_ticker_name} | grep '<meta name="price')

    value=$(echo $response | sed "s/.*price\" content=\"\([^\"]*\).*/\1/")
    change=$(echo $response | sed "s/.*priceChange\" content=\"\([^\"]*\).*/\1/")

    if [[ $change -ge 0 ]]; then
        printf "$positive_style $stock_ticker_name: $value"
    else
        printf "$negative_style $stock_ticker_name: $value"
    fi
}

main
