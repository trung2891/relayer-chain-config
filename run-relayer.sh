#!/bin/sh
echo "start run relayer"

export "$(grep -vE "^(#.*|\s*)$" .env)"

rly config init
rly chains add-dir configs
rly paths add-dir paths

rly keys restore oraichain alice "'$mnemonic'"
rly keys restore orai-testnet alice "'$mnemonic'"

rly tx link oraichain-oraitestnet -d -t 3s
rly start oraichain-oraitestnet