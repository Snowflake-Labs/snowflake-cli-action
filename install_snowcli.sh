#!/bin/sh

set -euo pipefail

if [ "$CLI_VERSION" == "" ]; then
    pipx install snowflake-cli-labs 
else 
    pipx install snowflake-cli-labs==$CLI_VERSION 
fi

extension=""
if [[ $RUNNER_OS = "Windows" ]]; then 
    extension=".exe"
fi

mkdir "$PIPX_BIN_DIR/snow_pipx_path"
cp "$PIPX_BIN_DIR/snow$extension" "$PIPX_BIN_DIR/snow_pipx_path"
echo "$PIPX_BIN_DIR/snow_pipx_path" >> $GITHUB_PATH


