#!/usr/bin/env bash

set -euo pipefail

mkdir -p ./temp/
cp $CONFIG_FILE_PATH ./temp/config.toml

if [[ ! $RUNNER_OS = "Windows" ]]; then 
    chmod 0600 ./temp/config.toml
fi

if [ "$SAVE_CONFIG_FILE_SNOWFLAKE_DIR" = true ]; then
  mkdir -p ~/.snowflake/
  mv "$CONFIG_FILE_PATH" ~/.snowflake/
fi