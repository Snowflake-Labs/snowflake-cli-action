#!/bin/sh

set -euo pipefail

# These commands ensure that each time `snow` command is executed the system will use 
# the executable in the pipx installation folder and not in any other installation folder.
if [ -z "${PIPX_BIN_DIR}" ]; then
    export PIPX_BIN_DIR="~/.local/bin/snow_pipx_path"
else 
    export PIPX_BIN_DIR="$PIPX_BIN_DIR/snow_pipx_path"
fi

mkdir -p "$PIPX_BIN_DIR"



if [ "$CLI_VERSION" == "latest" ]; then
    pipx install snowflake-cli-labs 
else 
    pipx install snowflake-cli-labs==$CLI_VERSION 
fi


echo "$PIPX_BIN_DIR" >> $GITHUB_PATH
