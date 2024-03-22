#!/bin/sh

set -euo pipefail

if command -v snow &> /dev/null
then
    echo "Snowcli already installed"
    exit 0
fi


if [ "$CLI_VERSION" == "" ]; then
    pipx install snowflake-cli-labs --python $PYTHON_VERSION
else 
    pipx install snowflake-cli-labs==$CLI_VERSION --python $PYTHON_VERSION
fi