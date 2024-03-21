#!/usr/bin/env bash

set -euo pipefail

if [[ ! $RUNNER_OS = "Windows" ]]; then 
    chmod 0600 config.toml
fi

if [ "$SAVE_CONFIG_FILE_SNOWFLAKE_DIR" = true ]; then
  mkdir -p ~/.snowflake/
  mv "$$CONFIG_FILE_PATH" ~/.snowflake/
fi