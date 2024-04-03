#!/bin/sh

set -euo pipefail

if [ "$CLI_VERSION" == "" ]; then
    pipx install snowflake-cli-labs 
else 
    pipx install snowflake-cli-labs==$CLI_VERSION 
fi

echo "$PATH"
echo $(ls /home/runner/.local/bin)
echo  $PIPX_HOME
echo $(ls $PIPX_HOME)
echo $PIPX_BIN_DIR
echo $(ls $PIPX_BIN_DIR)
mkdir $PIPX_BIN_DIR/snow_ensure_pipx_path
cp $PIPX_BIN_DIR/snow $PIPX_BIN_DIR/snow_ensure_pipx_path
PATH=$PIPX_BIN_DIR/snow_ensure_pipx_path:$PATH
echo $(ls $PIPX_BIN_DIR)