<h2 align="center">Tmux-Ticker</h2>
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-ticker/188354ed393f5d4ef2dea5dd665195bf0a591879/logo.svg" width="200" height="200"><p>
<p align="center">
        <img alt="Status" src="https://img.shields.io/badge/Maintained-Yes-44B273.svg">
        <img alt="License" src="https://img.shields.io/badge/LICENSE-MIT-1D918B.svg">
</p>

<p align="center">
    <a href="https://www.buymeacoffee.com/asirohi"><img alt="Status" src="https://raw.githubusercontent.com/Brutuski/tmux-crypto/8a44fec52097cede774504f5bdaca5386abac3cc/assets/bmc.svg" width="150" height="23"> 
</p>

### Index
* [Getting Started](#getting-started)
* [Screenshots & Demo](#screenshots)
* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [Options](#options)
* [Example](#example)
* [Changelog](#changelog)
* [Issues](#issues)
* [License](#license)
* [Logo Credit](#logo-credit)

#### Getting Started
Ticker helps you keep track of various market indexes or a stock you wanna keep an eye out on.

Percentage change of the indexes can also be displayed.<br>
The data is fetched from [Marketwatch](https://www.marketwatch.com/).
_Currently only US Markets are supported._

Supported Indexes:
- Dow Jones Industrial Average -> DJI
    * #{ticker_dji}
    * #{ticker_dji_change}
- NASDAQ Composite Index -> COMP
    * #{ticker_nasdaq}
    * #{ticker_nasdaq_change}
- S&P 500 Index -> SPX
    * #{ticker_sp100}
    * #{ticker_sp100_change}
- S&P 100 Index -> OEX
    * #{ticker_sp500}
    * #{ticker_sp500_change}

- Any stock ticker can also be added.
    * #{ticker_stock}
- Any cryptocurrency ticker can also be added.
    * #{ticker_crypto}

#### Screenshots
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-ticker/main/assets/ticker1.png"><p>
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-ticker/main/assets/ticker2.png"><p>
<p align="center"><img src="https://raw.githubusercontent.com/Brutuski/tmux-ticker/main/assets/ticker3.png"><p>

Terminal and Tmux theme shown here is [Lighthaus](https://github.com/lighthaus-theme)

_Tmux Lighthaus theme coming soon_

#### Requirements
- [TPM](https://github.com/tmux-plugins/tpm) is the recommended method of installing this plugin
- [curl](https://github.com/curl/curl)

#### Installation
**Recommended method:**
- Add plugin to your [TPM](https://github.com/tmux-plugins/tpm) plugins in your `.tmux.conf`
    * ``` vim
        set -g @plugin 'Brutuski/tmux-ticker'
      ```
- While inside a tmux session press `prefix + I` to reload and install the plugin.
- Add the desired _format strings_ to your status as such
    * ``` vim
        #{ticker_dji} #{ticker_stock}
      ```
- Reload the tmux config and the changes should take effect.

**Manual Installation:**
- Clone this repo
    * ``` vim
        git clone https://github.com/Brutuski/tmux-ticker.git  ~/.tmux/tmux-ticker
      ```
- Add the following line to the bottom of your tmux config
    * ``` vim
        run-shell ~/.tmux/tmux-ticker/ticker.tmux
      ```
- Save the file and reload your tmux session.

#### Usage
- Change the following format string with the stock ticker
    * ``` vim
        set -g @ticker_stock "AAPL"
        #{ticker_stock}
      ```
- Reload the tmux config and the changes should take effect.

#### Options
All available format strings
``` vim
# Replace the name with the stock you would like to track.
set -g @ticker_stock "AAPL"
set -g status-left "......#[fg=#21252D,bg=#5AD1AA] #{ticker_nasdaq} ~ #{ticker_stock} ~ #{ticker_stock_change} "
```

#### Example
Format strings can be edited to what the user needs.
_fg_ and _bg_ colors can be defined by the user.
``` vim
set -g @ticker_stock "AAPL"

set -g status-left "......#[fg=#21252D,bg=#5AD1AA] #{ticker_nasdaq} ~ #{ticker_nasdaq_change} #{ticker_stock} "
```

#### Changelog
``` vim
v1.0.1
```
Changes can be tracked in the [CHANGELOG](https://github.com/Brutuski/tmux-ticker/blob/main/CHANGELOG.md)

#### Issues
Please report any bugs or issues [here](https://github.com/Brutuski/tmux-ticker/issues).

#### License
[MIT](https://github.com/Brutuski/tmux-ticker/blob/main/LICENSE)

_Copyright (c) 2021 Adhiraj Sirohi_ 

#### Logo Credit
Logo was made by [Vasundhara Sharma](https://vasdesigns.de/) 
<a href="https://www.behance.net/vasundhsharma" target="blank"><img align="center" src="https://raw.githubusercontent.com/detain/svg-logos/780f25886640cef088af994181646db2f6b1a3f8/svg/behance-1.svg" alt="https://www.behance.net/vasundhsharma" height="40" width="40"/></a> <a href="https://keybase.io/vas_sharma" target="blank"><img align="center" src="https://www.vectorlogo.zone/logos/keybase/keybase-icon.svg" alt="https://keybase.io/vas_sharma" height="40" width="40"/></a>
