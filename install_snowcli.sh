#!/bin/sh

set -euo pipefail

echo "CLI VERSION: $CLI_VERSION"
echo "INSTALL_USING_PIPX: $INSTALL_USING_PIPX"

if command -v snow &> /dev/null
then
    echo "Snowcli already installed"
    exit 0
fi


python -m pip install --user pipx

python3 -m pipx install snowflake-cli-labs 