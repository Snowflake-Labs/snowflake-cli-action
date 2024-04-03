#!/bin/sh

set -euo pipefail

if command -v snow &> /dev/null
then
    echo "Snowflake CLI already installed"
    exit 0
fi

if [ "$CLI_VERSION" == "" ]; then
    pipx install snowflake-cli-labs 
else 
    pipx install snowflake-cli-labs==$CLI_VERSION 
fi