#!/bin/sh

set -euo pipefail

if [ "$CLI_VERSION" == "latest" ]; then
    pipx install snowflake-cli-labs 
else 
    pipx install snowflake-cli-labs==$CLI_VERSION 
fi

extension=""
if [[ $RUNNER_OS = "Windows" ]]; then 
    extension=".exe"
fi

# These commands ensure that each time `snow` command is executed the system will use 
# the executable in the pipx installation folder and not in any other installation folder.
mkdir "$PIPX_BIN_DIR/snow_pipx_path"
cp "$PIPX_BIN_DIR/snow$extension" "$PIPX_BIN_DIR/snow_pipx_path"
echo "$PIPX_BIN_DIR/snow_pipx_path" >> $GITHUB_PATH


