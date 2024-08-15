#!/usr/bin/bash

set -euo pipefail
PIPX_PATH="snow_pipx_path"

# These commands ensure that each time `snow` command is executed the system will use 
# the executable in the pipx installation folder and not in any other installation folder.

export PIPX_BIN_DIR=${PIPX_BIN_DIR:-"${HOME}/.local/bin"}/$PIPX_PATH

mkdir -p "${PIPX_BIN_DIR}"


if [ "$CLI_VERSION" == "latest" ]; then
    pipx install snowflake-cli-labs 
else 
    pipx install snowflake-cli-labs=="$CLI_VERSION"
fi


echo "$PIPX_BIN_DIR" >> "$GITHUB_PATH"
