#!/bin/sh

set -euo pipefail

if [ "$CLI_VERSION" == "" ]; then
    pipx install snowflake-cli-labs 
else 
    pipx install snowflake-cli-labs==$CLI_VERSION 
fi