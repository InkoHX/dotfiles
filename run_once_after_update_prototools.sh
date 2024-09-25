#!/usr/bin/env bash

set -euo pipefail

prototools_path=$HOME/.proto/.prototools

if [ -f $prototools_path ]; then
  cat $prototools_path \
    | dasel put -r toml -t bool -v true -- "settings.auto-install" \
    | dasel put -r toml -t bool -v false -- "settings.telemetry" \
    | tee $prototools_path
else
  cat << EOF > $prototools_path
[settings]
auto_install = true
telemetry = false
EOF
fi;
